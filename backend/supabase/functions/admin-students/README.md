# `admin-students` Edge Function

**Purpose:** Handles administrative operations related to student records. The entry point authenticates/authorizes the request and delegates supported operations to shared logic.

**Dependencies:** `../_shared/http.js` and `../_shared/core.js`, together with the student-related tables and policies in `../../schema.sql`.

**Debugging checklist:** Confirm the caller is an authorized faculty/admin user, inspect the requested action and payload, validate roll numbers and fields, and review the response. Test with non-production records before applying bulk changes.
