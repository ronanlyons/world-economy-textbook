# Sources for the centre-of-gravity share datasets

Built 2026-08-31 by `_prep/build_cog_shares.py`. Re-run that script to regenerate everything
in this folder that starts `cog_`. Raw inputs are in `data/raw/` and are never edited.

## What was built

| File | Rows | Span | What it holds |
|---|---|---|---|
| `cog_population_shares.csv` | 762 | 10,000 BCE – 2100 CE | Population, share of world, share of Afro-Eurasia, by region |
| `cog_gdp_shares.csv` | 380 | 1 CE – 2050 CE | Share of world GDP and of Afro-Eurasian GDP, by region |
| `cog_asia_shares.csv` | 75 | 10,000 BCE – 2100 CE | Derived: two Asia definitions × two denominators, side by side |

Every row carries `source`, `kind` and `series`.

- `kind` is `modelled` (a population model, not observation), `assumption` (see below),
  `estimate` (a historical reconstruction), `data` (modern national accounts or censuses),
  or `projection`.
- `series` names which construction a row belongs to, so that rows built different ways are
  never silently averaged together.

## Regions

Nine regions, ordered west to east to match the locators after the 2026-08-30 flip:

Western Offshoots · Latin America · Western Europe · Sub Saharan Africa ·
**North Africa** · **West Asia** · Eastern Europe · South and South East Asia · East Asia

Eight of them are Maddison Project 2023's. The ninth exists because Maddison's *Middle East
and North Africa* welds West Asia to the Maghreb, and the module needs West Asia to be
assignable to Asia while the Maghreb is not. The split is at country level:

- **North Africa**: Egypt, Libya, Tunisia, Algeria, Morocco, Western Sahara.
- **West Asia**: Turkey, Iran, Iraq, Israel, Jordan, Lebanon, Syria, Palestine, Saudi Arabia,
  Yemen, Oman, the UAE, Qatar, Kuwait, Bahrain.

The split costs almost nothing in coverage. **Turkey, Iran, Iraq, Israel, Jordan, Egypt and
Tunisia all carry a Maddison income figure from 1 CE** — earlier than China's (980) or India's
(1600). The Gulf states have nothing before 1950, but their populations were negligible before
oil, so they do not move a historical share.

Two things deliberately **not** moved, both because doing so would put them on income series
that were never built for them: **Cyprus** stays in Eastern Europe, and **Afghanistan and
Mongolia** stay in South and South East Asia, as Maddison files them.

**Central Asia cannot be separated at all.** Kazakhstan, Uzbekistan, Turkmenistan, Tajikistan
and Kyrgyzstan each have their first Maddison income figure in **1973**; before that they are
inside "Former USSR", which itself starts in 1860 and cannot be split geographically. So they
stay inside Eastern Europe, where Maddison puts them, and are implicitly carrying European
income levels — which for the steppe and Transoxiana in chapters 3 and 4 is simply wrong.
Their *population* is fine (HYDE has all five back to 10,000 BCE); it is income that is
unavailable. Note too that Eastern Europe as a whole is thin before 1860: **Russia has no
Maddison income figure at all before 1860**, so the region pre-1860 rests on Poland (from 1400).

### Two denominators

Every row carries its share of the **world** and, where applicable, its share of
**Afro-Eurasia** (`pop_share_afroeurasia`, `gdp_share_afroeurasia`) — the world minus the
Americas and Oceania. Until about 1500 that is the unit the module actually works in: the
Americas are not part of the same economy, so counting them in the denominator measures a
world the period's actors were not in. The two give materially different pictures before 1500,
and the difference is documented in `COG_LOCATOR_MEMO.md`.

### Two definitions of Asia

`cog_asia_shares.csv` carries both: **`asia_*`** is East Asia plus South and South East Asia;
**`asia_wa_*`** adds West Asia. Each on both denominators, so four series in all. Central Asia
is in neither, for the reason above.

One further naming point: **"Western Offshoots" includes Australia and New Zealand**, so
"North Atlantic" as used in the locator memo (Western Europe plus Western Offshoots) is not
strictly North Atlantic.

