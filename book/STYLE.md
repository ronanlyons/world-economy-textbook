# Prose style — house rules for the textbook

Authoring rules for every chapter. The *layout* apparatus is in `_chapter-template.qmd`;
this file governs the *writing*.

## Emphasis
- **Bold only for bullet-point subtitles** — the lead-in term of a list item
  (e.g. dramatis-personae bullets `- **Britain** — …`; research-list entries
  `- **Author (year)**, …`; footnote lead-ins `**Sources:**` / `**Read more:**`).
- **No bold for mid-sentence emphasis.** Do not bold words inside running prose to
  stress them (not "but **bounded**", not "**the hinge**"). Let the sentence carry the weight.
- **Italics sparingly**, for genuine emphasis or a term-as-object (e.g. *when* vs *why*),
  and for titles of works. Don't lean on it; if a paragraph has several italics, cut most.

## Voice — avoid LLM-isms and clichés (sound human)
Flag and rewrite, in the editorial pass and when drafting:
- Filler throat-clearing: "It's worth noting that", "Importantly,", "Indeed,", "Of course,",
  "Notably,", "In essence,".
- Inflated verbs/nouns: "delve", "underscore", "highlight", "showcase", "tapestry",
  "interplay", "testament to", "navigate the complexities", "rich/vibrant", "crucible".
- Formulaic framing: "not only … but also", "from X to Y" as decoration, the relentless
  rule-of-three, "stark contrast", "plays a crucial/pivotal role", "stands as".
- House tics to watch (we use these a lot — keep some, thin them out): "follow the …",
  "the payoff", "lens", "stage / staged", "woven / weave", "the tell", "honest / honestly",
  "crux". Variety beats repetition.
- Hedge-and-balance reflex ("while X, it is also true that Y") and over-signposted
  transitions. Prefer plain declaratives.
- Em-dash overuse — vary the punctuation.

Test: read it aloud. If it sounds like a brochure or a model, rewrite it plainer.

## Tense
- **Past tense for all historical narration.** No historical present: "India *was* a layered
  economy", not "India *is*". Applies to the period, its actors, events and sources ("Strabo
  *recorded*", not "Strabo records"). Authorial references to the book itself ("this chapter
  takes up…") may stay present.

## Framing & order
- **Start in the east.** Following the module's vantage, lead with Asia (China and/or India)
  before the West — in the cast list, the actor profiles, and exposition generally, across every
  topic. Actor profiles run **east → west**, the direction goods were made and bullion flowed.

## Actor profiles (Dramatis personae)
- Each actor is a **collapsible panel** (`::: {.callout-tip collapse="true"}` with a `## Actor —
  role` title). India is profiled in every chapter, at the fullest depth.
- Each profile covers the economy **internally** (state/fiscal structure, agriculture, money,
  craft, institutions) **and externally** (its role in the relay, links to the other economies).
- Include a **stylised structure map** where possible (R base graphics, house palette; regions,
  emporia, trade arms — see `figures/make_actor_maps.R`).
- End each profile with an explicit **Trade profile** (bold bullet subtitles): **Main exports**;
  **Main imports** (where known); **Export markets**; **Import sources** (where available).
- Target depth ~600–900 words for a major actor; ~11,000-word chapters overall.

## Numbers, sources, glyphs
- Every substantive paragraph ends in its source endnote (`^[**Sources:** … **Read more:** …]`).
- ASCII prose; inline math `$\to$` for a real arrow; no raw Unicode arrows/fractions/emoji
  (they break the PDF build). See `_chapter-template.qmd`.
- Disputed figures are taught as debate, never silently resolved.
