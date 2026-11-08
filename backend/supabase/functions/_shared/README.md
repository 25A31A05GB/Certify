# Shared Edge Function modules

These modules contain reusable server-side code. They are imported by one or more Edge Functions. They are not separate HTTP endpoints.

| File | Purpose |
|---|---|
| `core.js` | Core business logic and reusable operations: normalization, certificate and duplicate helpers, upload/sync workflows, student access-code/session operations, student/admin APIs, reminders, and verification logic. |
| `google.js` | Google token retrieval/refresh and construction of the real Google API client/helper. |
| `http.js` | Common HTTP response/CORS helpers, Supabase service client creation, and request identity/authentication helper. |
| `oauth.js` | Google OAuth helpers, state signing/verification, token encryption/decryption, authorization URL/code exchange, and Drive/Sheets resource setup. |

## Why shared code exists

Without shared modules, every endpoint would need to duplicate authentication, database, Google integration, or business rules. Shared functions reduce duplication and help keep behavior consistent.

## Beginner reading order

Start with `http.js` to understand the common request/database helpers. Then read `core.js` to understand application business rules. Read `oauth.js` and `google.js` when studying Google authorization and API access. Finally, return to an endpoint to see how these helpers are combined.

## Change caution

A change to a shared helper can affect several endpoints at once. Search all imports/usages and run the complete test suite after modifying one.
