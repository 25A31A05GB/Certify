# Edge Functions guide

Each child folder is a server endpoint. Supabase invokes its `index.js` when a request reaches `/functions/v1/<folder-name>`. The endpoint receives a `Request` and returns a `Response`; these functions use `Deno.serve(...)` to register their HTTP handler.

## Function directory index

| Folder | High-level responsibility |
|---|---|
| `student-api/` | Student-facing API actions and session-aware operations. |
| `upload-certificate/` | Certificate upload endpoint for an authenticated student. |
| `verify-certificate/` | Public certificate verification lookup. |
| `admin-students/` | Administrative student-record operations. |
| `admin-remove/` | Administrative certificate removal/duplicate cleanup flow. |
| `google-connect/` | Starts or manages the Google connection workflow. |
| `google-callback/` | Handles Google's OAuth redirect/callback and token exchange. |
| `sync-drive-sheet/` | Synchronizes application records with Google Drive/Sheets. |
| `send-reminders/` | Sends or coordinates reminder notifications. |
| `_shared/` | Reusable logic imported by multiple endpoints; not a deployable endpoint itself. |

## Request lifecycle

A typical function validates the request, establishes the appropriate database client, authenticates or authorizes the caller, validates input, invokes shared logic or a provider API, and returns a JSON response. The exact sequence differs by endpoint; read its `index.js` before changing it.

## How to trace an endpoint

1. Start with `index.js` in the endpoint folder.
2. Identify the HTTP method, headers, URL parameters, and JSON/form-data fields it reads.
3. Follow imports into `_shared/`.
4. Follow database table/RPC operations into `../schema.sql`.
5. Check the matching tests under `backend/tests/`.
6. Confirm secrets are read from `Deno.env`, not hard-coded.

See the README in each endpoint folder for its specific inputs, responsibilities, and dependencies.
