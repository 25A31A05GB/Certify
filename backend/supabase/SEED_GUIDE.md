# `seed.sql` — starter data guide

Seed SQL inserts initial or example records into the database. It is useful for preparing a development environment, but it can also create duplicate or unwanted records if executed repeatedly or against an existing database.

Before running it:

1. Read every `INSERT`, `UPDATE`, `DELETE`, and conflict-handling clause.
2. Identify which tables and records it affects.
3. Confirm whether it is safe to run more than once.
4. Use a development/staging database first.
5. Never assume seed data represents real student or certificate records.

Do not run seed scripts against production without an explicit data plan and backup.
