# `manifest.webmanifest` and icons

The web app manifest provides metadata used by browsers when offering an installable app experience. It typically declares the application name, short name, start URL, display mode, theme/background colors, and icon paths.

The `icons/` folder contains the images referenced by the manifest and page metadata. If an icon is renamed or moved, update its reference in the manifest and any HTML link tags. Keep the required icon sizes and formats valid.

The manifest does not implement application logic; it describes how supported browsers present/install the web app.