The 72 small territories in the population source that Maddison does not cover — Papua New
Guinea, Somalia, South Sudan, Timor-Leste, Bhutan, Brunei, the Maldives, Fiji, Guyana,
Suriname, Eritrea and 61 smaller ones — were assigned by geography in the script's `EXTRA`
table. Together they are about one per cent of world population.

## Population

**Our World in Data's long-run population series**, downloaded 2026-08-31 from
`ourworldindata.org/grapher/population.csv` and
`ourworldindata.org/grapher/population-long-run-with-projections.csv`. That series splices:

- **HYDE 3.2** (Klein Goldewijk et al., Utrecht University) to 1799. Modelled, not observed:
  country-level figures for 4000 BCE are a spatial model run on modern borders, and should
  be read as an order of magnitude with a shape, not as counts.
- **Gapminder v7** for 1800–1949.
- **UN World Population Prospects 2024** for 1950 onwards, medium variant for projections.

Coverage: 265 distinct years. Four of them (1555, 1640, 1785, 1788) carry a single country in
the source file and would have produced nonsense shares; the script requires at least 150
countries in a year before using it.

**Maddison's own regional population** is emitted as a second series
(`series = maddison_crosscheck`) at its 22 complete benchmark years, so the two can be
compared. It stays on Maddison's original **eight** regions: the Regional data sheet cannot be
split, and splitting it by a country-level ratio would stop it being an independent check.
The two agree closely: Asia's population share in 1820 is 66.1 per cent on the OWID series and
65.6 on Maddison's; in 2000, 55.7 against 55.8.

## Income

**Maddison Project Database 2023** (Bolt and van Zanden), `mpd2023_web.xlsx`, downloaded
2026-08-31 from dataverse.nl, doi:10.34894/INZBF2. Real GDP per head in 2011 US dollars.

Two constructions, kept as separate series:

### 1820 onwards — `series = maddison_regional`

Straight from the workbook's *Regional data* sheet: regional GDP per head times regional
population, for the 22 years where both are complete (1820, 1850, 1870, 1900, 1920, 1940,
1950, 1960, 1970, 1980, 1990, 2000, 2010, 2015–2022). No reconstruction on our part, with one
exception: the sheet's MENA aggregate has to be divided between West Asia and North Africa,
which it cannot do itself. The division comes from the country file — regional GDP is split in
the same proportion as the two halves' country-level GDP in that year, using an uncapped
anchor set. MENA is 2.7 to 3.5 per cent of world GDP throughout, so the approximation is small.

The sheet leaves the Middle East and North Africa, and Sub Saharan Africa, blank in several
decades; 25 such cells were filled by linear interpolation on the sheet's own year grid.
Both regions are small, so this moves Asia's share by well under a tenth of a point. It was
done so that 1850, 1900, 1920 and 1940 are usable, which the module needs.

### 1 CE to 1800 — `series = reconstructed_pre1820_chained`

The country-level Maddison file is far too thin before 1820 to sum directly: at 1500 only
eleven countries have a GDP per head figure, and none of them is in South or South East Asia.
So regional income is rebuilt as **Maddison's country GDP per head applied to HYDE's country
populations**, with these rules:

1. A country's GDP per head at year *y* is interpolated between its own Maddison anchors, and
   held flat outside them.
2. **Only anchors at or before 1870 may be used.** Without this rule a country whose Maddison
   series begins in 1950 has its 1950 income level extrapolated flat back to antiquity. The
   first draft of this script did exactly that and put Eastern Europe above Western Europe in
   1800, at a quarter of world GDP. Anyone re-running this should keep the rule.
3. A country with no pre-modern anchor takes its region's population-weighted mean of the
   countries that do have one.
4. A region where fewer than a quarter of people live in an anchored country takes Maddison's
   own 1820 regional GDP per head instead, held flat backwards. This applies to Sub Saharan
   Africa in every century before 1200 and in a few later ones — 20 region-years in all.
