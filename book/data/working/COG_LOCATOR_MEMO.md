# Ten locator positions, re-derived from the shares data

2026-08-31. Answers the questions left open in `COG_DATASET_BRIEF.md`. Data and method in
`SOURCES.md`; figures in `figures/make_cog_shares.R`.

## The axis

The brief proposed using Asia's share of world GDP directly. That works but wastes the bar:
the share never leaves the 17–57 per cent band, so no marker ever approaches either pole and
the locator reads as permanently mid-scale.

Recommended instead, because it is what the bar's own labels say it measures:

> **position = Asia's income / (Asia's income + the North Atlantic's income)**

where the North Atlantic is Western Europe plus the Western Offshoots. 0 is all North
Atlantic, 1 is all Asia, 0.5 is parity between the two poles. It is one number, monotone in
the thing the chapters argue about, and it has no wrap-around problem. Third regions — Latin
America, Africa, the Middle East, Eastern Europe — drop out, which is a real limitation and
should stay in the caption: **the bar compares two poles, it does not locate the world's
centroid.**

Positions below are on the same 0–1 scale the scripts already use (`x = 0.05 + pos * 0.90`).

## The table

| Ch | Period | Anchor year | Asia | N. Atl | **Derived pos** | Current pos | Move |
|---|---|---|---|---|---|---|---|
| 1 | c.3500–500 BCE | — | — | — | four dots, unchanged | 0.45/0.60/0.67/0.80 | keep |
| 2 | c.500 BCE–300 CE | 100 CE | 62.1%\* | 11.8%\* | **0.84**\* | 0.78 | +0.06 east |
| 3 | c.500–1000 | 800 | 59.6%\* | 7.9%\* | **0.87**\* | 0.84 | +0.03 east |
| 4 | c.1000–1400 | 1200 | 61.5% | 15.1% | **0.80** | 0.83 | −0.03 |
| 5 | c.1400–1600 | 1500 | 55.6% | 18.4% | **0.75** | 0.81 | −0.06 |
| 6 | c.1600–1760 | 1700 | 56.9% | 21.8% | **0.72** | 0.80 | −0.08 |
| 7 | c.1750–1850 | 1850 | 43.7% | 36.1% | **0.55** | 0.30 | **+0.25 east** |
| 8 | c.1850–1914 | 1900 | 25.6% | 53.2% | **0.33** | 0.12 | **+0.21 east** |
| 9 | 1914–1945 | 1940/45 | 22.0% | 54.0% | **0.26** | 0.06 | **+0.20 east** |
| 10 | 1945–2010s | 1980 → 2050 | 22.9% → 45–50% | 48.4% → ~24% | **0.32 → 0.66** | 0.37 → 0.65 | small |

\* Chapters 2 and 3 sit before 1000 CE, where there is no usable income estimate for Asia.
Their figures are **population** shares on the same two-pole formula, and their captions
should say so.

## The four questions the brief left open

**1. Is chapter 9 further west than chapter 8?** Yes, and the locators were right where my
brief was wrong. On income, the positions run 1900 = 0.33, 1920 = 0.33, 1940 = 0.29,
1950 = 0.23. Chapter 8's period ends east of where chapter 9's ends. `ledger-spine.png` and
`cog-locator-09` already agreed with each other on this; the data now backs them.

**2. Is 1945 the western extreme?** Very nearly, and 1950 is the actual floor of the whole
5,500-year series: Asia at 17.1 per cent of world income against 51.5 per cent of world
population, a gap of 34 points. Chapter 9 ends one step short of it. Worth saying plainly
somewhere: the low point of Asia's weight in the world economy is not 1913 or 1919, it is
about 1950, after decolonisation had begun.

**3. Is 1980 significantly east of 1945?** Only a little: 0.32 against about 0.25. Nearly all
of the return happens after 1990 — 0.38 in 1990, 0.49 in 2010, 0.58 in 2022. The current
chapter 10 marker at 0.37 for 1980 is a touch too far east; 0.32 is what the data say. If the
chapter wants to show *when* the return happened rather than *that* it happened, a third dot
at 1990 or 2000 would earn its place.

**4. Is chapter 10's 2050 marker at 0.65 right?** Yes. On the published 45–50 per cent range
for Asia and a North Atlantic share of roughly 24 per cent, the position is 0.65 to 0.68.
The 0.80 it sat at before was too far east; the 0.65 you moved it to is what the numbers give.
Nothing to change.

