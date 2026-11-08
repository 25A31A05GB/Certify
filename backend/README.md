# Backend guide

The backend folder contains the Supabase project: database schema and seed SQL, Edge Functions, shared server-side modules, and tests. Supabase hosts the PostgreSQL database and executes the Edge Functions using the Deno runtime.

## Directory map

```text
backend/
├── supabase/
│   ├── config.toml            # Supabase CLI project configuration
│   ├── schema.sql             # Database objects, policies, functions/triggers (see source)
│   ├── seed.sql               # Optional starter/reference data
│   └── functions/             # HTTP Edge Function endpoints
│       ├── _shared/           # Shared server-side code
│       └── <function>/        # One endpoint per folder, entry point index.js
├── tests/                    # Unit, static, and browser tests
├── package.json              # Node ESM package metadata
└── run-tests.sh              # Test command sequence
```

## Backend responsibilities

- Authenticate requests and check roles/permissions.
- Read and write application records in PostgreSQL.
- Validate student identity, access codes, submissions, and administrative actions.
- Handle certificate storage and verification workflows.
- Coordinate Google Drive and Google Sheets operations.
- Run scheduled/background-style operations when invoked by an authorized scheduler or administrator.

## Runtime distinction

The Edge Functions run on Supabase's Deno runtime, not in the user's browser. The tests use Node.js for JavaScript test execution and Python for some static/browser test helpers. Install the tools required by the relevant test before running it.

## Run tests

From the repository root:

```bash
sh backend/run-tests.sh
```

The script runs the schema static checks, Node unit tests, and then the Python end-to-end test runner. Browser tests require the browser automation dependencies and Chromium. A failure caused by missing Chromium is an environment/setup issue; it is not evidence that the browser flow passed.

## Important security rule

Never expose `SUPABASE_SERVICE_ROLE_KEY`, Google OAuth client secrets, `TOKEN_ENC_KEY`, or `x-cron-secret` values in frontend files, source control, screenshots, or public documentation. Store secrets in Supabase Edge Function secrets. Review Row Level Security policies before deploying.
