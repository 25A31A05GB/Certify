# Frontend guide

The frontend is a static HTML, CSS, and browser-JavaScript application. It is served by a static host such as Vercel. It communicates with Supabase APIs and Supabase Edge Functions over HTTPS.

## Files

| File | Responsibility | Beginner explanation |
|---|---|---|
| `index.html` | Main application screen and page structure | Contains the HTML elements that JavaScript fills and controls. It loads the Supabase browser library, then `config.js`, then `app.js`. |
| `app.js` | Main application behavior | Handles startup, sign-in flows, student and faculty views, data loading, forms, actions, and rendering. It is the main place to trace a UI interaction. |
| `config.js` | Browser-safe Supabase settings | Defines the project URL and public anon key used by the browser. This is public configuration, not a place for secrets. |
| `styles.css` | Visual design | Defines layout, colors, typography, responsive behavior, and component appearance. |
| `check.html` | Setup diagnostics | Displays checks for Supabase connectivity, database/API access, functions, profile setup, and service-worker state. |
| `verify.html` | Public verification page | Reads a verification ID from the URL and requests the verification function. |
| `sw.js` | Service worker | Controls browser caching/offline behavior. When frontend files change, stale caches may need to be cleared or the cache version updated by the maintainer. |
| `manifest.webmanifest` | PWA metadata | Describes the app name, icons, and install/display behavior to supported browsers. |
| `icons/` | App icons | Images used by the browser and installed-PWA experience. |

## Page loading sequence

On the main page, the browser reads `index.html`, loads the Supabase JavaScript library, loads `config.js` to define `window.CX`, and then loads `app.js`. The application code can therefore use both the Supabase client library and the configuration object. Keep this order intact if you later change the HTML.

## How to trace a frontend feature

1. Find the visible element in `index.html` (its `id`, class, or `data-*` attribute).
2. Search for that identifier or action name in `app.js`.
3. Follow the event handler to the function that performs the work.
4. If it calls Supabase directly, inspect the table/RPC call. If it calls a function, find the matching folder under `backend/supabase/functions/`.
5. Inspect the response handling and the code that updates the page.

Useful search commands from the repository root:

```bash
grep -n "data-act" frontend/index.html
grep -n "data-act\|addEventListener\|async function" frontend/app.js
grep -n "functions/v1\|from(" frontend/app.js
```

## Configuration and security

`config.js` is downloaded by every visitor. Only the Supabase project URL and public anon/publishable key belong there. Never put a service-role key, Google client secret, token-encryption key, cron secret, or private access token in frontend code. Database permissions must be enforced by Row Level Security and backend authorization—not by hiding buttons in the UI.

## Local preview

Run a static web server from the `frontend` directory rather than opening HTML files using `file://`:

```bash
cd frontend
python -m http.server 8000
```

Then open `http://localhost:8000`. The site still needs valid Supabase configuration and deployed backend functions for live features to work.

## Deployment

For Vercel, set the project Root Directory to `frontend`. This is a static frontend: no build step is normally required. See [`../docs/SETUP_AND_DEPLOYMENT.md`](../docs/SETUP_AND_DEPLOYMENT.md).
