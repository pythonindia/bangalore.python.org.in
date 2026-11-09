// Colour theme. The site follows the system setting until the reader picks a
// theme with the header button. The choice is saved in localStorage and set as
// data-theme on <html>. Loaded without defer, before the stylesheet, so a saved
// theme applies before the first paint.
(function () {
    'use strict';

    var root = document.documentElement;
    var system = window.matchMedia('(prefers-color-scheme: dark)');
    var THEME_COLORS = { light: '#ffffff', dark: '#071a2e' };
    var GISCUS_ORIGIN = 'https://giscus.app';
    var giscusReady = false;

    function savedTheme() {
        try {
            var theme = localStorage.getItem('theme');
            return theme === 'light' || theme === 'dark' ? theme : null;
        } catch (error) {
            return null;
        }
    }

    function saveTheme(theme) {
        try {
            if (theme) {
                localStorage.setItem('theme', theme);
            } else {
                localStorage.removeItem('theme');
            }
        } catch (error) {
            // Storage is blocked: the choice lasts until the next page load.
        }
    }

    function systemTheme() {
        return system.matches ? 'dark' : 'light';
    }

    function activeTheme() {
        return root.getAttribute('data-theme') || systemTheme();
    }

    function sendGiscusTheme() {
        var frame = document.querySelector('iframe.giscus-frame');
        if (!giscusReady || !frame) return;
        frame.contentWindow.postMessage(
            { giscus: { setConfig: { theme: root.getAttribute('data-theme') || 'preferred_color_scheme' } } },
            GISCUS_ORIGIN
        );
    }

    // Brings the button label, browser toolbar colour and comments in line
    // with the theme. The page colours themselves come from the stylesheet.
    function update() {
        var chosen = root.getAttribute('data-theme');
        var label = 'Switch to ' + (activeTheme() === 'dark' ? 'light' : 'dark') + ' theme';

        document.querySelectorAll('.theme-toggle').forEach(function (button) {
            button.title = label;
            button.querySelector('.visually-hidden').textContent = label;
        });

        document.querySelectorAll('meta[name="theme-color"]').forEach(function (meta) {
            var scheme = (meta.getAttribute('media') || '').indexOf('dark') === -1 ? 'light' : 'dark';
            meta.setAttribute('content', THEME_COLORS[chosen || scheme]);
        });

        sendGiscusTheme();
    }

    function setTheme(theme) {
        if (theme) {
            root.setAttribute('data-theme', theme);
        } else {
            root.removeAttribute('data-theme');
        }
        update();
    }

    setTheme(savedTheme());
    root.classList.add('has-theme-toggle');
    document.addEventListener('DOMContentLoaded', update);

    document.addEventListener('click', function (event) {
        if (!event.target.closest('.theme-toggle')) return;
        var theme = activeTheme() === 'dark' ? 'light' : 'dark';
        // Choosing the system's own theme goes back to following the system.
        var choice = theme === systemTheme() ? null : theme;
        saveTheme(choice);
        setTheme(choice);
    });

    system.addEventListener('change', update);

    // Keep other open tabs in step.
    window.addEventListener('storage', function (event) {
        if (event.key === 'theme' || event.key === null) setTheme(savedTheme());
    });

    // giscus loads lazily. Its first message means the iframe can take a theme.
    window.addEventListener('message', function (event) {
        if (event.origin !== GISCUS_ORIGIN || giscusReady) return;
        giscusReady = true;
        if (root.hasAttribute('data-theme')) sendGiscusTheme();
    });
})();
