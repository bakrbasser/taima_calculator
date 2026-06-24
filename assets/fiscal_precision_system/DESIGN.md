---
name: Fiscal Precision System
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
  secondary: '#006c49'
  on-secondary: '#ffffff'
  secondary-container: '#6cf8bb'
  on-secondary-container: '#00714d'
  tertiary: '#3e2400'
  on-tertiary: '#ffffff'
  tertiary-container: '#5c3800'
  on-tertiary-container: '#ef9900'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dce1ff'
  primary-fixed-dim: '#b6c4ff'
  on-primary-fixed: '#00164e'
  on-primary-fixed-variant: '#264191'
  secondary-fixed: '#6ffbbe'
  secondary-fixed-dim: '#4edea3'
  on-secondary-fixed: '#002113'
  on-secondary-fixed-variant: '#005236'
  tertiary-fixed: '#ffddb8'
  tertiary-fixed-dim: '#ffb95f'
  on-tertiary-fixed: '#2a1700'
  on-tertiary-fixed-variant: '#653e00'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  display-lg:
    fontFamily: IBM Plex Sans
    fontSize: 48px
    fontWeight: '600'
    lineHeight: '1.2'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: IBM Plex Sans
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: IBM Plex Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  headline-md:
    fontFamily: IBM Plex Sans
    fontSize: 24px
    fontWeight: '500'
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
  data-mono:
    fontFamily: jetbrainsMono
    fontSize: 16px
    fontWeight: '500'
    lineHeight: 24px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 4px
  container-max: 1280px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 32px
  stack-sm: 8px
  stack-md: 16px
  stack-lg: 32px
---

## Brand & Style

The design system is engineered for a professional, high-stakes financial environment where clarity, speed, and trust are paramount. The brand personality is authoritative yet accessible, positioning itself as a reliable partner in global currency exchange and wealth management.

The design style follows a **Corporate / Modern** aesthetic with a strong emphasis on **Data-Centric Minimalism**. By utilizing a card-based architecture and intentional whitespace, the system ensures that complex financial data remains legible and actionable. The emotional response is one of security and precision—evoking the feeling of a high-end banking terminal translated into a contemporary web experience. High-contrast numerical displays ensure that fluctuating rates are the primary focus, minimizing cognitive load for the user.

## Colors

The color palette is anchored by **Deep Trust Blue (#1E3A8A)**, which serves as the primary brand identifier for headers, primary actions, and navigational elements. **Success Green (#10B981)** is reserved strictly for "Buy" actions, upward trends, and completed transactions, providing a clear semantic signal of growth. 

A tertiary **Warning Amber (#F59E0B)** is utilized for pending states or market volatility alerts. The neutral scale relies on a range of cool grays to define borders, secondary text, and background surfaces, maintaining a clean and "un-muddy" interface. Backgrounds use a very light tint of gray (#F8FAFC) to reduce eye strain during prolonged use, while pure white is reserved for interactive cards and input containers.

## Typography

The design system utilizes **IBM Plex Sans** for its exceptional multi-script support, ensuring a seamless experience for Arabic and Latin characters alike. Its technical, structured nature aligns perfectly with the financial sector’s need for legibility and order.

For numerical data, rates, and transaction IDs, **JetBrains Mono** is introduced as a secondary utility font. Its monospaced nature prevents "jumping" numbers during live rate updates, allowing users to track decimal changes with pinpoint accuracy. Headings use a tighter letter-spacing to appear more impactful, while body text maintains standard tracking to prioritize long-form readability in terms and conditions or market analysis reports.

## Layout & Spacing

This design system employs a **Fixed Grid** model for desktop and a **Fluid Grid** for mobile devices. On desktop, the content lives within a 1280px central container using a 12-column grid. This allows for complex dashboard layouts where sidebars, main exchange modules, and order books can coexist without visual clutter.

Spacing follows a strict 4px baseline rhythm. Interactive elements like buttons and inputs use 12px or 16px internal padding to ensure a comfortable touch target. Between cards, a 24px gap is maintained to provide sufficient "breathing room," emphasizing the modularity of the interface. On mobile, margins reduce to 16px, and multi-column tables reflow into a "card-list" format to ensure data remains accessible on vertical screens.

## Elevation & Depth

Visual hierarchy is primarily achieved through **Tonal Layers** supplemented by **Ambient Shadows**. The background layer is the lowest (#F8FAFC), while interactive cards sit on the middle layer (#FFFFFF).

Shadows are used sparingly to indicate interactivity or focus. They are extra-diffused and low-opacity, using a slight primary color tint (Blue-Gray) to avoid a "dirty" look. 
- **Resting state:** A subtle 1px border (#E2E8F0) with no shadow.
- **Elevated state (Hover):** A soft shadow with a 12px blur and 4% opacity.
- **Active state (Dropdowns/Modals):** A deeper shadow with a 24px blur and 8% opacity to separate the element from the data beneath it.

## Shapes

The shape language is **Soft (0.25rem)** to strike a balance between the rigidity of traditional finance and the approachability of modern fintech. 

Standard components like buttons, input fields, and checkboxes use a 4px corner radius. Larger containers, such as exchange cards or data tables, use a 8px (rounded-lg) radius to soften the overall layout. This subtle rounding suggests a refined, software-driven experience without appearing overly playful or consumer-grade.

## Components

### Buttons & Toggles
- **Primary Action:** Solid #1E3A8A with white text. High contrast, 48px height for main conversion triggers.
- **Buy/Sell Toggle:** A sliding segmented control. The active "Buy" state uses #10B981, while the "Sell" state uses a high-contrast slate gray or a soft red (#EF4444) depending on the specific product risk profile.

### Numeric Inputs & Currency Selectors
- **Input Fields:** Feature large, monospaced typography for values. The currency selector is nested as a leading or trailing element within the input container, utilizing flag icons for rapid visual identification.
- **Focus State:** Inputs use a 2px solid border in primary blue (#1E3A8A) when active, with a soft outer glow.

### Data Tables
- **Rates Management:** Tables use a "Zebra" striping pattern every other row for readability. Header rows are pinned and styled with a subtle gray background.
- **Status Indicators:** "Live" rates feature a small pulsating dot next to the value to indicate real-time connectivity.

### Cards
- **Exchange Modules:** Cards are white with a 1px neutral-200 border. They group related inputs (Source Amount, Destination Amount, Exchange Rate) into a single logical unit.