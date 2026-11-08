# Setup and deployment guide

This guide explains the deployment responsibilities. Use a separate development or staging Supabase project before production.

## Prerequisites

- Git and a terminal.
- A Supabase project and the Supabase CLI.
- Node.js for the Node-based tests.
- Python 3 for Python test helpers.
- Browser automation dependencies and Chromium if running browser tests.
- A Google Cloud project with the required OAuth configuration if enabling Drive/Sheets features.
- A Vercel project (or another static host) for the frontend.

## 1. Configure frontend connection

Open `frontend/config.js` and set the Supabase project URL and public anon/publishable key for the intended environment. This file is public. Never put backend secrets in it.

## 2. Link the Supabase project

```bash
cd backend
supabase login
supabase link --project-ref YOUR_PROJECT_REF
```

Confirm the linked project in the CLI output. Do not accidentally link a production project while experimenting.

## 3. Review and apply the database schema

Read `backend/supabase/schema.sql` and `seed.sql`. Understand tables, policies, and seed effects before applying them. Use the SQL Editor or the project's migration workflow according to the repository's deployment process. If using the CLI setup described in the root README, the command is:

```bash
supabase db push
```

Do not run schema changes against production without a backup and review.

## 4. Configure backend secrets

Set the secrets required by the Edge Functions in Supabase project settings/CLI. Names referenced by the current source include values such as `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`, `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `TOKEN_ENC_KEY`, `SITE_URL`, and a cron secret where scheduled invocation is configured. Check each `Deno.env.get(...)` call in the function source to obtain the exact required names and usage.

The service-role key and encryption/cron secrets are private. Never commit them or expose them in the frontend. Use strong, unique values and rotate them if they are exposed.

## 5. Configure Google OAuth

In Google Cloud Console, configure the OAuth consent screen and the appropriate Drive/Sheets scopes. Add the deployed `google-callback` URL as an authorized redirect URI. Confirm the callback URL and `SITE_URL` are correct for the environment. Grant access only to the intended Google account and resources.

## 6. Deploy Edge Functions

From `backend/`, deploy the functions required by your environment. Example for one function:

```bash
supabase functions deploy student-api
```

Repeat for the endpoints used by the app. Carefully decide whether gateway JWT verification should be enabled for each function. Some endpoints may implement their own authorization, but disabling gateway verification is a security decision and must be reviewed endpoint by endpoint.

## 7. Deploy frontend to Vercel

- Import the repository into Vercel.
- Set Root Directory to `frontend`.
- Choose the static/Other framework preset.
- No build command is normally needed.
- Set output directory to `.`.
- Deploy and open the generated URL.

The frontend deployment does not deploy the Supabase database or functions. Those are deployed separately.

## 8. Run tests

From the repository root:

```bash
sh backend/run-tests.sh
```

Read the test output carefully. If the end-to-end stage cannot run because Chromium or a Python dependency is missing, install it and rerun. A skipped/unavailable browser test is not a pass.

## 9. Staging acceptance checklist

- [ ] Main page loads with no JavaScript errors.
- [ ] `check.html` reports expected connectivity.
- [ ] Student sign-in succeeds and invalid credentials are rejected.
- [ ] Student sees only their own data.
- [ ] Student upload validates file and identity correctly.
- [ ] Faculty/admin access is restricted to authorized users.
- [ ] Review/approve/reject flows work as expected.
- [ ] Google OAuth connect and callback work.
- [ ] Drive file storage and Sheets synchronization work with real test resources.
- [ ] Public verification returns correct status and no unnecessary private data.
- [ ] RLS and Edge Function authorization have been reviewed.
- [ ] Logs do not expose access codes, tokens, or secrets.
- [ ] Mobile and desktop layouts have been checked.

Only after staging acceptance and a production security review should the deployment be promoted.
