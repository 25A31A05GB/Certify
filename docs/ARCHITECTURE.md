# CertifyX architecture — end-to-end explanation

## Big picture

CertifyX has three main runtime pieces:

1. **Browser frontend:** HTML creates the page, CSS styles it, and JavaScript handles interaction.
2. **Supabase backend:** PostgreSQL stores application data; Supabase Auth identifies users; Edge Functions run trusted server-side operations.
3. **Google services:** Drive and Sheets are external services used by the backend for certificate files and spreadsheet synchronization.

```text
Student / Faculty browser
        |
        | HTML + CSS + JavaScript
        v
   frontend/
        |\
        | \ HTTPS requests / Supabase client
        |  \
        v   v
 Supabase Auth   Supabase Edge Functions
                       |
                       +---- PostgreSQL database
                       |
                       +---- Google Drive API
                       |
                       +---- Google Sheets API

Public verification page ---> verify-certificate function ---> database lookup
```

## Student sign-in and upload (conceptual flow)

1. The student opens the main page and supplies their roll number and access code.
2. The frontend sends the request to the student-facing backend endpoint.
3. The backend validates the credentials and issues/validates the student session mechanism used by this project.
4. The frontend requests the student's overview and requirements.
5. When a certificate is submitted, the browser sends the required form data/file to the backend.
6. The backend validates the session and ownership, handles storage/integration work, and records the result in the database.
7. The frontend displays the response.

The exact request fields and session format are defined by the current implementation; consult `student-api/index.js`, `upload-certificate/index.js`, and the student-related functions in `_shared/core.js`.

## Faculty/admin flow (conceptual)

1. Faculty/admin users authenticate through the configured Google/Supabase authentication flow.
2. The frontend loads the administrative data and views.
3. Administrative actions call protected Supabase APIs or Edge Functions.
4. Backend authorization checks the caller and performs allowed database operations.
5. The UI refreshes to show the result.

Never rely only on frontend role checks. Backend authorization and database policies are essential.

## Google connection flow

1. An authorized user initiates the connection from the app.
2. `google-connect` creates an OAuth authorization flow and signed state.
3. Google displays a consent screen.
4. Google redirects to `google-callback`.
5. The callback validates state and exchanges the authorization code.
6. Sensitive token material is stored/handled on the backend using the configured encryption secret.
7. Later server operations use the protected token to call Drive/Sheets APIs.

## Public verification flow

The visitor opens `verify.html` with a verification ID. The page calls `verify-certificate`; the backend looks up the record and returns only the permitted verification result. The backend—not the browser—must decide what personal information can be exposed.

## Where to debug

| Symptom | Start investigating |
|---|---|
| Page does not load | Browser console, `index.html`, script paths, `app.js` startup |
| Supabase connection fails | `frontend/config.js`, network tab, `check.html` |
| Student cannot sign in | `student-api`, shared student login/session logic, relevant database rows |
| Upload fails | Browser network request, upload endpoint, file validation, Drive permissions, function logs |
| Google connection fails | OAuth redirect URI, `google-connect`, `google-callback`, secrets, Google Cloud consent setup |
| Spreadsheet not updated | `sync-drive-sheet`, shared sync logic, Google token and spreadsheet settings |
| Verification fails | URL query parameter, `verify.html`, `verify-certificate`, verification record |

