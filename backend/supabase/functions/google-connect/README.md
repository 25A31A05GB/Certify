# `google-connect` Edge Function

**Purpose:** Starts or manages the application's Google connection flow. It authenticates the application user, handles the requested connection action, creates/verifies Google resources as appropriate, and works with OAuth state/token helpers.

**Dependencies:** `../_shared/http.js`, `../_shared/google.js`, and `../_shared/oauth.js`. It expects the required Google client configuration and token-encryption secret to be configured as backend environment secrets.

**Concepts:** OAuth lets a user authorize an application to access specific Google resources. A signed state value helps bind the callback to the initiated flow. Refresh tokens must be protected and must never be sent to the browser.
