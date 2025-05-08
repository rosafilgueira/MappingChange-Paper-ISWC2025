## Construction and Content
{:#resourceconstruction}

The resource was built using a modular pipeline comprising:

### Extraction

- Volume-specific scripts (e.g., [extract_gaz_1803.py](https://github.com/francesNLP/MappingChange/blob/main/src/extract_gaz_1803.py)) segment OCR text using GPT-4 with prompts adapted to differing article structures.
- Prompts handle varying formats, including mid-page entries, redirects, and irregular headers.

#### Volume-Specific Prompt Engineering

Because each Gazetteer edition between 1803 and 1901 features highly distinct layout conventions (e.g., capitalization, abbreviations, header formatting, article delimiters), we could not apply a single uniform prompt across all volumes. Instead, we designed **custom GPT-4 prompts** for each edition to ensure accurate article segmentation and place name extraction.

The table below summarizes the key differences and our adaptation strategies:

| Gazetteer Volume | Prompt Focus                    | Format Characteristics                       | Prompt Adaptation Strategy                                                                 |
|------------------|----------------------------------|-----------------------------------------------|---------------------------------------------------------------------------------------------|
| 1803             | Entry detection in irregular formatting | Short entries, inconsistent punctuation        | Prompt includes examples with minimal structure; stresses sentence-level cues for boundaries |
| 1806             | Parsing longer headers          | Descriptive headers like “Parish of…”         | Prompt highlights multi-word headers and requests exact header extraction                   |
| 1825             | Delimiting fused articles       | Minimal line breaks between articles          | Prompt stresses lexical patterns (e.g., place types, initial caps) to find boundaries       |
| 1838             | Handling abbreviations and symbols | Use of brackets, abbreviations for counties   | Prompt includes example abbreviations and instructions to include them in headers           |
| 1842             | Identifying hierarchical entries | Entries with sub-places or parenthesized detail | Prompt uses hierarchical examples and specifies nested JSON structure                       |
| 1846             | Normalizing inconsistent capitalization | Random capital words mid-paragraph            | Prompt emphasizes ignoring internal caps unless followed by specific patterns               |
| 1868             | Filtering out printed annotations | Use of special characters, side notes         | Prompt includes rule to ignore marginal notes or typesetting artifacts                      |
| 1884 & 1901      | Unified structured prompt       | Consistent bold headers, clear formatting      | A single prompt applied to both; relies on standard visual patterns and separators          |

Each prompt is represented as an instance of `HTO:InformationResource`, enabling traceable documentation of prompt design and LLM usage in our pipeline.

### Cleaning & Deduplication

- Cleaned JSON outputs are merged.
- Fuzzy matching, prefix-trees, and substring containment detect duplicates across years and within volumes.

### DataFrame Generation

- Unified metadata from OCR, XML, and GPT outputs are exported to structured JSON-based DataFrames.

### Knowledge Graph Generation

- RDF triples are created using the improved HTO ontology.
- Entities include Articles, Volumes, Concepts, and digitization provenance.

### Entity Linking

- Gazetteer terms are matched to DBpedia and Wikidata using label and description matching.
- Articles with similar embeddings are grouped into concepts using `all-mpnet-base-v2`.

### Enrichment

- Concepts are assigned summaries, sentiment values, and external links.
- Article timelines visualize the evolution of place concepts across editions.

### Search Indices

- Elasticsearch indices are built for articles, Wikidata, and DBpedia entities.
- Vector search enables semantically similar article discovery.

### Geoparsing 

- For enriched geospatial analysis, `geoparse.py` tags locations using SpaCy NER and Gazetteer context.

All scripts are in [MappingChange/src/](https://github.com/francesNLP/MappingChange/tree/main/src), and their outputs are versioned and archived.

