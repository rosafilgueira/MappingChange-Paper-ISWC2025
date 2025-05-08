## Heritage Textual Ontology
{:#hto}

The [Heritage Textual Ontology (HTO)](https://w3id.org/hto) provides the semantic backbone for *Mapping Change*, enabling structured representation of historical textual records, their provenance, and evolving place-based concepts. Since its initial release, HTO has undergone substantial refinement to support richer semantic modeling, improved interoperability, and enhanced tracking of digitization workflows and AI-assisted outputs. It is designed to model not just entities and attributes but also the editorial and computational processes by which each record is extracted, cleaned, and enriched. Unlike generic ontologies, HTO supports the representation of textual provenance, extraction prompts, editorial hierarchies, and diachronic linkage across editions. It enables us to track how descriptions of the same place evolve over time, with full transparency into their source structure and transformation process. Its design has been guided by real-world use cases in digital heritage, and it plays a central role in making the resulting knowledge graphs both expressive and reproducible.

The ontology is openly developed at [github.com/frances-ai/HeritageTextOntology](https://github.com/frances-ai/HeritageTextOntology), and its documentation, including diagrams and examples, is available at [w3id.org/hto](https://w3id.org/hto).


### Key Ontological Enhancements

- **Textual Record Modeling**: New classes such as `HTO:Article`, `HTO:PlaceRecord`, `HTO:InternalRecord`, and `HTO:TermRecord` differentiate between OCR-extracted fragments, cleaned entries, and semantically disambiguated concepts. The `HTO:Description` class tracks structured outputs from GPT-4, manual annotations, or post-processing tools.

- **Digitization Provenance**: Bibliographic metadata is modeled using `HTO:Work`, `HTO:Volume`, and `HTO:Edition`, with provenance relationships defined via [PROV-O](https://www.w3.org/TR/prov-o/) and [schema.org](https://schema.org). Each `HTO:Article` is linked to its digitized source via permanent NLS page URLs and includes annotations such as `HTO:textQuality` to assess OCR accuracy and reliability.

- **Concept Evolution and Semantic Clustering**: `HTO:Concept` is used in combination with [SKOS](https://www.w3.org/TR/skos-reference/) to group equivalent or evolving place references across multiple gazetteer editions. Concepts can represent locations, institutions, or geographical types and are dynamically inferred from embeddings and term clustering.

- **Geographic and Type Annotation**: The ontology introduces `HTO:GeographicAnnotation` for storing lat/lon coordinates derived from external services or contextual inference. It also includes `HTO:LocationType` for classifying place categories (e.g., parish, river, estate).

- **Linking and External Alignment**: Instances of `HTO:PlaceRecord` and `HTO:Concept` may include links to external resources using `HTO:externalMatch`, allowing interconnection with [Wikidata](https://www.wikidata.org), [DBpedia](https://www.dbpedia.org), and other knowledge bases.

- **Lineage and Versioning Support**: Using `HTO:wasDerivedFrom`, `HTO:wasRecordedIn`, and `HTO:hasTextQuality`, the ontology supports full lineage tracking from OCR to human-reviewed RDF. This is critical for understanding transformations across stages of digitization, modeling, and enrichment.

### Example Use in Mapping Change

Each gazetteer article is instantiated as an `HTO:Article`, linked to its originating `HTO:Volume` and to one or more `HTO:Concept`s (e.g., "Aberdeen"). Concepts aggregate variations of place descriptions across editions, while RDF-level annotations record when, where, and how each article was extracted or transformed.

Prompt templates and GPT outputs are represented as `HTO:InformationResource`s, allowing clear documentation of AI-assisted steps. This structured metadata facilitates reproducibility and comparative studies across digitized corpora.

HTO is designed to be extensible and aligns with best practices in cultural heritage modeling, combining traditional bibliographic ontologies with novel AI-aware components.

