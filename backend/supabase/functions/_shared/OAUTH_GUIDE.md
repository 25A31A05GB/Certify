# `_shared/oauth.js` — OAuth and token protection

This module contains reusable Google OAuth helpers. The current exports cover OAuth scopes and spreadsheet headers, signed state creation/verification, encryption/decryption of stored tokens, authorization URL creation, authorization-code exchange, and initial Drive/Sheets resource creation.

## OAuth flow in simple terms

1. The application sends the user to Google's authorization page.
2. Google asks the user to approve requested permissions.
3. Google redirects back with a short-lived authorization code and state value.
4. The backend verifies the state and exchanges the code for tokens.
5. The backend stores sensitive token data securely and uses it for later API calls.

## Security

The state-signing secret and token-encryption key must be private backend secrets. Do not log tokens, put them in frontend JavaScript, or commit them to Git. The redirect URI configured in Google Cloud must match the callback URL used by this project.
