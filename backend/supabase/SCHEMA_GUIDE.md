# `schema.sql` — database structure guide

`schema.sql` defines the database objects CertifyX expects. This can include tables, columns, keys, indexes, constraints, SQL functions, triggers, and Row Level Security policies. The exact definitions in the SQL file are authoritative; this guide explains how to read them rather than duplicating every column (which can become outdated).

## How to read the schema

1. Start at the top and identify extensions or helper functions.
2. Find each `CREATE TABLE` statement. Record what one row represents and how it relates to other tables.
3. Find primary keys (`PRIMARY KEY`) and foreign keys (`REFERENCES`).
4. Find indexes (`CREATE INDEX`) and understand which lookup they optimize.
5. Find `ENABLE ROW LEVEL SECURITY` and every `CREATE POLICY`. These policies determine which users can read or change rows.
6. Find SQL functions and triggers. Note which tables they read/write and which roles can execute them.

## Safe database changes

- Do not delete a column or table until you have searched the entire frontend, Edge Functions, tests, and SQL for its use.
- Consider existing data before changing a type, constraint, or default.
- Review RLS policies whenever a new table or operation is added.
- Test with student, faculty, admin, and unauthenticated accounts as applicable.
- Back up production data and use a migration/review process for production changes.

## Validation

The project includes `backend/tests/lint_schema.py` for static schema checks. Static checks do not prove that a live PostgreSQL database accepts the schema or that RLS behaves correctly for real authenticated users. Those require a staging Supabase project.
