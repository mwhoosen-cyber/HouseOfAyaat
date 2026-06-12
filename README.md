# House of Ayaat

The official website for **House of Ayaat** — a South African creative lifestyle and publishing brand by writer, artist and educator **Farhana Yunnus**, rooted in Islamic-inspired art, spiritual reflection and mindful craft. Home of the book *Dear Waheed* (Penguin Random House South Africa).

## About the site

A single, self-contained `index.html` — no frameworks, no build step. Embedded CSS and vanilla JavaScript. Events and press items are managed as JSON arrays in the script block at the bottom of the file.

Highlights:
- Signature ink-bleed hero with an enso that brushes itself on as the page loads
- Choreographed scroll reveals, parallax book cover, and a literary, book-inspired layout
- Fully responsive (mobile-first) and accessible (`prefers-reduced-motion`, keyboard focus, ARIA labels)
- Optimised imagery and rich social/WhatsApp link previews (Open Graph + Twitter cards)

## Deployment (GitHub Pages)

1. Push to the `main` branch (already configured).
2. In the repo: **Settings → Pages → Build and deployment → Source: Deploy from a branch**, branch `main`, folder `/ (root)`.
3. The site publishes at `https://mwhoosen-cyber.github.io/HouseOfAyaat/`.

> The social-share image and canonical URLs in `index.html` point at the GitHub Pages address. If you move to a custom domain, update the `og:url`, `og:image`, `twitter:image` and `canonical` tags in the `<head>`.

## Editing content

- **Events** — edit the `EVENTS` array in the `<script>` block. While it's empty, "coming soon" placeholders are shown.
- **Press** — edit the `PRESS` array in the same block.
- **WhatsApp group link** — replace the `#` placeholder on the elements with `id="waEvents"` and `id="waFooter"`.
- **Instagram / contact email** — update the links in the footer.

## Assets

Optimised, web-served images: `logo-small.png`, `logo-hero.png`, `farhana-web.jpg`, `dear-waheed-web.jpg`, `og-image.jpg`, plus the favicon set. The original high-resolution source files are also kept in the repository.

---

*Prepared for House of Ayaat · Farhana Yunnus*
