# Frontend HTML pages guide

## `index.html`

The main application shell. It contains the layout containers, navigation, panels, dialogs, and elements that `app.js` updates. It loads the Supabase browser library first, then `config.js`, then `app.js`. The script order is important.

## `check.html`

A diagnostic page for checking whether the browser can reach configured Supabase endpoints and whether expected tables/functions and browser service-worker state are available. Use it during setup and troubleshooting. It is not a substitute for server logs, security testing, or end-to-end acceptance tests.

## `verify.html`

A public verification page. It reads the certificate identifier from the page URL, calls the `verify-certificate` Edge Function, and displays the result. The server function is responsible for deciding what verification information may be returned publicly.

## Related files

- `manifest.webmanifest` describes the installable web application.
- `sw.js` implements the service worker and caching behavior.
- `icons/` stores images referenced by the manifest and page metadata.

When renaming or moving any page, update every relative link, script, stylesheet, manifest, icon, and service-worker path that refers to it.
