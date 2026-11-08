# `verify-certificate` Edge Function

**Purpose:** Looks up a certificate using the `id` query parameter and returns the public verification result produced by shared verification logic. The frontend public page `frontend/verify.html` calls this endpoint.

**Request shape:** The page calls the function using a URL similar to `/functions/v1/verify-certificate?id=...`. The exact response fields and public disclosure rules are defined by `index.js` and `verifyCore()` in `../_shared/core.js`.

**Security note:** Treat the verification ID as an identifier, not as permission to disclose private student information. Review the function response and database access rules before changing what is returned.
