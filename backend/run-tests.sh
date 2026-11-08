#!/bin/sh
cd "$(dirname "$0")" || exit 1
python3 tests/lint_schema.py || exit 1          # 0) static checks of supabase/schema.sql
node --no-warnings --test tests/core.test.mjs tests/student.test.mjs || exit 1
python3 tests/e2e.py
