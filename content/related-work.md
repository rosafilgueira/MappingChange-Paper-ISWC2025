## Related Work

Efforts to structure historical textual data have increasingly turned to Semantic Web technologies. Projects like Linked Places, WarSampo, and Enslaved.org demonstrate how knowledge graphs can model entities, events, and relationships from historical sources. Similarly, national libraries have applied OCR and metadata modeling to digitize collections, such as the NLS’s Data Foundry.

Our work builds on this tradition while addressing unique challenges presented by 19th-century gazetteers: noisy OCR, lack of structural markup, and inconsistent editorial conventions. Prior methods using rule-based extraction or statistical models fall short when applied to these irregular texts. Recent advances using large language models (LLMs) like GPT-4 show promise in segmenting, interpreting, and linking historical content. We apply such models at scale, with edition-specific prompting strategies and custom cleaning heuristics, to generate reliable article-level entries and semantic annotations.

Our ontology-driven approach aligns with recent efforts like the EB Ontology, NLS Ontology, and the Enslaved Ontology, but introduces the more flexible and extensible Heritage Textual Ontology (HTO), designed specifically for long-range temporal comparison and provenance tracking across multiple editions and digitization methods.

