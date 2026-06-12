# House of Ayaat — Website Plan

**Brand:** House of Ayaat  
**Founder:** Farhana Yunnus — writer, artist, educator  
**Purpose:** South African creative lifestyle and publishing brand rooted in Islamic-inspired art, spiritual reflection, and mindful craft  
**Document status:** Plan · v1.0 · June 2026

---

## 1. Brand Identity

### Colour Palette

| Name | Hex | Usage |
|---|---|---|
| Linen Ground | `#F0EDE6` | Page background, hero |
| Enso Gold | `#A8906A` | Accents, CTAs, dates, borders |
| Ink Black | `#3D3228` | Footer background, primary text |
| Aged Umber | `#7A6855` | Secondary text, muted labels |
| Pale Parchment | `#C9B99A` | Dividers, footer text |
| Pure White | `#FFFFFF` | Card surfaces |

### Typography

| Role | Typeface | Specs |
|---|---|---|
| Display | Cormorant Garamond Italic | 32–52px · italic · hero & pull quotes only |
| Headers | Cormorant Garamond Regular | 18–28px · section headings |
| Navigation & Labels | Montserrat Light | 10–12px · uppercase · letter-spacing 0.18em |
| Body | Lato Light (300) | 15–17px · line-height 1.75 |

### Signature Element — Ink-Bleed Hero Animation

The hero headline appears not by fading in, but by spreading outward as if ink is soaking into paper — beginning as a blurred bloom at the centre of each letterform, then sharpening into legibility over 1.2s, staggered per word. This is implemented via SVG filter blur transitioning from radius 8 → 0, paired with a very slow (8s) upward drift of the linen background. It anchors the brand's literary identity at first glance and directly echoes the fountain pen imagery on the *Dear Waheed* cover.

---

## 2. Site Architecture

```
Home (single-page scroll)
├── Global Navigation
├── Hero
├── About Farhana
├── The Brand
├── Dear Waheed — The Book
├── Events
├── In the Press
├── Journal (optional)
└── Footer
```

Delivered as a **single-file HTML** with embedded CSS and vanilla JS — no frameworks, no build step. Events and press items managed as JSON arrays in the script block. Deployable to GitHub Pages, Netlify, or Vercel with zero configuration.

---

## 3. Sections

### 3.1 Global Navigation

- **Style:** Transparent over the linen hero → white with gold enso on scroll (CSS `position: sticky` + scroll-triggered class swap)
- **Left:** Enso icon + "HOUSE OF AYAAT" in wide-tracked caps
- **Right:** About · Book · Events · Press · Journal · Contact
- **Interaction:** Gold expanding underline on hover (CSS width transition 0 → 100%)
- **Mobile:** Hamburger → full-screen overlay menu, linen background, centred links

---

### 3.2 Hero

- **Layout:** Full viewport height, centred, linen ground
- **Elements:**
  - Enso logo mark as faint watermark behind headline (~20% opacity, large)
  - Eyebrow text: `Islamic art · Spiritual reflection · Mindful craft`
  - Display headline in Cormorant Garamond Italic with **ink-bleed animation**
  - Subline: "A South African creative lifestyle & publishing brand by Farhana Yunnus"
  - Single CTA: `Explore` — border-only button in enso gold
  - Pulsing scroll arrow below
- **Background:** `#F0EDE6` with very slow upward parallax drift (CSS `background-position` transition)

---

### 3.3 About Farhana

- **Layout:** 50/50 split — portrait photo left, text right (stacks on mobile)
- **Photo:** Uploaded portrait, rendered in warm sepia tone (CSS `sepia(30%) contrast(1.05)`), which lifts on hover to full colour
- **Content:**
  - Section eyebrow: `Writer · Artist · Educator`
  - Bio drawn from Penguin bio: Durban & Cape Town, faith, motherhood, resilience, healing through words
  - Pull quote with gold left-border: a line from the *Daily News* interview or the book itself
- **Animation:** Scroll-triggered — photo slides in from left, text from right (Intersection Observer, 20px rise + opacity 0→1)

---

### 3.4 The Brand

- **Layout:** 3-column card grid on desktop, single column on mobile
- **Cards (4 categories):**

| Card | Description |
|---|---|
| Islamic-inspired art | Dua stickers, Quran verse colour-coded jars |
| Spiritual craft | Decoupage workshops, mindful creative sessions |
| Guided workshops | Writing workshops, reflective sessions |
| Publishing | *Dear Waheed* published by Penguin Random House |

- **Style:** White card surface, 0.5px border, gold border on hover, subtle box-shadow lift
- **Animation:** Stagger fade-in on scroll (each card delayed by 100ms from previous)

---

### 3.5 Dear Waheed — The Book

- **Layout:** Full-width feature section, linen background
- **Elements:**
  - Book cover image (uploaded `Dear_Waheed.jpg`) with slow parallax scroll (0.3× scroll depth — the cover moves slower than the page, as if heavier)
  - Title: *Dear Waheed* in display italic
  - Subtitle: "A mother's legacy of love and wisdom in thirty unforgettable letters"
  - Publisher: Penguin Random House South Africa
  - Body copy: 2–3 sentences from the Penguin bio
  - Pull quote strip: sepia-tinted paper texture background with a quote from the book, centred, Cormorant Garamond Italic
- **Purchase CTAs:**
  - Primary (gold filled): `Buy on Penguin SA` → `https://www.penguinrandomhouse.co.za/product/dear-waheed-9278805/`
  - Secondary (border only): `Find at Barfi Books` → link to Barfi Books Durban
  - Tertiary (text link): `Available at Bookmarks Bookshop`