5. The result is then **chain-linked** to Maddison's own regional aggregation at 1820: each
   region's pre-1820 share is scaled by its 1820 ratio and the year renormalised, so the two
   constructions join without a step. The link factors run from 0.83 (Sub Saharan Africa) to
   1.21 (Eastern Europe); East Asia's is 1.02 and South and South East Asia's 0.90, so the
   adjustment to Asia is small. Before linking, the reconstruction put Asia at 54.7 per cent
   of world GDP in 1820 against Maddison's own 53.2.

### Rows before 1000 CE are marked `kind = assumption` and are not plotted

China's earliest Maddison figure is 980 CE and India's is 1600. Any Asian income share before
1000 CE is therefore China's Song-era level held flat backwards. Drawn, it would show Asia's
income share sitting *above* its population share for a thousand years on no evidence at all.
The rows are kept in the CSV so the choice is visible and reversible; both figures start the
income line at 1000 CE.

### 2024 and 2030 — `series = imf_weo`

**IMF World Economic Outlook**, country shares of world GDP at PPP, via the IMF DataMapper API
(`PPPSH`), retrieved 2026-08-31, aggregated on the same region map. A different concept from
Maddison's constant-2011-PPP levels, so it is kept as its own series rather than spliced. The
two are close where they overlap: Asia is 43.7 per cent on Maddison in 2022 and 41.8 per cent
on the IMF in 2024.

### 2050 — `series = published_range`

No country-level 2050 projection is used, because neither published source is available as a
machine-readable table. Recorded instead as a **45–50 per cent range on the Asia aggregate
only**, on two rows, from:

- **PwC, *The World in 2050*** (February 2017): China about 19.5 per cent of world GDP at PPP
  in 2050 after a peak near 20 per cent around 2030; India rising from about 7 per cent to
  above 15 per cent, passing the EU around 2044 and the US around 2049; the E7 about half of
  world GDP. China and India alone are therefore about 35 per cent, and the rest of East,
  South and South East Asia — Indonesia, Japan, Korea, Vietnam, the Philippines, Bangladesh,
  Pakistan, Thailand, Malaysia — adds roughly ten more.
- **Goldman Sachs, *The Path to 2075*** (December 2022): Asia excluding developed markets at
  about 40 per cent of global GDP by 2050, against developed markets at about 36 per cent.
  That is a narrower Asia — it excludes Japan and Korea — so it points to much the same place.

The IMF's own path reaches 44.7 per cent by 2030, so the bottom of the range is close to a
no-further-change assumption.

## Known weaknesses, in the order they would bite

1. **Before 1800 the two series are not independent.** Maddison's pre-modern GDP per head is
   flat or near-flat for most regions, so regional GDP is largely regional population times a
   constant. That the income and population lines sit on top of each other before 1800 is
   therefore partly a property of how the income estimates were built, not purely a finding.
   Both figures say so on their face. It does not weaken the point the chart is really for,
   which is the break after 1800.
2. **HYDE before about 1000 BCE is a model.** The rise in Asia's share from 42 per cent in
   4000 BCE to 55 per cent by 1000 BCE is HYDE's agricultural-diffusion model talking, and
   should be described as such.
3. **India carries South and South East Asia and has no anchor before 1600.** Its 1600 value
   is held flat back through the whole medieval period, so that region's income share moves
   only with its population until 1600.
4. **The 1820 join.** The two constructions differ by one to two points per region at 1820
   before chain-linking. The link removes the step but does not remove the underlying
   disagreement.
5. **The West Asia / North Africa split of Maddison's regional aggregate is a proportion, not
   a measurement** — see above. It is accurate enough for Asia's share and should not be
   quoted as a figure for either half on its own.
6. **PPP concepts differ across the three income series** (Maddison constant 2011 PPP; IMF
   current PPP). They are not spliced, but a chart that draws them as one line is glossing
   over that.
7. **The 2050 range is two published headline claims, not a computation.** Treat it as a
   plausible interval, not a forecast we own.
