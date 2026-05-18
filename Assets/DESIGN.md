---
name: Fullstack Craftsmanship
colors:
  surface: '#051424'
  surface-dim: '#051424'
  surface-bright: '#2c3a4c'
  surface-container-lowest: '#010f1f'
  surface-container-low: '#0d1c2d'
  surface-container: '#122131'
  surface-container-high: '#1c2b3c'
  surface-container-highest: '#273647'
  on-surface: '#d4e4fa'
  on-surface-variant: '#c7c4d7'
  inverse-surface: '#d4e4fa'
  inverse-on-surface: '#233143'
  outline: '#908fa0'
  outline-variant: '#464554'
  surface-tint: '#c0c1ff'
  primary: '#c0c1ff'
  on-primary: '#1000a9'
  primary-container: '#8083ff'
  on-primary-container: '#0d0096'
  inverse-primary: '#494bd6'
  secondary: '#c8c6c5'
  on-secondary: '#313030'
  secondary-container: '#4a4949'
  on-secondary-container: '#bab8b7'
  tertiary: '#c4c7c9'
  on-tertiary: '#2d3133'
  tertiary-container: '#8e9193'
  on-tertiary-container: '#272a2c'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e1e0ff'
  primary-fixed-dim: '#c0c1ff'
  on-primary-fixed: '#07006c'
  on-primary-fixed-variant: '#2f2ebe'
  secondary-fixed: '#e5e2e1'
  secondary-fixed-dim: '#c8c6c5'
  on-secondary-fixed: '#1c1b1b'
  on-secondary-fixed-variant: '#474646'
  tertiary-fixed: '#e0e3e5'
  tertiary-fixed-dim: '#c4c7c9'
  on-tertiary-fixed: '#191c1e'
  on-tertiary-fixed-variant: '#444749'
  background: '#051424'
  on-background: '#d4e4fa'
  surface-variant: '#273647'
typography:
  display-lg:
    fontFamily: Montserrat
    fontSize: 64px
    fontWeight: '700'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Montserrat
    fontSize: 40px
    fontWeight: '600'
    lineHeight: '1.2'
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Montserrat
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.2'
  headline-md:
    fontFamily: Montserrat
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  label-md:
    fontFamily: JetBrains Mono
    fontSize: 14px
    fontWeight: '500'
    lineHeight: '1.4'
    letterSpacing: 0.05em
  label-sm:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: '500'
    lineHeight: '1.4'
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 12px
  md: 24px
  lg: 48px
  xl: 80px
  container-max: 1200px
  gutter: 24px
---

## Brand & Style
The brand personality centers on the intersection of technical precision and artistic fluidity. This design system communicates "Cross-platform Excellence" through a lens of sophisticated minimalism, avoiding the harshness often found in developer portfolios. 

The aesthetic is characterized by **Soft Minimalism**. It utilizes expansive whitespace, balanced compositions, and a "gentle" tactile quality. The UI should evoke a sense of calm reliability and high-end craftsmanship, positioning the developer as a thoughtful architect of digital experiences rather than just a coder.

## Colors
This design system utilizes a "Deep Mode" default to emphasize technical sophistication.
- **Primary (Muted Indigo):** Used for key actions, focus states, and representing the "thread" that connects different frameworks (Flutter, React, Vue).
- **Secondary (Deep Charcoal):** The canvas color. It provides a rich, low-strain background that allows content to pop without the harshness of pure black.
- **Tertiary (Soft White):** Used for primary text and high-contrast highlights to ensure maximum readability.
- **Neutral (Slate):** Used for secondary text, borders, and UI scaffolding.

Subtle gradients are permitted, blending the Primary Indigo into a slightly darker shade (#4338CA) to add depth to interactive elements.

## Typography
The typography strategy pairs the geometric strength of **Montserrat** for headlines with the exceptional utility of **Inter** for body copy. To reinforce the "Fullstack" and technical identity, **JetBrains Mono** is introduced for small labels, tags, and code snippets.

Headlines should use tight letter-spacing to appear more "designed" and editorial. Body text maintains generous line-heights to ensure long-form project descriptions remain approachable.

## Layout & Spacing
The design system employs a **Fluid-Fixed Hybrid** grid. While the main content is housed within a 1200px centered container, background elements and decorative gradients may bleed to the edge of the viewport.

- **Desktop (1024px+):** 12-column grid with 24px gutters.
- **Tablet (768px - 1023px):** 8-column grid with 20px gutters.
- **Mobile (Up to 767px):** 4-column grid with 16px gutters and 16px side margins.

Vertical rhythm is strictly maintained using multiples of 8px. Large sections are separated by `xl` spacing to create a high-end, airy feel.

## Elevation & Depth
Depth is achieved through **Tonal Layering** and **Ambient Shadows** rather than high-contrast borders.

- **Level 1 (Base):** The secondary charcoal color (#121212).
- **Level 2 (Cards/Surfaces):** A slightly lighter charcoal (#1E1E1E) with a very soft, 1px low-opacity indigo border (10% opacity).
- **Level 3 (Interactive):** Elements that are hovered or active use an extra-diffused shadow: `0 20px 40px rgba(0, 0, 0, 0.4)`.

Glassmorphism is used sparingly for navigation bars and floating overlays, utilizing a `blur(12px)` and a 50% transparent version of the surface color.

## Shapes
Shapes are intentionally "Soft." Standard UI elements like cards and input fields use a **0.5rem (8px)** radius. Larger structural components like project hero images or container sections use **1rem (16px)** to emphasize the "gentle" visual direction. Interactive chips and tags use the **pill-shape** (full radius) to contrast against the more structured card elements.

## Components
- **Buttons:** Primary buttons use a solid indigo background with a subtle inner-glow on hover. Secondary buttons use a "ghost" style with a 1px slate border that tints indigo on focus.
- **Cards:** Project cards are the primary vessel for content. They should feature a "soft border" (low-contrast stroke) and a subtle scale-up transition (1.02x) on hover.
- **Chips/Tags:** Used to denote technologies (e.g., "Flutter", "React"). These use JetBrains Mono in `label-sm`, with a low-opacity primary background and indigo text.
- **Input Fields:** Minimalist design with only a bottom border that expands to a full indigo outline upon focus.
- **Project Lists:** Use a vertical "timeline" style or a clean staggered grid. 
- **Tech Stack Icons:** Icons should be monochromatic (Slate) by default, switching to their brand colors only on hover to maintain the minimalist aesthetic.
- **Micro-interactions:** All transitions (hover, page entry, modal trigger) must use a "Soft" easing curve: `cubic-bezier(0.4, 0, 0.2, 1)`.