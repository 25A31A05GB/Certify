# `_shared/core.js` — business logic

This is the central shared business-logic module. It contains reusable helpers for roll-number normalization, spreadsheet row mapping, duplicate detection, upload naming/ownership checks, certificate removal/upload/synchronization, system checks, access-code creation and hashing, student login/session validation, student overview and upload, administrative student operations, reminders, and certificate verification.

## How to study it

Read from the top and group functions by topic. Start with the small pure helpers (normalization and formatting), then study the certificate workflows, then the access-code/session functions, then student/admin handlers, and finally reminders and verification.

## Why this file is important

Multiple Edge Functions import this module so that business rules are shared. A bug or behavior change here can affect more than one endpoint. Search imports and callers before editing it, and run the complete test suite after any change.

## Testing

The main automated coverage is in `backend/tests/core.test.mjs` and `backend/tests/student.test.mjs`. Mock-based tests do not replace testing against a real staging database and Google account.
