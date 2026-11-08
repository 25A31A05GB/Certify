# `styles.css` — visual styling guide

This file contains the website's visual rules. It controls typography, colors, spacing, layout, cards, forms, buttons, responsive behavior, and state classes used by the HTML and JavaScript.

## How CSS is applied

The HTML elements in `index.html`, `check.html`, and `verify.html` use element names, classes, IDs, and state classes. `styles.css` contains selectors that match those elements. JavaScript may add or remove classes to represent states such as active, hidden, success, or error.

## Beginner workflow

1. Inspect the element in the HTML and note its class or ID.
2. Search for that selector in `styles.css`.
3. Check whether a more specific selector overrides it later in the file.
4. Make a minimal change and preview at desktop and mobile widths.
5. Check hover, focus, disabled, error, loading, and active states—not only the default appearance.

Avoid deleting selectors just because they appear unused; some are added dynamically by `app.js`. This guide describes the role of the file and does not alter the original design.
