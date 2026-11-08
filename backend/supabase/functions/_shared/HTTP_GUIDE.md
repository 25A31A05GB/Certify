# `_shared/http.js` — HTTP and authentication helpers

This module centralizes shared HTTP behavior. It defines CORS response headers, a JSON response helper, a Supabase service-role database client factory, and a request identity/authentication helper.

## Concepts

- **CORS headers** tell browsers which cross-origin requests are permitted. CORS is not authentication.
- **JSON response helper** standardizes API responses and content type.
- **Service database client** uses privileged backend credentials and must remain server-side.
- **Request identity helper** inspects request authentication and resolves the caller identity according to the implementation.

Review this file carefully before changing authorization behavior. A service-role client can bypass normal RLS protections, so every endpoint using it must enforce the appropriate authorization itself.
