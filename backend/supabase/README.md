# Supabase project guide

This directory contains the files used by the Supabase CLI and the application database/backend.

## Contents

- `config.toml`: Supabase CLI local/project configuration.
- `schema.sql`: database structure and security definitions. Read it before applying changes; it is the source of truth for tables, constraints, indexes, policies, and SQL routines present in this project.
- `seed.sql`: starter/reference records for development or setup, depending on the statements in the file. Review before running it against any existing database.
- `functions/`: deployable Edge Functions. Each function folder contains an `index.js` entry point. `_shared/` contains code imported by multiple endpoints.

## Key database concepts

- A **table** stores rows of application data.
- A **primary key** uniquely identifies a row.
- A **foreign key** connects related records and helps preserve referential integrity.
- An **index** helps PostgreSQL find records efficiently.
- **Row Level Security (RLS)** determines which rows a user may access through the API.
- A **database function/RPC** runs database-side logic when called through Supabase.

Read the actual SQL before assuming a table's columns or a policy's exact behavior. The schema may evolve as the project changes.

## Supabase CLI basics

Run commands from the `backend` directory, where the `supabase/` folder is located:

```bash
cd backend
supabase login
supabase link --project-ref YOUR_PROJECT_REF
supabase db push
```

Only run `db push` after reviewing the SQL/migrations and confirming the linked project is the intended development or staging project. Back up production data and review migration impact before production changes.

## Edge Function deployment

Deploy individual function names from the `backend` directory, for example:

```bash
supabase functions deploy student-api
```

Use the project's documented JWT verification settings deliberately. Do not copy a `--no-verify-jwt` deployment flag to every function without understanding how that endpoint authenticates requests internally. Verify the function's authorization logic and Supabase gateway configuration first.
