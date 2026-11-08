# `config.js` — browser configuration

This file defines `window.CX`, the configuration object consumed by the browser application and helper pages. In the current source it contains the Supabase project URL, the public anon key, and an optional email-domain restriction setting.

## What values mean

- `url`: Supabase project URL. Browser requests use this as the API base.
- `anon`: public anon/publishable API key. It identifies the project but does not grant administrator privileges by itself.
- `domain`: optional allowed email domain hint/setting used by the application. Leave it empty unless the institution intentionally wants to restrict sign-in domains and the implementation supports that restriction.

## Public versus secret values

This file is public: visitors can inspect it in their browser. It is acceptable to expose the project's public anon key when database Row Level Security and server authorization are correctly configured. Never put any of these here: Supabase service-role key, Google OAuth client secret, token encryption key, cron secret, private refresh/access token, or passwords.

## How to configure

Use the Supabase Dashboard → Project Settings → API to find the project URL and public anon/publishable key. Replace only the corresponding configuration values, preserving the JavaScript object syntax. Do not copy values into screenshots, public issues, or documentation.

After changing configuration, reload the frontend and visit `check.html` to inspect connectivity. A passing connection check does not prove that every permission, function, Google integration, or production workflow is correct.
