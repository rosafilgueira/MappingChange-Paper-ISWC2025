## Construction and Content
{:#resourceconstruction}

The *MappingChange* knowledge base is built through a multi-stage pipeline that transforms unstructured OCR-aligned ALTO XML files into structured DataFrames and RDF graphs. Each stage of the pipeline is modular and reproducible, with edition-specific scripts documented and openly available in the [MappingChange GitHub repository](https://github.com/francesNLP/MappingChange).

Of the twelve editions in the [NLS collection](https://data.nls.uk/data/digitised-collections/gazetteers-of-scotland/), we process ten (see [Figure 6](#fig-gz-vols)) as fully descriptive gazetteers with complete metadata and multi-volume structure where applicable. We exclude the 1828 edition, which is a town-focused summary rather than a gazetteer, and the 1848 edition, for which only Volume II is available. These ten editions form the basis of the MappingChange resource, which segments article-level entries from each page of OCR-aligned text. This structured segmentation enables precise extraction of place names and their descriptions—supporting downstream tasks such as cross-edition comparison, named entity linking, and interactive historical exploration.

<p align="center">
  <img src="images/gazetteers_vols.png" alt="Number of Gazetteer Volumes Per Year" style="max-width: 400px; height: auto; border: 1px solid #ccc;" />
</p>
<p align="center" id="fig-gz-vols"><strong>Figure 6:</strong> Number of volumes per gazetteer edition (1803–1901). The 1883 edition spans six volumes, while most others are single- or double-volume works.</p>

### Article Extraction and Prompt Engineering

As input to our pipeline, we use the [gazetteers_dataframe](https://drive.google.com/file/d/1J6TxdKImw2rNgmdUBN19h202gl-iYupn/view?usp=share_link), a consolidated DataFrame derived from our earlier [Gazetteer_HTO knowledge graph](cite:cites yu_2024_14051678). This resource contains entries from the ten selected editions, each representing the full OCR text of a page along with metadata such as edition identifier, volume, page number, and candidate place names.

The goal of this stage is to extract structured article-level place descriptions. This task presents several challenges: (a) place names can be ambiguous or repeated across editions; (b) many descriptions span multiple pages; (c) some places are introduced only in later editions; (d) entries frequently include references to other places (e.g., *"See Paisley"*); and (e) alternative place names must be captured. Our custom GPT-4 prompts and scripts are designed to address these challenges by isolating each named place and its full contextual description, including cross-references and aliases.

We use edition-specific Python scripts to segment and extract articles. Each script tailors the GPT-4 prompt to the unique typographic and editorial conventions of the edition—handling mid-page redirects, abbreviation styles, header formats, and layout variations.

The table below summarizes key layout features and corresponding prompt adjustments:

| **Edition** | **Layout/Format Features**                                | **Prompt Adjustments**                                  |
|-------------|------------------------------------------------------------|----------------------------------------------------------|
| 1803        | All caps titles, minimal punctuation, mid-column entries   | Prompt includes rules for semicolon-delimited entries    |
| 1806        | Similar to 1803 with improved spacing                      | Added regex pre-filters to exclude 3-letter headers      |
| 1825        | Shorter entries, denser formatting                         | Emphasis on short entries and abbreviation disambiguation |
| 1838        | Two-column format, clearer title separation                | Prompt refined to distinguish article breaks explicitly  |
| 1842        | Redirects common, layout noisy                             | Includes logic for disambiguating abbreviated redirects  |
| 1846        | Continued abbreviation patterns, multi-page entries        | Includes continuity checks and redirect expansion        |
| 1868        | Longer, structured entries with location hierarchies       | Added cues for nested article types and locations        |
| 1884–1901   | Title-cased entries, structured and clean layout           | Simplified prompts; uses typographic features directly   |

The scripts tokenize OCR text by page, apply prompts in batch mode, and parse outputs into structured JSON files. These are then aggregated into edition-specific DataFrames—each with one row per article.

### DataFrames to RDF

Each DataFrame is cleaned and converted to RDF using the [Heritage Textual Ontology (HTO)](https://w3id.org/hto). Each place article is represented as a `hto:Description`, annotated with quality metrics, provenance (e.g., edition, volume, page), and extraction method (GPT-4). This step is implemented using Python mapping scripts and SPARQL templates.

### Semantic Enrichment and Linking

Following RDF generation, the knowledge base is semantically enriched through:

- **Concept Clustering**: Sentence embeddings and clustering algorithms identify semantically related articles across editions. Resulting clusters form `hto:Concept` instances representing diachronic place descriptions.
- **Entity Linking**: Articles are linked to [Wikidata](https://www.wikidata.org) and [DBpedia](https://www.dbpedia.org) using hybrid embedding and string-matching approaches.
- **Geospatial Annotation**: Named entity recognition (NER) and the Edinburgh Geoparser are used to resolve and annotate place names with coordinates and place types, represented as `hto:GeographicAnnotation`.

### Knowledge Graph Serialization and Deployment

Final outputs are serialized in RDF/Turtle and deployed via a public [Fuseki SPARQL endpoint](http://query.frances-ai.com/hto_gazetteers). All steps are implemented in executable Python scripts and Jupyter notebooks. Each stage is also represented in the RDF using HTO’s provenance properties (e.g., `prov:wasGeneratedBy`, `hto:hasTextQuality`), ensuring transparency and reproducibility.

A pipeline overview and walkthrough are available in the [MappingChange GitHub repository](https://github.com/francesNLP/MappingChange), along with instructions for re-running each step. When gazetteers span multiple volumes (e.g., 1838, 1842), the outputs are merged using dedicated scripts into a single edition-level DataFrame prior to RDF conversion.


