# `send-reminders` Edge Function

**Purpose:** Runs the reminder workflow. Its entry point supports a protected scheduled invocation and an authenticated application-user path, then delegates reminder selection/processing to shared core logic.

**Dependencies:** `../_shared/http.js` and `../_shared/core.js`, notification-related database tables, and any scheduler secret/configuration used by the deployed project.

**Debugging checklist:** Check authorization, reminder eligibility/date logic, duplicate prevention, notification records, and delivery/provider configuration. Use test recipients or a staging environment to avoid sending unintended messages.
