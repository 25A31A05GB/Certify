# `admin-remove` Edge Function

**Purpose:** Performs an administrative certificate-removal/duplicate-cleanup workflow. The current entry point checks the caller, reads settings and certificate records, identifies requested targets or duplicates, and delegates removal work to shared logic with the Google integration.

**Dependencies:** `../_shared/http.js`, `../_shared/core.js`, and `../_shared/google.js`.

**Caution:** Removal can affect both database records and linked Drive resources. Before testing, use a staging project and disposable files. Confirm which records are selected and understand whether the operation is reversible.
