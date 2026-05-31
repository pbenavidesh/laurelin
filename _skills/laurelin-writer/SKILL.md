---
name: laurelin-writer
description: >
  Writes, drafts, edits, or generates Claude Code prompts for the
  laurelin Quarto book — a pedagogical text on optimization, kernel
  methods, and Support Vector Regression by Pablo Benavides-Herrera.
  Use whenever the user asks to write or revise chapter content,
  generate a CC prompt for a chapter, check voice consistency, rename
  a chapter title, or rewrite a section of laurelin. Also triggers on:
  "escribe el capítulo", "draft chapter", "does this sound AI-written",
  "fix this section", "write the motivation for", "generate the CC
  prompt for chapter N", or any request involving laurelin content.
  Always load this skill before writing any .qmd content for laurelin.
---

# laurelin-writer

A skill for writing and maintaining the *laurelin* Quarto book with
consistent voice, pedagogy, and technical conventions.

---

## Book identity

**Title:** Laurelin — From Optimization to Percentage-Error SVR
**Author:** Pablo Benavides-Herrera (ITESO, Guadalajara, Mexico)
**Repo:** https://github.com/pbenavidesh/laurelin
**Audience:** Undergraduate → graduate students with calculus background
**Language:** English (US)
**Tone:** First-person narrative, formal but not intimidating

The book builds from first principles of optimization to the author's
PhD thesis contributions: a unified family of SVR models that optimize
percentage-error loss functions directly. The early chapters require
nothing beyond multivariable calculus. The later chapters are
graduate-level. The goal throughout is the same: motivate before
formalizing, show where equations come from, never assume the reader
already cares.

---

## Voice and style

### What this book sounds like

The preface is the canonical voice reference. Key characteristics:

- Short declarative sentences that carry weight on their own:
  *"I could not. I did not know where to start."*
- Narrative before definition — the problem comes first, the
  formalism arrives as the answer to a question
- Em dash as a reflective pause, not decoration:
  *"The variables I cared about — orders, failures, costs —
  did not come pre-packaged as functions."*
- Italics for clarification, not artificial emphasis
- Paragraphs that end with a turn, not a summary

### Patterns to avoid — these mark AI-written text

**Hedging phrases:**
- "That was not a sophisticated ambition"
- "This may seem complex at first"
- "It is worth noting that"
- "Interestingly,"

**Generic section headers:**
- "Who this book is for"
- "How to use this book"
- "Key takeaways"
- "In this chapter, we will..."

**Title patterns:**
- "A Problem Worth Solving"
- "Why X Matters"
- "Understanding X"
- "Introduction to X"
- "X: A Comprehensive Overview"

**Filler adjectives:**
- "powerful", "elegant", "sophisticated", "robust" (unless
  technically precise)
- "seamlessly", "naturally", "straightforwardly"

**Structural tells:**
- Opening a section with a definition instead of a question
  or observation
- Bullet lists where continuous prose works better
- Transition sentences that restate what was just said:
  *"Now that we have seen X, we turn to Y"*
- Closing a chapter with "In the next chapter, we will..."

---

## Book structure

Five parts, 24 chapters, progressing from undergraduate to graduate:

**Part I — The Language of Optimization** (Ch. 1–6)
Unconstrained → constrained optimization → Lagrangian duality →
KKT conditions → numerical methods panorama

**Part II — The Kernel Trick** (Ch. 7–10)
Representation problem → kernel trick → common kernels →
Representer Theorem

**Part III — Support Vector Machines** (Ch. 11–15)
SVM classification → SVR → LS-SVR → Gaussian Processes →
SVR in perspective (comparison with RF, XGBoost, Elastic Net, GP, NNs)

**Part IV — Percentage-Error SVR** (Ch. 16–20)
Why percentage error matters → ε-SVR with MAPE → LS-SVR with RMSPE →
symmetric variants → unified framework

**Part V — Optimization at Scale** (Ch. 21–24)
Scale problem → SMO classical → SMO with sample-dependent constraints
→ empirical comparison (SMO vs. LIBSVM vs. OSQP vs. MOSEK vs. Clarabel)

