# `app.js` — application logic guide

`app.js` is the browser-side controller for the main CertifyX experience. It is a large, single JavaScript file in the supplied project; this guide explains how to navigate it without changing or splitting the code.

## What it is responsible for

At a high level, the file coordinates: application startup; Supabase client setup; student sign-in and session handling; faculty/admin authentication and views; loading students and certificates; rendering dashboard sections; forms and dialogs; certificate uploads and actions; Google connection/synchronization actions; notifications and exports. The exact behavior is defined by the source code, so use the function names and current implementation as the authority.

## Useful landmarks

The following names are useful search landmarks in the current file (line numbers may change if the source is updated):

| Name / landmark | What to look for |
|---|---|
| `boot()` / `boot2()` | Application initialization and initial routing |
| `loginGate()` | Student sign-in interface |
| `sapi()` | Calls to the student API function |
| `startStudent()` / `pollStudent()` | Student session startup and refresh |
| `loadFaculty()` | Faculty-side data loading |
| `setView()` / `renderView()` | Switching and rendering application sections |
| `viewRequirements()` | Requirements screen |
| `viewAccess()` | Student access-code management screen |
| `viewReview()` | Review screen |
| `viewAlerts()` / `loadRecent()` | Alerts and recent activity |
| `buildStudent()` / `paintStudent()` | Student-side screen construction and rendering |
| `imageToPdf()` | File/image preparation helper |
| `doSync()` | Google synchronization action |

## How to understand one user action

Example approach: if you want to understand what happens when a faculty member presses a button, first locate the button in `index.html`. Note its `data-act` value. Search for that value in `app.js`; follow the event-dispatch code to the matching handler. Continue into any helper function it calls. If the handler sends a request to `/functions/v1/<function-name>`, open the matching backend function folder.

## Important concepts

- **State variables** hold information currently loaded in the browser, such as students, certificates, settings, the current user, and the active view.
- **Rendering functions** convert current state into HTML shown in the page.
- **Event handlers** respond to clicks, form submissions, and other user actions.
- **API calls** send requests to Supabase or Edge Functions. A successful UI action should be backed by a successful server response.
- **Escaping/validation** matters whenever user-controlled values are inserted into HTML or sent to the backend. Do not remove existing validation casually.

## Safe change procedure

Before changing this file, identify the complete call path and all places that use the same state or helper. Make one small change at a time, run the backend tests, and manually test the affected browser flow against a staging Supabase project. This documentation does not claim that every UI flow has been browser-tested.
