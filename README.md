# Mapping Change: A Temporal Knowledge Graph of Scottish Gazetteers (1803–1901)

This repository contains the source files for our **ISWC 2025 Resources Track** paper. The paper presents the *Mapping Change* project, including the construction of the **GazetteersScotland-KG** and the development of the **Heritage Textual Ontology (HTO)**.

This article is written using the [ScholarMarkdown](https://github.com/rubensworks/ScholarMarkdown) framework and rendered to HTML and PDF using [Nanoc](https://nanoc.app/).

---

## 📄 Paper Overview

The paper describes:
- Historical Gazetteers of Scotland (1803–1901) digitized by the National Library of Scotland
- A multi-step pipeline for article segmentation, entity enrichment, and ontology alignment
- Use of GPT-4 and custom prompt engineering for structured extraction
- The **Heritage Textual Ontology (HTO)** for modeling digitization provenance, place-based concepts, and LLM outputs
- Integration with external resources (e.g., Wikidata, DBpedia)
- Deployment in the [Frances Semantic Platform](https://frances-ai.com)

---

## 🚀 Quick Start

### Development Mode (Live Preview)

```bash
bundle install
bundle exec guard
```

Then visit [http://localhost:3000](http://localhost:3000) in your browser to see the live preview.

### Static Build

```bash
bundle install
bundle exec nanoc compile
```

Output will be generated in the `output/` directory. You can open `output/index.html` in a browser or print it to PDF.


### Export PDF (WeasyPrint)

After compiling:
```bash
weasyprint output/index.html output/paper.pdf
```
Make sure weasyprint is installed ([see](https://weasyprint.readthedocs.io/)).
---

## 📁 Repository Structure

```text
.
├── content/
│   ├── index.md.erb            # Main entry point for the paper
│   ├── abstract.md             # Abstract section
│   ├── introduction.md         # Introduction
│   ├── related-work.md         # Related work
│   ├── resource-description.md # Description of datasets and tools
│   ├── hto.md                  # Heritage Textual Ontology section
│
├── layouts/
│   └── default.html.erb        # ScholarMarkdown layout template
│
├── styles/
│   ├── strict-print.css        # Print styling for PDF export
│   └── screen.scss             # Styling for HTML rendering
│
├── output/
│   ├── index.html              # Rendered HTML
│   └── paper.pdf               # Exported PDF (after WeasyPrint step)
```

---

## 🧠 Dependencies

Make sure you have Ruby installed (recommended: via `rbenv` or `rvm`):

Install Bundler if needed:

```bash
gem install bundler
```

Then install all dependencies:

```bash
bundle install
```

You’ll also need weasyprint for PDF export:

```bash
pip install weasyprint
```

---


## 🔗 Project Links

- 📘 Main project repo: [MappingChange on GitHub](https://github.com/francesNLP/MappingChange)
- 📘 Ontology repo: [HeritageTextOntology](https://github.com/frances-ai/HeritageTextOntology)
- 📘 Ontology documentation: [HTO at w3id.org](http://w3id.org/hto)
- 🌐 Live HTO Docs: [https://frances-ai.github.io/HeritageTextOntology](https://frances-ai.github.io/HeritageTextOntology)

---

## 📝 Citation

Citation details (BibTeX) will be provided upon acceptance.
