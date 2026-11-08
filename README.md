# CertifyX 

CertifyX is a certificate collection, management, and verification application. This repository is separated into a **frontend** (the website) and a **backend** (Supabase database, server functions, and tests).

> **Code-preservation note:** This documentation edition adds Markdown guides only. It does not edit the application's HTML, JavaScript, CSS, SQL, configuration, or test source files. Existing files remain where they are in this organized project.

## Start here

1. Read [`frontend/README.md`](frontend/README.md) to understand the website.
2. Read [`backend/README.md`](backend/README.md) to understand the server side.
3. Read [`backend/supabase/README.md`](backend/supabase/README.md) for database and deployment concepts.
4. Read [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for how a request travels through the complete system.
5. Read [`docs/SETUP_AND_DEPLOYMENT.md`](docs/SETUP_AND_DEPLOYMENT.md) before configuring a real environment.

## Repository map

```text
certifyx-main/
├── frontend/                  # Browser application
│   ├── index.html             # Main student/faculty application page
│   ├── check.html             # Setup and connection diagnostics
│   ├── verify.html            # Public certificate verification page
│   ├── app.js                 # Main browser application logic
│   ├── config.js              # Public Supabase connection settings
│   ├── styles.css             # Application styles
│   ├── sw.js                  # Service worker / offline cache behavior
│   ├── manifest.webmanifest   # Installable web-app metadata
│   └── icons/                 # PWA and home-screen icons
├── backend/                   # Server-side application
│   ├── supabase/               # Supabase configuration, SQL and functions
│   ├── tests/                  # Automated and browser tests
│   ├── package.json            # Node package metadata for tests/tools
│   └── run-tests.sh            # Test runner
├── docs/                      # Additional beginner-friendly guides
└── README.md                  # This guide
```

## What the main parts do

- **Students** sign in using their roll number and an access code, view requirements, and submit certificate files/details.
- **Faculty/admin users** sign in through Google and manage student records, requirements, submissions, reviews, and administrative operations.
- **Supabase** provides authentication, PostgreSQL data storage, and Edge Functions.
- **Google Drive and Sheets** are used by the backend integration for file storage and spreadsheet synchronization.
- **Verification** provides a public-facing page that checks a certificate using its verification identifier.

Read the individual folder guides for exact file responsibilities and commands. Do not assume a feature is production-ready merely because its code exists; follow the staging checklist and test real provider integrations.