---

## Running examples

Two datasets appear throughout the book as parallel examples:

| Thread | Dataset | Source | Notes |
|---|---|---|---|
| Time series | `vic_elec` | `tsibbledata` (R) | Victorian electricity demand |
| Cross-sectional | California Housing | `modeldata` / sklearn | Use subsample ~500–1000 obs for pedagogy; full dataset only in Ch. 24 |

Every chapter that introduces a new concept should illustrate it with
at least one of these two datasets.

---

## Technical conventions

### Chapter structure

Each chapter follows this pattern:
1. **Opening** — a concrete question or observation, not a definition
2. **Development** — mathematical content motivated by the opening
3. **Collapsible derivations** — full proofs in
   `::: {.callout-note collapse="true"}` blocks
4. **Code** — executable R and Python in `{.panel-tabset}` blocks
5. **Exercises** — 2–4 problems, mix of computational and conceptual

### Callout taxonomy

Five callout types, each with a specific role. Never use a type
outside its defined role — consistency is what makes them useful.

| Type | Role | Collapsed | Appearance |
|---|---|---|---|
| `note` | Full derivations | Yes (`collapse="true"`) | `simple` |
| `tip` | Intuition, geometric insight, practical connection | No | `simple` |
| `important` | Theorems, key results the reader must not skip | No | `default` |
| `warning` | Conceptual confusions students commonly make | No | `default` |
| `caution` | Implementation errors students commonly make | No | `default` |

**Templates:**

```markdown
::: {.callout-note collapse="true"}
## Derivation: Why the dual objective is concave
[Full derivation — collapsible so it does not block the narrative]
:::

::: {.callout-tip}
## Geometric picture
[Intuition or visual explanation — always visible]
:::

::: {.callout-important}
## Theorem X.Y — [specific name]
[Statement — always visible, default appearance draws attention]
:::

::: {.callout-warning}
## Common confusion: MAPE is undefined at zero
[Explanation of the confusion and how to avoid it]
:::

::: {.callout-caution}
## Implementation: scale features before applying RBF kernel
[Explanation of the error and the correct approach]
:::
```

Derivation titles must be specific:
- ✓ "Derivation: Why the dual objective is concave"
- ✗ "Derivation: Proof"
- ✗ "Advanced: Details"

### Code tab pattern

All R/Python code tabs use **tabset groups** so that switching language
in one tab automatically switches all other tabs on the page. Always
include `group="language"` on every tabset:

````markdown
::: {.panel-tabset group="language"}
## R

```{r}
# executable R code
```

## Python

```{python}
# executable Python code
```

:::
````

The `group="language"` attribute is non-negotiable — without it,
switching language on one example does not synchronize the rest of
the chapter.

---

### R conventions

Follow tidyverse/tidymodels style throughout. Non-negotiable rules:

```r
# Packages — load what you need; prefer individual over library(tidyverse)
# when only one or two packages are needed
library(tidyverse)      # ggplot2, dplyr, tidyr, purrr, readr, stringr
library(tidymodels)     # recipes, parsnip, workflows, tune, yardstick
library(tsibble)        # time series tibbles
library(tsibbledata)    # vic_elec and other datasets
library(feasts)         # time series features and graphics
library(fable)          # forecasting models

# Native pipe only — never %>%
data |> filter(...) |> mutate(...)

# snake_case for all objects
# Naming conventions:
#   suffix _df   = tibble / data frame
#   suffix _tsb  = tsibble
#   suffix _rec  = recipe
#   suffix _fit  = fitted model
#   suffix _wf   = workflow
#   suffix _res  = resampling results
#   suffix _plt  = plot object

# ggplot2 — always use theme_minimal() or theme_bw() as base
# Label axes explicitly; never leave default column names as axis labels
```

**Never use:**
- `%>%` (magrittr pipe)
- `attach()` or `with()`
- `setwd()` — use relative paths or `here::here()`
- Base R `ts` objects when `tsibble` is available
- `forecast::` package functions when `fable` equivalents exist

