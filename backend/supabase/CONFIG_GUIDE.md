# `config.toml` — Supabase CLI configuration

This file configures the local Supabase CLI project behavior. It is not the same as the browser's `frontend/config.js` and it is not a safe place for application secrets.

The Supabase CLI reads this configuration when commands are run from the `backend` directory (the directory that contains `supabase/`). Review the file before changing project IDs, API/database ports, function settings, or local service configuration.

Do not paste service-role keys, Google client secrets, refresh tokens, or encryption keys into this file. Use the Supabase project's secret/environment configuration for private runtime values.
