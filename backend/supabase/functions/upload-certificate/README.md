# `upload-certificate` Edge Function

**Purpose:** Provides a dedicated certificate upload endpoint. The current entry point authenticates the caller, reads multipart form data, validates the requested student roll number against the authenticated profile, loads relevant settings, and uses the Google integration/shared upload logic.

**Dependencies:** `../_shared/http.js`, `../_shared/core.js`, and `../_shared/google.js`, plus the database schema and configured Google credentials.

**Debugging checklist:** Check authentication, multipart field names, file presence/type/size validation, roll-number ownership, database settings, Google token availability, Drive permissions, and the returned error. Use a staging account and a non-sensitive test document.
