# Backend tests guide

The tests directory contains automated checks for business logic, student workflows, schema shape, and browser-facing flows.

| File | Role |
|---|---|
| `core.test.mjs` | Node tests for shared/core business logic. |
| `student.test.mjs` | Node tests for student access/session/API behavior. |
| `fakes.mjs` | Test doubles/fake dependencies used to isolate code in tests. |
| `supabase-mock.js` | Mock Supabase behavior for tests that should not require a live project. |
| `lint_schema.py` | Static checks over the SQL schema. |
| `server.mjs` | Local test server used by browser/end-to-end checks. |
| `e2e.py` | Python end-to-end/browser test runner. |

## Run

From the repository root:

```bash
sh backend/run-tests.sh
```

If the browser stage reports that Chromium is missing, install the browser automation dependencies required by `e2e.py` and rerun. Do not report browser tests as passed if they did not execute.

## What mocked tests do not prove

A mocked test can verify application logic under controlled inputs. It does not prove that real Supabase authentication, PostgreSQL RLS, deployed Edge Function permissions, Google OAuth, Drive/Sheets access, or production data behavior works. Those require integration testing against a dedicated staging environment.
