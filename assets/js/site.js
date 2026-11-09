// Site behaviour: mobile navigation, post search and the copy-link button.
// Loaded with `defer`; the page works without it apart from search.
(function () {
    'use strict';

    // Mobile navigation
    var toggle = document.querySelector('.nav-toggle');
    var nav = document.getElementById('site-nav');

    function setNavOpen(open) {
        toggle.setAttribute('aria-expanded', String(open));
        nav.toggleAttribute('data-open', open);
    }

    if (toggle && nav) {
        toggle.addEventListener('click', function () {
            setNavOpen(toggle.getAttribute('aria-expanded') !== 'true');
        });
        document.addEventListener('keydown', function (event) {
            if (event.key === 'Escape' && nav.hasAttribute('data-open')) {
                setNavOpen(false);
                toggle.focus();
            }
        });
    }

    // Search. The index is only downloaded the first time search is opened.
    var dialog = document.getElementById('search-dialog');
    var input = document.getElementById('search-input');
    var status = dialog && dialog.querySelector('.search-status');
    var list = dialog && dialog.querySelector('.search-results');
    var indexRequest = null;
    var MAX_RESULTS = 20;

    function loadIndex() {
        if (!indexRequest) {
            indexRequest = fetch(dialog.dataset.index, { credentials: 'same-origin' })
                .then(function (response) {
                    if (!response.ok) throw new Error('HTTP ' + response.status);
                    return response.json();
                })
                .then(function (docs) {
                    return docs.map(function (doc) {
                        return {
                            doc: doc,
                            title: doc.title.toLowerCase(),
                            tags: doc.tags.toLowerCase(),
                            body: doc.body.toLowerCase()
                        };
                    });
                })
                .catch(function (error) {
                    indexRequest = null;
                    throw error;
                });
        }
        return indexRequest;
    }

    // Every term must appear somewhere; title and tag matches rank higher.
    function search(entries, query) {
        var terms = query.toLowerCase().split(/\s+/).filter(function (term) {
            return term.length > 1;
        });
        if (!terms.length) return [];
        var results = [];
        entries.forEach(function (entry, position) {
            var score = 0;
            for (var i = 0; i < terms.length; i++) {
                var term = terms[i];
                var termScore = (entry.title.indexOf(term) !== -1 ? 10 : 0) +
                    (entry.tags.indexOf(term) !== -1 ? 4 : 0) +
                    (entry.body.indexOf(term) !== -1 ? 1 : 0);
                if (!termScore) return;
                score += termScore;
            }
            results.push({ doc: entry.doc, score: score, position: position });
        });
        // The index is newest first, so ties keep the newer post on top.
        results.sort(function (a, b) {
            return b.score - a.score || a.position - b.position;
        });
        return results.slice(0, MAX_RESULTS).map(function (result) {
            return result.doc;
        });
    }

    function excerpt(body, query) {
        var at = body.toLowerCase().indexOf(query.toLowerCase().split(/\s+/)[0]);
        var start = Math.max(0, at - 60);
        return (start > 0 ? '…' : '') + body.slice(start, start + 180) + '…';
    }

    // Results are built with textContent so post text is never parsed as HTML.
    function render(results, query) {
        list.replaceChildren();
        if (!query.trim()) {
            status.textContent = '';
            return;
        }
        status.textContent = results.length
            ? results.length + (results.length === MAX_RESULTS ? '+' : '') + ' posts match “' + query + '”'
            : 'No posts match “' + query + '”. Try fewer or different words.';
        results.forEach(function (doc) {
            if (doc.url.charAt(0) !== '/') return;
            var item = document.createElement('li');
            var link = document.createElement('a');
            var title = document.createElement('strong');
            var meta = document.createElement('span');
            var text = document.createElement('p');
            link.href = doc.url;
            title.textContent = doc.title;
            meta.textContent = doc.date;
            text.textContent = excerpt(doc.body, query);
            link.append(title, meta, text);
            item.append(link);
            list.append(item);
        });
    }

    var pending;
    function runSearch() {
        var query = input.value;
        clearTimeout(pending);
        pending = setTimeout(function () {
            loadIndex().then(function (entries) {
                if (input.value === query) render(search(entries, query), query);
            }, function () {
                status.textContent = 'Search could not load. Check your connection and try again.';
            });
        }, 120);
    }

    function openSearch() {
        if (dialog.open) return;
        dialog.showModal();
        input.focus();
        input.select();
        loadIndex().catch(function () {});
    }

    if (dialog && typeof dialog.showModal === 'function') {
        document.querySelectorAll('.search-open').forEach(function (button) {
            button.addEventListener('click', openSearch);
        });
        dialog.querySelector('[data-close-search]').addEventListener('click', function () {
            dialog.close();
        });
        // A click on the backdrop lands on the dialog element itself.
        dialog.addEventListener('click', function (event) {
            if (event.target === dialog) dialog.close();
        });
        dialog.querySelector('form').addEventListener('submit', function (event) {
            event.preventDefault();
            var first = list.querySelector('a');
            if (first) window.location.href = first.href;
        });
        input.addEventListener('input', runSearch);
        document.addEventListener('keydown', function (event) {
            var target = event.target;
            var typing = target.isContentEditable || /^(INPUT|TEXTAREA|SELECT)$/.test(target.tagName);
            if (event.key === '/' && !typing && !event.ctrlKey && !event.metaKey && !event.altKey) {
                event.preventDefault();
                openSearch();
            }
        });
        document.documentElement.classList.add('has-search');
    }

    // Copy link. The button stays hidden where the Clipboard API is missing.
    if (navigator.clipboard) document.documentElement.classList.add('can-copy');
    document.querySelectorAll('[data-copy-url]').forEach(function (button) {
        var label = button.querySelector('span');
        button.addEventListener('click', function () {
            navigator.clipboard.writeText(button.dataset.copyUrl).then(function () {
                label.textContent = 'Link copied';
                setTimeout(function () { label.textContent = 'Copy link'; }, 2000);
            });
        });
    });
})();
