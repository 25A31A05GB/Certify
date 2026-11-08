# `_shared/google.js` — Google API access

This module handles reusable Google credential/API behavior for the Edge Functions. Its exported helpers include the logic to obtain/refresh a Google token and a helper for creating the real Google API access wrapper used by application workflows.

## Concepts

Google access tokens are short-lived credentials. Refresh tokens are long-lived and especially sensitive. The frontend should never receive a refresh token or Google client secret. Keep credentials in backend environment secrets and protected database storage as implemented by the project.

## Debugging

Check the OAuth connection state, token refresh response, granted scopes, Drive/Sheets permissions, and Supabase function logs. Do not print token values in logs. Test with a dedicated Google account and non-production files.