---

### 3.6 Events

- **Layout:** Vertical list with date column in enso gold
- **Each event row contains:**
  - Month (small caps) + Day (large numeral) in gold
  - Event title + venue/city
  - Category pill: `Workshop` / `Book talk` / `Online`
  - Row expands on click (smooth `max-height` transition) to reveal full description + RSVP link
- **Filter pills:** All · Workshop · Book talk · Online
- **Past events:** Dimmed, collapsed behind a "Past events" toggle
- **Data source:** JSON array in script block — easy for Farhana to update without touching HTML structure

---

### 3.7 In the Press

- **Layout:** Card grid — 2 columns on desktop, 1 on mobile
- **Each press card contains:**
  - Publication name + logo (or stylised text)
  - Article headline as a linked title
  - Byline + date
  - 1–2 sentence description (paraphrased, not quoted verbatim)
  - `Read article →` link (opens in new tab)
- **Style:** White cards, gold left-border accent, subtle hover lift
- **Animation:** Stagger fade-in on scroll

#### Initial Press Items

**1. Daily News — April 2026**
- **Title:** Farhana Yunnus's *Dear Waheed*: a heartfelt lockdown read that's more than just letters
- **Byline:** Alyssia Birjalal
- **Published:** 23 April 2026
- **URL:** `https://dailynews.co.za/entertainment/books/2026-04-23-farhana-yusufs-dear-waheed-a-heartfelt-lockdown-read-thats-more-than-just-letters/`
- **Description:** The Daily News explores how Farhana wrote thirty letters to her son during the Covid-19 lockdown — a collection born of distance and faith during Ramadaan that evolved into a universal meditation on love, resilience, and return.

> Additional press items to be added here as coverage is published. The section is designed to grow — new cards are added to the JSON array in the script block.

---

### 3.8 Journal *(optional — Phase 2)*

- **Layout:** 2-column editorial grid
- **Categories:** Faith · Motherhood · Craft · Creativity
- **Implementation options:**
  - Linked to Instagram feed via embed (quickest)
  - Simple Markdown-based blog (static site generator, e.g. Eleventy)
  - Manual HTML entries in the JSON array
- **Recommended for Phase 2** — launch the core site first, add the journal once a content rhythm is established

---

### 3.9 Footer

- **Background:** Ink Black (`#3D3228`)
- **Left:** Enso icon + "HOUSE OF AYAAT" in Pale Parchment
- **Centre:** Nav links repeated (About · Book · Events · Press · Contact)
- **Right:** Instagram icon link
- **Bottom:** `© 2026 House of Ayaat · Farhana Yunnus`
- **Note:** No heavy footer — one row of links, one row of copyright. Elegance through restraint.

---

## 4. Animations & Interactions

| Element | Animation | Implementation |
|---|---|---|
| Hero headline | Ink-bleed: blur 8 → 0 per word, staggered | SVG `<feGaussianBlur>` + CSS transition |
| Enso logo | Strokes on via `stroke-dashoffset` when in viewport | CSS + Intersection Observer |
| Scroll reveals | Fade + 20px rise, staggered in grids | Intersection Observer, `opacity` + `transform` |
| Book cover | Slow parallax (0.3× scroll rate) | JS `scroll` event + `transform: translateY` |
| Nav links | Gold underline expands on hover | CSS `width` transition 0 → 100% |
| Farhana portrait | Sepia → full colour on hover | CSS `filter` transition |
| Event rows | Expand/collapse on click | CSS `max-height` transition |
| Press cards | Hover lift | CSS `transform: translateY(-2px)` + `box-shadow` |

All animations wrapped in `@media (prefers-reduced-motion: reduce)` — motion is opt-out.

---

## 5. Assets Required

| Asset | File | Status |
|---|---|---|
| Enso logo (full) | `Logo_1.png` | ✓ Uploaded |
| Enso logo (inline) | `Logo_2.png` | ✓ Uploaded |
| Enso icon only | `Logo_icon.png` | ✓ Uploaded |
| Farhana portrait | `Farhana_1.jpg` | ✓ Uploaded |
| Dear Waheed cover | `Dear_Waheed.jpg` | ✓ Uploaded |
| Product photography | — | To be provided |
| Workshop photos | — | To be provided |
| Pull quote text | — | To be confirmed with Farhana |
| Events data | — | To be provided |

---

## 6. Technical Specification

| Item | Decision |
|---|---|
| Delivery format | Single-file HTML |
| CSS | Embedded `<style>` — no external stylesheet |
| JavaScript | Vanilla JS — no frameworks |
| Fonts | Google Fonts: Cormorant Garamond, Montserrat, Lato |
| Images | Base64-embedded or path-referenced |
| Hosting | GitHub Pages / Netlify / Vercel (zero config) |
| CMS | None — data (events, press) as JSON arrays in script block |
| Responsive | Mobile-first, breakpoints at 768px and 1200px |
| Accessibility | WCAG AA contrast, keyboard focus visible, `aria-label` on icon links, `prefers-reduced-motion` respected |
| Performance | No external JS libraries; images lazy-loaded with `loading="lazy"` |

---

## 7. Build Phases

| Phase | Scope | Priority |
|---|---|---|
| **Phase 1** | Nav, Hero, About, Book section, Events, Press, Footer | Launch |
| **Phase 2** | Brand/products section, Journal/blog, Instagram embed | Post-launch |
| **Phase 3** | Shop integration (if products move online), mailing list | Future |

---

*Prepared for House of Ayaat · June 2026*
