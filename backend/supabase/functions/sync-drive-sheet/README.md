# `sync-drive-sheet` Edge Function

**Purpose:** Synchronizes application certificate/submission information with configured Google Drive and Google Sheets resources. The entry point supports authenticated administrative invocation and a protected scheduler/cron invocation, then delegates synchronization to shared logic.

**Dependencies:** `../_shared/http.js`, `../_shared/core.js`, `../_shared/google.js`, database settings, Google Drive/Sheets permissions, and the cron secret if scheduler invocation is enabled.

**Debugging checklist:** Check the caller/cron authorization path, configured Drive folder and spreadsheet identifiers, Google token validity, sheet headers, data mapping, and function logs. Test against a dedicated spreadsheet before enabling scheduled synchronization.
