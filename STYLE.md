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

## Numbers, sources, glyphs
- Every substantive paragraph ends in its source endnote (`^[**Sources:** … **Read more:** …]`).
- ASCII prose; inline math `$\to$` for a real arrow; no raw Unicode arrows/fractions/emoji
  (they break the PDF build). See `_chapter-template.qmd`.
- Disputed figures are taught as debate, never silently resolved.
