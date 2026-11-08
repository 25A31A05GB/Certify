# `google-callback` Edge Function

**Purpose:** Receives Google's OAuth redirect after a user grants or denies consent. The current entry point validates the OAuth state, exchanges the authorization code for tokens, stores protected connection information, and redirects the browser back to the configured site.

**Dependencies:** `../_shared/oauth.js`, `../_shared/http.js`, and Google/Supabase environment secrets.

**Important:** The redirect URL configured in Google Cloud must exactly match the callback URL used by the function. Keep client secrets and refresh tokens on the backend. Test consent, cancellation, expired state, and reconnect behavior in a staging project.
