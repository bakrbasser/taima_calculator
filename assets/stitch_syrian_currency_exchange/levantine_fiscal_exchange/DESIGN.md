---
name: Levantine Fiscal Exchange
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#444651'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#757682'
  outline-variant: '#c5c5d3'
  surface-tint: '#4059aa'
  primary: '#00236f'
  on-primary: '#ffffff'
  primary-container: '#1e3a8a'
  on-primary-container: '#90a8ff'
  inverse-primary: '#b6c4ff'
  secondary: '#904d00'
  on-secondary: '#ffffff'
  secondary-container: '#fe932c'
  on-secondary-container: '#663500'
  tertiary: '#222a3e'
  on-tertiary: '#ffffff'
  tertiary-container: '#384055'
  on-tertiary-container: '#a4acc5'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dce1ff'
  primary-fixed-dim: '#b6c4ff'
  on-primary-fixed: '#00164e'
  on-primary-fixed-variant: '#264191'
  secondary-fixed: '#ffdcc3'
  secondary-fixed-dim: '#ffb77d'
  on-secondary-fixed: '#2f1500'
  on-secondary-fixed-variant: '#6e3900'
  tertiary-fixed: '#dae2fd'
  tertiary-fixed-dim: '#bec6e0'
  on-tertiary-fixed: '#131b2e'
  on-tertiary-fixed-variant: '#3f465c'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  display-lg:
    fontFamily: IBM Plex Sans
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: IBM Plex Sans
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
  headline-md:
    fontFamily: IBM Plex Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  body-lg:
    fontFamily: IBM Plex Sans
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: IBM Plex Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: IBM Plex Sans
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.01em
  numeric-xl:
    fontFamily: IBM Plex Sans
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.01em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  container-max: 1200px
---

## Brand & Style
The design system is engineered to project stability, precision, and institutional trust for a high-stakes financial environment. Given the complexities of the Syrian currency market, the UI must feel authoritative yet accessible, bridging the gap between traditional banking and modern fintech.

The style is **Corporate Modern** with **Minimalist** influences. It prioritizes clarity over decoration, using ample whitespace and a structured grid to reduce cognitive load during rapid exchange rate fluctuations. High-quality typography and a restrained color palette evoke the feeling of a premier financial institution.

## Colors
This design system utilizes a foundation of **Deep Trustworthy Blue** to establish institutional credibility. **Amber Gold** is reserved strictly for high-value accents, call-to-action highlights, and currency symbols, creating a "premium" feel without sacrificing legibility.

- **Primary (#1E3A8A):** Used for headers, primary buttons, and active states.
- **Secondary (#D97706):** Used for gold-standard exchange rates and critical highlights.
- **Neutral Grays:** Used for secondary text and structural borders to maintain a clean, professional aesthetic.
- **Semantic Colors:** Success green for "Buy" actions and Error red for "Sell" or market drops, ensuring immediate visual feedback.

## Typography
The system uses **IBM Plex Sans** for its exceptional clarity and professional, technical character. For the Arabic context, implement the Arabic counterpart of IBM Plex Sans to maintain a unified "Sans-Serif" modern look.

Numbers are the primary data points; therefore, the `numeric-xl` role is optimized for currency values, ensuring they are the most prominent elements on the screen. All typography should support Right-to-Left (RTL) alignment natively.

## Layout & Spacing
The design system employs a **12-column fluid grid** for desktop and a **4-column grid** for mobile. A strict 8px spacing scale ensures rhythmic consistency across all components.

- **Margins:** 24px on mobile, 48px on desktop to provide "breathing room."
- **Gutters:** 16px to maintain tight association between related financial data points.
- **Alignment:** Right-to-Left (RTL) is the default orientation for the Syrian market, with numeric values remaining LTR where appropriate for global financial standards.

## Elevation & Depth
To maintain a professional, "flat-plus" aesthetic, this design system avoids heavy shadows. Instead, it uses **Tonal Layers** and **Low-Contrast Outlines**.

- **Level 0 (Background):** #F8FAFC.
- **Level 1 (Cards/Containers):** White surface with a 1px border (#E2E8F0).
- **Level 2 (Active/Floating):** A very soft, diffused shadow (0px 4px 12px rgba(30, 58, 138, 0.05)) is used only for active input fields or primary currency cards to indicate focus.
- **Dividers:** Hairline strokes (1px) in #F1F5F9 to separate list items without creating visual noise.

## Shapes
The shape language is **Soft**. Corners are rounded just enough to feel modern and accessible, but remain sharp enough to feel "serious" and "orderly." 

- **Standard Elements (Buttons, Inputs):** 0.25rem (4px).
- **Containers (Currency Cards):** 0.5rem (8px).
- **Interactive Toggles:** 0.25rem (4px) to maintain a rigid, dependable structure.

## Components
- **Currency Cards:** High-contrast containers featuring the flag icon, ISO code, and large-scale numeric rates. The primary rate uses `numeric-xl` in Primary Blue.
- **Buy/Sell Toggles:** A segmented control style. "Buy" uses a Success Green background when active; "Sell" uses Primary Blue. The inactive state is a light gray.
- **Numeric Input Fields:** Large, border-bottom focused inputs. They must include a clear "Currency Suffix" (e.g., SYP, USD) in the `label-md` style.
- **Result Cards (Old vs New Lira):** Dual-section cards using a subtle vertical divider. The "New Lira" result is highlighted with a Secondary Gold background or border to signify its importance.
- **Action Buttons:** Primary buttons are solid Primary Blue with white text. Secondary actions use an outlined style with a 1px Blue stroke.
- **Status Chips:** Small, pill-shaped indicators for "Market Open," "Market Closed," or "Volatile," using low-saturation semantic colors.