## Introduction

Descriptive gazetteers were central to how 19th-century Scotland documented its places—towns, parishes, rivers, castles, lochs, and glens—embedding them in historical, economic, and social narratives. Published from 1803 to 1901, these texts reflect transformations driven by industrialization, land reform, religious change, and imperial expansion.

While digitized versions of these works are available from the [National Library of Scotland](https://data.nls.uk/data/), their structure and semantics remain locked in noisy OCR outputs. *Mapping Change* extracts, cleans, and semantically enriches these texts using GPT-4, prompt engineering, and ontology-based modeling to produce a temporal knowledge graph.

Our contributions include:
- A complete extraction and semantic modeling pipeline tailored to ten different gazetteer editions.
- A robust RDF dataset aligned with the [Heritage Textual Ontology (HTO)](https://w3id.org/hto#InformationResource).
- Integration with external knowledge bases (Wikidata, DBpedia) and semantic search interfaces.
- Deployment through the [Frances](http://www.frances-ai.com) platform for public access and scholarly use.

This work supports research into how Scottish places were described and conceptualized over time.

