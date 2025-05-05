## Construction and Content

The resource was built using a modular pipeline comprising:

### Extraction
- Volume-specific scripts (e.g., `extract_gaz_1803.py`) segment OCR text using GPT-4 with prompts adapted to differing article structures.
- Prompts handle varying formats, including mid-page entries, redirects, and irregular headers.

### Cleaning & Deduplication
- Cleaned JSON outputs are merged.
- Fuzzy matching, prefix-trees, and substring containment detect duplicates across years and within volumes.

### DataFrame Generation
- Unified metadata from OCR, XML, and GPT outputs are exported to structured JSON-based DataFrames.

### Knowledge Graph Generation
- RDF triples are created using the improved HTO ontology.
- Entities include Articles, Volumes, Concepts, and digitization provenance.

###  Entity Linking
- Gazetteer terms are matched to DBpedia and Wikidata using label and description matching.
- Articles with similar embeddings are grouped into concepts using `all-mpnet-base-v2`.

### Enrichment
- Concepts are assigned summaries, sentiment values, and external links.
- Article timelines visualize the evolution of place concepts across editions.

### Search Indices
- Elasticsearch indices are built for articles, Wikidata, and DBpedia entities.
- Vector search enables semantically similar article discovery.

### Geoparsing (Optional)
- For enriched geospatial analysis, `geoparse.py` tags locations using SpaCy NER and Gazetteer context.

All scripts are in `src/`, and their outputs are versioned and archived.