**Always prefer:**
- `purrr::map()` family over `lapply()`/`sapply()`
- `tidyr::pivot_longer()` / `pivot_wider()` over `reshape2`
- Explicit `dplyr::` or `ggplot2::` namespace only when there is
  a genuine ambiguity risk — otherwise load the package and use
  the function directly

**Code quality:**
- Every chunk that produces output should be self-contained and
  reproducible — do not rely on objects created in a previous chunk
  unless the chapter flow makes the dependency explicit
- Use `#| label: fig-xxx` and `#| fig-cap:` for all figures so
  Quarto can cross-reference them
- Use `#| label: tbl-xxx` and `#| tbl-cap:` for all tables

---

### Python conventions

Follow PEP 8 and current scientific Python best practices:

```python
# Standard imports — in this order, one block each
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# sklearn — prefer pipeline-based workflows
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import fetch_california_housing
from sklearn.model_selection import train_test_split

# Type hints on functions when the signature is non-obvious
def fit_model(X: np.ndarray, y: np.ndarray) -> object:
    ...
```

**Style rules:**
- snake_case for variables and functions, PascalCase for classes
- Explicit axis labels on all plots — never default column names
- `matplotlib` with `seaborn` style as default:
  `plt.style.use("seaborn-v0_8-whitegrid")`
- Avoid `*` imports — always explicit namespace
- Prefer `pathlib.Path` over `os.path` for file operations
- f-strings over `.format()` or `%` formatting

**Code quality (same principle as R):**
- Every cell self-contained and reproducible
- Use Quarto's `#| label:` and `#| fig-cap:` chunk options
  for figures and tables — identical syntax to R chunks

---

### Code annotation

Use code annotation for any explanation of *why* something is done,
including short one-liners. Prefer annotation over `#` comments
whenever the explanation benefits from visual separation from the code.

Use plain `#` only for purely technical notes (index conventions,
tolerance values) where no pedagogical explanation is needed.

---

### Margin content

Margin content is not a default — use it selectively for material
that is secondary to the main argument but genuinely useful inline.

**Recall margins** — the most important use case. When the text
references a concept from an earlier chapter, put a 1–3 line
synthesis in the margin with a cross-reference:

```markdown
::: {.column-margin}
**Recall** (@sec-kkt): the stationarity condition requires
$\nabla_{\boldsymbol{\omega}} \mathcal{L} = 0$, giving
$\boldsymbol{\omega} = \sum_k \beta_k \varphi(\mathbf{x}_k)$.
:::
```

**Reference equations** — identities the reader should know but
that are not being derived in the current text:

```markdown
::: {.column-margin}
Integration by parts: $\int u \, dv = uv - \int v \, du$
:::
```

**Complementary figures or output** — only when the visualization
is secondary and would interrupt the flow if placed inline.

**Never use margin content for:**
- Primary results, theorems, or derivations
- Figures that need to be read carefully
- Content required to understand the current paragraph

---

### Mermaid diagrams

Use Mermaid for flowcharts and relationship diagrams. Primary use cases:
- Algorithm flowcharts (SMO working set selection, optimization loops)
- Relationships between the four model variants
- Chapter dependency maps

```markdown
```{mermaid}
flowchart TD
    A[Initialize α = 0] --> B{KKT violated?}
    B -- Yes --> C[Select working set i, j]
    C --> D[Solve 2-variable QP analytically]
    D --> B
    B -- No --> E[Return solution]
```
```

Do not use Mermaid for mathematical relationships (use equations) or
anything a simple sentence explains better.

---

### Cross-references

Every equation, figure, table, theorem, and section referenced later
must have a label. Use these prefixes:

| Object | Prefix | Example |
|---|---|---|
| Chapter heading | `sec-` | `# KKT Conditions {#sec-kkt}` |
| Section | `sec-` | `## Stationarity {#sec-kkt-stationarity}` |
| Equation | `eq-` | `{#eq-dual}` |
| Figure | `fig-` | `{#fig-rbf-kernel}` |
| Table | `tbl-` | `{#tbl-results}` |
| Theorem/Proposition | `thm-` | `{#thm-representer}` |

