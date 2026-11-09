# Security policy

This repository is the source of <https://bangalore.pythonindia.org>, a static
Jekyll site served by GitHub Pages.

## Reporting a vulnerability

Please report security issues privately through
[GitHub private vulnerability reporting](https://github.com/pythonindia/bangalore.python.org.in/security/advisories/new),
not in a public issue, pull request or Discord channel.

Include the affected URL or file, what an attacker could do, and steps to
reproduce. A volunteer maintainer will acknowledge the report as soon as they
can and keep you updated in the advisory.

In scope: this website and this repository, including its GitHub Actions
workflows. Out of scope: third-party services we link to or embed (Meetup,
Luma, Discord, Giscus, YouTube) — please report those to the service.

## Maintainer notes

- Private vulnerability reporting must be enabled under
  Settings > Code security for the link above to work.
- `.well-known/security.txt` has an `Expires` date; renew it before then.
- The Content-Security-Policy lives in `_includes/head.html`. Add a host there
  when a post needs a new embed, rather than loosening the policy.