## The finding that was not asked for

**Chapters 7, 8 and 9 are all placed far too far west — by about 0.2 on a 0–1 scale.**

The eye reads "peak Western dominance" as "almost all the way to the Atlantic pole", so
chapter 8 ended up at 0.12 and chapter 9 at 0.06. But Asia's income share never falls below
about a fifth of the two-pole total, because Asia's population share never falls below half
the world's. At the very floor, in 1950, the position is 0.23 — clearly west of centre, but
nowhere near the pole. Drawing 1913 at 0.12 says something about the world that the numbers
do not support.

Chapter 7 is the sharpest case, and it is a claim about the argument rather than the layout.
Its caption reads "c.1850 — the turning point: the weight crosses west". **In 1850 the weight
had not yet crossed:** Asia was 43.7 per cent of world GDP against the North Atlantic's 36.1.
The crossing happens around 1865, between the 1850 and 1870 benchmarks. Two options:

- keep the marker at 1850 and move it to 0.55, changing the caption to *"c.1850 — the weight
  is about to cross"*; or
- keep the caption and move the anchor year to 1870, position 0.45.

The second is tidier if chapter 7 is allowed to run to 1870. Either way the current 0.30 is
about where 1905 sits, which is chapter 8's period, not chapter 7's.

## Added 2026-08-31: does widening Asia, or changing the denominator, move any of this?

**Widening Asia to include West Asia: no.** The two-pole formula is a ratio, and West Asia is
small beside East and South Asia, so every position moves by 0.01 to 0.04 — inside the width
of the marker.

| Ch | narrow Asia | + West Asia |
|---|---|---|
| 2 | 0.84 | 0.86 |
| 3 | 0.88 | 0.89 |
| 4 | 0.80 | 0.81 |
| 5 | 0.75 | 0.76 |
| 6 | 0.72 | 0.73 |
| 7 | 0.45 | 0.46 |
| 8 | 0.33 | 0.34 |
| 9 | 0.29 | 0.31 |
| 10 (1980 / 2022) | 0.32 / 0.58 | 0.35 / 0.62 |

So the locators can be left on the narrow definition without apology. Where the definition
*does* matter is in headline shares rather than positions: **on the wider definition Asia
passes half of world output in about 2020** (50.3 per cent in 2022 against 43.7 narrow), which
is a sentence chapter 10 may want.

**Changing the denominator to Afro-Eurasia: also no, for the locators** — the two-pole formula
never had the Americas in it. But it changes the *shares*, and before 1500 it changes them a
great deal. That is a matter for chapters 1 to 5's prose, not their markers.

| population share | of the world | of Afro-Eurasia | of Afro-Eurasia, + West Asia |
|---|---|---|---|
| 4000 BCE | 41.9% | 58.6% | **73.9%** |
| 2000 BCE | 52.7% | 63.7% | **76.4%** |
| 1 CE | 63.9% | 69.9% | **77.4%** |
| 1000 CE | 57.7% | 65.4% | **72.5%** |
| 1500 CE | 56.1% | 64.1% | **68.1%** |

**The rise largely disappears.** On the world denominator Asia climbs from 42 to 64 per cent
and looks like a trend. On Afro-Eurasia, with West Asia included, it runs 74 · 76 · 77 · 73 ·
68 — essentially flat, and gently falling after 1 CE. Most of the apparent rise is a statement
about how many people HYDE puts in the pre-Columbian Americas, which is the least certain
number in the whole series.

For chapters 1 to 5 this is the better frame and the better sentence: **Asia broadly construed
held about three quarters of the connected world's people for four thousand years, and the
interesting fact is the stability, not a rise.** Figure `cog-asia-afroeurasia.png`.

## What this does not settle

- The bar is two-pole. It cannot show the Middle East's weight in chapters 3 and 4, or Latin
  America's silver in chapters 5 and 6. Those chapters may still want a second marker.
- Chapters 1 to 3 rest on population alone. Chapter 1's four dots are unaffected — the claim
  there is that no single centre exists, which is about dispersion, not position.
- Positions for chapters 2 and 3 are systematically *east* of what an income measure would
  probably give, because Asia was more populous than it was rich relative to Rome. Treat the
  0.84 and 0.87 as ceilings.