**Chapter labels** — every chapter file must have an explicit label
on its `#` heading. Quarto generates automatic labels from the title
text, but they break if the title is ever renamed. Always use explicit:

```markdown
# KKT Conditions {#sec-kkt}
```

The `ch-` identifiers in `_quarto.yml` are internal scaffold names
only — they are not used for cross-references. All cross-references
use the `sec-` label on the heading itself.

**Back-references in later chapters are mandatory** when a result
from Part I or II is used in Part III–V:

```markdown
As shown in @sec-kkt, the stationarity condition yields...
Substituting @eq-dual into @eq-primal gives...
```

When the back-reference is to a result the reader genuinely needs
to remember, add a recall margin alongside it (see above).

**Appendices** — two appendices serve as quick-reference only:
- **Appendix A: Notation reference** — table of all symbols
- **Appendix B: Mathematical identities** — inequalities, matrix
  identities, and calculus results used across chapters

Derivations never go to appendices — they stay in collapsible
callouts within the chapter where they are needed.

---

### `_quarto.yml` global settings

These settings must be present in `_quarto.yml`. Include the full
block when generating any CC prompt that touches `_quarto.yml`:

```yaml
format:
  html:
    theme:
      light: cosmo
      dark: darkly
    code-fold: true
    code-tools: true
    toc: true
    toc-depth: 3
    number-sections: true
    math: mathjax
    fig-align: center
    callout-appearance: simple
    smooth-scroll: true
    highlight-style: github
    reference-location: margin
    citation-location: margin
```

Override at the document level in `.qmd` frontmatter when a single
chapter needs different behavior — never change `_quarto.yml` for
per-chapter overrides.

---

### Mathematical notation

Follows the thesis notation exactly:
- Dataset: $\mathcal{D} = \{(\mathbf{x}_k, y_k)\}_{k=1}^N$
- Prediction: $f(\mathbf{x}) = \boldsymbol{\omega}^\top \varphi(\mathbf{x}) + b$
- Kernel matrix: $\Omega$ with elements $\Omega_{l,k} = K(\mathbf{x}_l, \mathbf{x}_k)$
- Box constraints: $\alpha_k, \alpha_k^* \in [0, 100C/y_k]$
- Target-weighted diagonal: $Y_\Gamma = \text{diag}(y_1^2/\Gamma, \ldots, y_N^2/\Gamma)$
- Summation: $\sum_{k=1}^N$ (not $\Sigma$)

---

## Chapter title conventions

Titles should be specific and concrete, not generic:

✓ Good titles:
- "A Forecast That Costs More Than It Saves"
- "When the Gradient Points Uphill"
- "The Box That Knows Its Own Constraints"
- "Kernels Without Coordinates"

✗ Avoid:
- "Introduction to Optimization"
- "Why Kernels Matter"
- "Understanding the Dual Problem"
- "A Powerful Framework"

Section headers follow the same rule — specific over generic.

---

## Generating Claude Code prompts

When asked to generate a CC prompt for a chapter:

1. The prompt should specify the exact file path:
   `/home/pabs/Documents/PhD/laurelin/chapters/NN-name.qmd`
2. Include the full `.qmd` content to write — never just a description
3. End with the git commit and push commands:
   ```
   git add chapters/NN-name.qmd
   git commit -m "docs: write chapter N — [title]"
   git push
   ```
4. Note any renv dependencies the chapter introduces that need
   `renv::snapshot()` after installing

---

## Pedagogical principles

- **Motivate before formalizing** — never open a section with a
  definition
- **One idea per section** — if a section needs two ideas, split it
- **Concrete before abstract** — use the running examples before
  introducing general notation
- **Collapsible for optional depth** — advanced derivations should
  not block the narrative for undergraduate readers
- **Exercises at both levels** — at least one exercise accessible to
  undergraduates, at least one that requires graduate-level thinking
