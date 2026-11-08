# `sw.js` — service worker guide

A service worker is a browser-managed script that can intercept network requests and cache selected resources. CertifyX includes `sw.js` for Progressive Web App caching behavior.

## Why it matters

Caching can make repeat visits faster and may support some offline behavior. However, a stale service-worker cache can also make a browser continue using an older copy of HTML, CSS, or JavaScript after a deployment.

## Troubleshooting stale frontend files

1. Open browser developer tools and inspect the Application/Storage section.
2. Check the service-worker registration and cache storage.
3. Use the setup-check page's service-worker/cache clearing option if available.
4. Reload the site.
5. If you change cache behavior in the future, review the cache version and every cached path.

Do not remove service-worker logic without checking the install/offline behavior and the page's registration code.
