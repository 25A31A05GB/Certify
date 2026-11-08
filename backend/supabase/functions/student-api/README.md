# `student-api` Edge Function

**Purpose:** Handles the student-facing API route. The entry point is `index.js`; it checks the request/session and delegates student operations to shared business logic.

**Where to read next:** `../_shared/http.js` for request authentication and database setup; `../_shared/core.js` for student API actions, access-code/session validation, student overview, and upload handling.

**When debugging:** Inspect the HTTP method, authorization/student-token headers, request body or multipart form fields, and the JSON response. Check the corresponding student tests in `backend/tests/student.test.mjs`. Never log access codes or session tokens.
