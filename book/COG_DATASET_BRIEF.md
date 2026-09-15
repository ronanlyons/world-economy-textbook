# Brief: an indicative long-run dataset to put the centre-of-gravity locator on data

**Commissioned:** 2026-08-31, at the end of the figure-sweep session.
**Status: BUILT 2026-08-31.** Data in `data/working/cog_*.csv` with `data/working/SOURCES.md`;
figures from `figures/make_cog_shares.R`; the locator answers are in
`data/working/COG_LOCATOR_MEMO.md`. Two departures from this brief, both explained in
SOURCES.md: the GDP series starts at 1000 CE rather than 1 CE (China's earliest Maddison
figure is 980, so anything earlier is that number held flat backwards), and 2050 is recorded
as a published 45-50 per cent range rather than a region-by-region projection.

---

## Why

Ten chapters each carry a centre-of-gravity locator. All ten were placed **by eye**. Last night's
sweep flipped them to map convention (North Atlantic left, Asia right) and, in doing so, exposed
that the marker positions are judgements that do not always agree with each other:

- `cog-locator-09` sits **further west** than `cog-locator-08`, contradicting the brief but agreeing
  with `ledger-spine.png`. Nobody could settle it, because there is no series to settle it against.
- `cog-locator-10`'s 2050 marker sat further east than the Song/Mughal peak, contradicting its own
  caption. It has been moved to 0.65 — again by judgement.
- RL's open question: is 1945 really the western extreme, and is 1980 *significantly* east of it?

The purpose of this dataset is to replace ten judgements with one defensible series. The locators
will still be **stylised** — that is fine and should stay explicit in the captions — but stylised
*from* data rather than from instinct.

---

## Deliverable 1 — world GDP by region, 1 CE to 2050 CE

Tidy CSV, `data/working/cog_gdp_shares.csv`, one row per `year × region`:

`year | region | gdp_share | source | kind`

where `kind` is one of `estimate` (historical reconstruction), `data` (modern national accounts),
`projection` (2030/2050 scenarios). **That column is not optional** — the three must be visually
distinguishable in any figure built from this, because their epistemic status is completely different.

**Sources, in order of preference**
- **Maddison Project Database 2023** for the historical spine. Note it reaches 1 CE only for a
  handful of regions and is heavily interpolated before 1500; treat pre-1500 as indicative in the
  strongest sense.
- **Maddison's own regional aggregates** where the country-level file is too sparse.
- **PwC, *The World in 2050*** (2017) and **Goldman Sachs, *The Path to 2075*** (2022) for the
  projections. Verified in the last session: PwC has China peaking near 20% of world GDP (PPP)
  around 2030 and easing to ~19.5% by 2050, India rising from ~7% to >15%; Goldman has Asia
  ex-developed at ~40% of global GDP by 2050 against developed markets at ~36%.
- **OECD long-term baseline** as a third projection if a range is wanted.

**Region definitions must be stable across 2,000 years and assignable to a west–east axis.** Suggest
broad zones rather than modern countries: the Americas / Western Europe / Eastern Europe and Russia /
the Middle East and North Africa / Sub-Saharan Africa / South Asia / East Asia / Southeast Asia and
Oceania. Record the mapping explicitly in the CSV's companion notes.

---

## Deliverable 2 — population share, c.4000–3500 BCE to present

Tidy CSV, `data/working/cog_population_shares.csv`, same shape.

This one goes much further back than the GDP series, deliberately, because it is what makes the
Malthusian point visible.

**Sources**
- **HYDE 3.3** — already cited on the T1 deck (CC BY). Modelled, not observed; say so.
- **McEvedy & Jones**, *Atlas of World Population History*; **Biraben**; **Kremer (1993)** for the
  long-run reconstructions.
- **UN World Population Prospects 2024** for the modern period and projections. Verified last
  session: Asia ~5.28bn in 2050, peaking 2054; China declining to ~1.27bn. Asia's share of world
  population **falls** slightly to roughly 54–55% by 2050, because Africa grows faster.

---

## The analytical payoff — probably the book's master chart

Plot **Asia's share of world population** against **Asia's share of world GDP**, on one time axis,
across the whole span. The expected shape:

1. The two lines sit **more or less on top of each other** for most of recorded history. In a
   Malthusian world output is roughly proportional to people, so income share ≈ population share.
   That is the T2 slide-46 claim, and this is the evidence for it.
2. They **diverge sharply from around 1800**, as income per head breaks free in the North Atlantic
   and Asia's income share collapses away from its population share. *That divergence is the Great
   Divergence*, drawn as a gap rather than asserted — which is exactly what T7 needs.
3. They begin to **reconverge after about 1980**, which is T10's whole argument.

One figure, 5,500 years, carrying the module's spine. Worth building carefully.

**A caution worth stating on the figure itself:** for most of the span "Asia's share of world GDP" is
close to an arithmetic restatement of "Asia's share of world population", because that is largely how
the historical GDP estimates were built. The convergence before 1800 is therefore partly an artefact
of method, not purely a finding. Say so; it does not weaken the point about the break, which is what
the chart is really for.

---

## How this feeds the locators

RL's proposed axis, and the recommendation from the last session:

**Use Asia's share of world GDP as the locator's x-position, directly.** It is one number, monotone,
interpretable, and immune to the wrap-around problem that a GDP-weighted *mean longitude* suffers
(the Americas at −100° and Asia at +100° average into the wrong ocean). Danny Quah's "economic centre
of gravity" (2011) — which chapter 10 already leans on — solves that by taking the centroid in three
dimensions and projecting back to the surface; that is the right method for a real map, and overkill
for a stylised bar.

Chapter 1's "no single centre" case still works: several dots rather than one marker.

Once the series exists, re-derive all ten marker positions from it in a single pass, and let the
numbers settle the ch08/ch09 ordering question rather than arguing it.

---

## Definition of done

- Both CSVs written, with a companion `SOURCES.md` recording every source, its coverage, and its
  known weaknesses.
- Every row carries `source` and `kind`.
- One R script in `figures/` producing the population-vs-GDP master chart, house style.
- A short memo proposing the ten re-derived locator positions, with the ch08/ch09 question answered
  from the data and the ch10 2050 position checked against the 0.65 currently in place.
- Nothing asserted that the sources do not support. Where the data are too thin to settle something,
  say so — a stylised locator honestly labelled is better than a false precision.
