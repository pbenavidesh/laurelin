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

### Primary datasets (Part III–V)

Two datasets serve as the main thread from Part III onward:

| Thread | Dataset | Source | Notes |
|---|---|---|---|
| Time series | `vic_elec` | `tsibbledata` (R) | Victorian electricity demand |
| Cross-sectional | California Housing | `modeldata` / sklearn | Subsample ~500–1000 obs for pedagogy; full dataset only in Ch. 24 |

### Part I and II examples

Part I and II use domain-grounded examples — real problems from
business, energy, IT, and AI — rather than abstract functions.
Each example is chosen to be the most natural illustration of the
mathematical concept, not to be consistent across chapters.

Target domains: **business, energy, IT, AI**. Audience: financial
engineering and data science students.

---

## Chapter registry

One entry per chapter. Each entry specifies: filename, confirmed
title, mathematical scope, real-world anchor, datasets/examples,
and whether it introduces the primary running examples.

---

### Part I — The Language of Optimization

**Ch. 1 — `01-motivation.qmd`**
Title: From Spreadsheet to Function
Scope: Motivation only — no formal mathematics. What is prediction?
Why do we need equations? What tools exist and why are they not enough?
Anchor: Cloud server demand forecasting — a company's infrastructure
costs spike unpredictably; predicting demand would allow proactive
scaling. Introduces both vic_elec and California Housing as the book's
running examples.
Code: Load and visualize both datasets. First exploratory plots.
Introduces running examples: YES

**Ch. 2 — `02-unconstrained.qmd`**
Title: TBD
Scope: Unconstrained optimization — gradients, convexity, first and
second order conditions, geometric intuition.
Primary anchor: EOQ (Economic Order Quantity) — total inventory cost
has a natural U-shape; minimum found with first derivative = 0.
Secondary mention: latency vs. server resources tradeoff.
Code: Plot cost functions, visualize gradient descent on EOQ surface.
Introduces running examples: NO

**Ch. 3 — `03-constrained.qmd`**
Title: TBD
Scope: Constrained optimization — feasible region, equality and
inequality constraints, geometric interpretation.
Primary anchor: Portfolio optimization — maximize return subject to
fixed budget.
Secondary anchor: Production planning — maximize units produced with
limited machine-hours and materials.
Code: Visualize feasible regions, plot constrained vs unconstrained
optima.
Introduces running examples: NO

**Ch. 4 — `04-lagrangian-duality.qmd`**
Title: TBD
Scope: Lagrangian construction, weak and strong duality, shadow prices,
law of diminishing returns.
Anchor: Digital marketing campaign — distribute budget across channels
(Google Ads, Meta, email) maximizing conversions. Each channel has
diminishing returns. Lagrange multiplier = value of one extra peso of
budget (shadow price).
Code: Visualize diminishing returns curves, Lagrangian surface.
Introduces running examples: NO

**Ch. 5 — `05-kkt.qmd`**
Title: TBD
Scope: KKT conditions — stationarity, primal feasibility, dual
feasibility, complementary slackness. When are KKT sufficient?
Anchor: Same marketing campaign extended with minimum spend constraints
per channel. KKT conditions determine which constraints are active.
Code: Illustrate complementary slackness geometrically.
Introduces running examples: NO

**Ch. 6 — `06-numerical-methods.qmd`**
Title: TBD
Scope: Panorama of numerical methods — first-order (GD, SGD, Adam),
second-order (Newton, BFGS), interior-point, decomposition methods.
Computational complexity and when each applies.
Anchor: Churn prediction model calibration — parameters must be tuned
to minimize prediction error. Gradient descent walks the error surface.
Motivates why smarter methods (Newton, decomposition) matter at scale.
Code: Animate gradient descent with different learning rates on a
simple loss surface.
Introduces running examples: NO

---

### Part II — The Kernel Trick

**Ch. 7 — `07-representation.qmd`**
Title: TBD
Scope: Why linear models fail for complex patterns. Feature maps.
Mapping to higher dimensions. The curse of dimensionality as motivation.
Anchor: Fraud detection — transaction amount and frequency do not
linearly separate fraud from legitimate transactions. Need richer
representation.
Code: Visualize non-linear decision boundary problem with synthetic
fraud data.
Introduces running examples: NO

**Ch. 8 — `08-kernel-trick.qmd`**
Title: TBD
Scope: The kernel trick — computing inner products in high-dimensional
space without explicit mapping. Mercer's theorem (informal).
Anchor: Same fraud detection problem resolved with kernel — show that
explicit mapping is computationally intractable but kernel is not.
Code: Compare explicit feature map vs kernel computation cost.
Introduces running examples: NO

**Ch. 9 — `09-common-kernels.qmd`**
Title: TBD
Scope: RBF, polynomial, linear kernels — intuition, properties,
hyperparameters, when each applies.
Anchor: Customer segmentation by purchase behavior — find similar
customers. RBF captures local similarity, polynomial captures feature
interactions, linear serves as baseline. Connect to document similarity
as secondary example.
Code: Visualize kernel matrices for same dataset under different
kernels.
Introduces running examples: NO

**Ch. 10 — `10-representer-theorem.qmd`**
Title: TBD
Scope: Representer Theorem — why the solution lives in the span of
the training data even when the hypothesis space is infinite.
Implications for computational tractability.
Anchor: Any kernel model from Ch. 9 — use it to show that despite
infinite-dimensional feature space, the solution depends only on N
training points.
Code: Demonstrate sparsity of kernel model solution.
Introduces running examples: NO

---

### Part III — Support Vector Machines

**Ch. 11 — `11-svm-classification.qmd`**
Scope: SVM classification — hard and soft margin, geometric
motivation, dual formulation.
Anchor: Simple binary classification (fraud detection from Ch. 7/8
revisited, or spam detection as secondary).
Introduces running examples: NO

**Ch. 12 — `12-svr.qmd`**
Scope: SVR — ε-insensitive loss, primal, dual, support vectors in
regression context.
Introduces running examples: YES (vic_elec + California Housing
enter here and stay for the rest of the book)

**Ch. 13 — `13-ls-svr.qmd`**
Scope: LS-SVR — quadratic loss, linear system, structural differences
from ε-SVR.
Introduces running examples: Continues from Ch. 12

**Ch. 14 — `14-gaussian-processes.qmd`**
Scope: GP — Bayesian perspective, kernels as covariance functions,
posterior predictive distribution, uncertainty quantification.
Use smaller synthetic dataset to visualize uncertainty bands.

**Ch. 15 — `15-svr-in-perspective.qmd`**
Scope: Honest comparison — SVR vs RF, XGBoost, Elastic Net, GP, NNs.
Conceptual (guarantees, assumptions) + empirical (vic_elec +
California Housing results).

---

### Part IV — Percentage-Error SVR

All chapters use vic_elec + California Housing exclusively.

**Ch. 16 — `16-percentage-error.qmd`**
Scope: Why percentage error matters — practical motivation, MAPE
and RMSPE definitions, statistical foundations.

**Ch. 17 — `17-eps-svr-mape.qmd`**
Scope: ε-SVR with MAPE — how percentage scaling modifies box
constraints in the dual: $\alpha_k, \alpha_k^* \in [0, 100C/y_k]$.

**Ch. 18 — `18-ls-svr-rmspe.qmd`**
Scope: LS-SVR with RMSPE — how percentage scaling modifies the
regularization matrix: $Y_\Gamma = \text{diag}(y_1^2/\Gamma, \ldots, y_N^2/\Gamma)$.

**Ch. 19 — `19-symmetric-variants.qmd`**
Scope: Symmetric kernel extensions — what changes and what does not.
Symmetric kernel: $\Omega^s = \frac{1}{2}(\Omega + a\Omega^*)$.

**Ch. 20 — `20-unified-framework.qmd`**
Scope: Unified framework — the common variational structure behind
all four models. Paradigm-loss compatibility theorem.

---

### Part V — Optimization at Scale

**Ch. 21 — `21-scale-problem.qmd`**
Scope: Why QP solvers fail at SVR scale. $O(N^2)$–$O(N^3)$
complexity. California Housing full dataset as motivating example.

**Ch. 22 — `22-smo-classical.qmd`**
Scope: SMO — 2-variable subproblems, working set selection,
analytical solution, convergence.

**Ch. 23 — `23-smo-mape.qmd`**
Scope: SMO with sample-dependent constraints — the author's
contribution. Invariance theorem, efficiency extensions.

**Ch. 24 — `24-empirical-comparison.qmd`**
Scope: Solvers in practice — SMO vs LIBSVM vs OSQP vs MOSEK vs
Clarabel. California Housing full dataset. Convergence curves,
iteration counts, wall time.

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

**Two non-negotiable structural rules learned from Ch. 1:**

- **Never repeat the chapter title as a heading.** The YAML `title:`
  field already renders the title. Do not add `# Title {#sec-...}` as
  the first line of the body — it produces a duplicate heading.
  The first line of body content should be the opening sentence or the
  first `##` section heading.

- **Never use `---` horizontal rules between sections.** Quarto renders
  `##` headings with their own visual separation. A `---` above or below
  a section heading produces two consecutive horizontal lines. Use `##`
  headings alone to separate sections.

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

### Chapter setup pattern

Every chapter begins with two hidden setup chunks followed by a
collapsed "Required packages" callout. This is the non-negotiable
opening structure for every `.qmd` in laurelin:

````markdown
```{r}
#| label: setup
#| include: false

library(ggplot2)
library(dplyr)
library(tidyr)
library(here)
source(here::here("R/laurelin_theme.R"))
theme_set(theme_laurelin())
# add any chapter-specific R packages here
```

```{python}
#| label: setup-py
#| include: false

import sys
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
# Resolve python/ whether cwd is the project root or the chapter dir
for _cand in ("python", os.path.join("..", "python")):
    if os.path.isdir(_cand):
        sys.path.insert(0, os.path.abspath(_cand))
        break
from laurelin_plot import lc, apply_light, apply_dark, reset_style
# add any chapter-specific Python packages here
```

::: {.callout-note collapse="true" appearance="simple"}
## Required packages

::: {.panel-tabset group="language"}
## R
```r
library(ggplot2)   # plotting
library(dplyr)     # data manipulation
library(tidyr)     # reshaping
# list all R packages loaded in setup
```
## Python
```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
# list all Python packages imported in setup
```
:::
:::
````

The callout lists packages for the reader's benefit; the actual loading
happens in the hidden setup chunks. **Never repeat `import` or `library`
calls in individual plot chunks** — all imports are centralised in setup.

Note on `laurelin_plot`: this is internal book infrastructure — do not
list it in the Required packages callout.

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

All Python plotting uses `python/laurelin_plot.py` — the book's shared
helper module. It provides:

- `lc(name, dark=False)` — colour accessor, equivalent to R's `lc()`
- `apply_light(fig, ax)` — apply light-mode styling (white bg, dark
  text, subtle grid `#E5E5E5`)
- `apply_dark(fig, ax)` — apply dark-mode styling (`#222222` bg, white
  text, subdued grid `#444444`)
- `reset_style()` — reset rcParams to `seaborn-v0_8-whitegrid` defaults;
  call at the top of every render chunk to prevent dark-mode rcParams
  leaking into subsequent light renders

**Python plot pattern for render chunks:**

```python
reset_style()

# --- light rendering ---
fig, ax = plt.subplots(figsize=(8, 5))
ax.plot(..., color=lc("green"))
ax.set_xlabel("...", fontsize=12)
ax.set_ylabel("...", fontsize=12)
ax.legend(frameon=False)
apply_light(fig, ax)
plt.tight_layout(); plt.show(); plt.close()

reset_style()

# --- dark rendering ---
fig, ax = plt.subplots(figsize=(8, 5))
ax.plot(..., color=lc("green", dark=True))
ax.set_xlabel("...", fontsize=12)
ax.set_ylabel("...", fontsize=12)
ax.legend(frameon=False)
apply_dark(fig, ax)
plt.tight_layout(); plt.show(); plt.close()
```

**Style rules:**
- snake_case for variables and functions, PascalCase for classes
- Explicit axis labels on all plots — never default column names
- Avoid `*` imports — always explicit namespace
- Prefer `pathlib.Path` over `os.path` for file operations
- f-strings over `.format()` or `%` formatting
- Never call `plt.style.use()` directly in chunks — use `reset_style()`

**Code quality:**
- All imports are centralised in the setup chunk — never repeat
  `import numpy`, `import matplotlib`, etc. in individual chunks
- Use Quarto's `#| label:` and `#| fig-cap:` chunk options
  for figures and tables — identical syntax to R chunks

---

### Figure cross-references with renderings

Quarto does not support a cross-reference div (`{#fig-xxx}`) wrapping
an entire tabset — it produces a "No tabs found" warning and breaks
the tabset. The working pattern is:

**R tab:** wrap only the R render chunk in the `{#fig-xxx}` div. This
gives the figure its number, caption, and cross-reference anchor.

**Python tab:** add `#| fig-cap:` directly to the Python render chunk.
This shows the caption text without a figure number. The cross-ref
`@fig-xxx` resolves via the R div.

````markdown
::: {.panel-tabset group="language"}

## R

```{r}
#| label: FIGURENAME_base
#| output: false
#| code-fold: true
# base plot code
```

1. Annotation text...

::: {#fig-FIGURENAME}

```{r}
#| label: FIGURENAME_render
#| renderings: [light, dark]
#| echo: false
p + scale_laurelin()
p + scale_laurelin_dark()
```

Caption text here.
:::

## Python

```{python}
#| label: FIGURENAME_py_base
#| output: false
# base plot code
```

1. Annotation text...

```{python}
#| label: FIGURENAME_py_render
#| renderings: [light, dark]
#| echo: false
#| fig-cap: "Caption text here."
# render code
```

:::
````

**Chunk label rules:**
- Base chunks: plain `snake_case`, `#| output: false`, `#| code-fold: true`
- Render chunks: plain `snake_case` (no `fig-` prefix), `#| echo: false`
- The `{#fig-xxx}` div label uses the `fig-` prefix for cross-references
- Cross-references in prose: `@fig-FIGURENAME` resolves via the R div

**Why `#| code-fold: true` on the base chunk is required:** without it,
the global `code-fold: true` from `_quarto.yml` causes the base chunk's
fold to render outside the tabset in the HTML output. The explicit
per-chunk option keeps it correctly placed inside the tab.

---

### Code annotation

Code annotations (numbered lists after a closing fence) work correctly
in base chunks inside tabsets, **provided** the base chunk has
`#| code-fold: true` explicitly set. The annotation list must appear
immediately after the closing fence of the base chunk, before the
render chunk or any div.

Code annotations do **not** work inside `renderings` chunks — only in
base chunks (`#| output: false`). Never add annotation lists after a
render chunk.

---

### Light/dark renderings

Every figure must display correctly in both the `cosmo` (light) and `darkly`
(dark) Quarto themes. Use Quarto's `renderings: [light, dark]` chunk option
to produce two versions of each plot — one per theme.

**This applies to both R and Python chunks.** `renderings` is a Quarto
option, not a knitr option — it works identically for `{r}` and `{python}`.

#### Pattern: two-chunk split per figure

Split every figure into a **base chunk** (builds the plot object, hidden
output) and a **render chunk** (emits light then dark, hidden code):

```markdown
::: {#fig-FIGURENAME}

::: {.panel-tabset group="language"}

## R

```{r}
#| label: FIGURENAME_base
#| output: false

p <- ggplot(...) + geom_...() + labs(...)
```

```{r}
#| label: FIGURENAME_render
#| renderings: [light, dark]
#| echo: false

p + scale_laurelin()
p + scale_laurelin_dark()
```

## Python

```{python}
#| label: FIGURENAME_py_base
#| output: false

# full plot code with light palette
# ends with plt.close()
```

```{python}
#| label: FIGURENAME_py_render
#| renderings: [light, dark]
#| echo: false

# --- light rendering ---
# full plot code; fig.patch.set_facecolor("#ffffff"); plt.show(); plt.close()

# --- dark rendering ---
# full plot code with dark palette
# fig.patch.set_facecolor("#222222")
# ax.set_facecolor("#222222")
# ax.tick_params(colors="white")
# ax.xaxis.label.set_color("white"); ax.yaxis.label.set_color("white")
# for spine in ax.spines.values(): spine.set_edgecolor("#555555")
# ax.title.set_color("white")
# plt.rcParams.update({"text.color": "white"})
# plt.show(); plt.close()
```

:::

Caption text.
:::
```

#### Critical label rule

Chunk labels inside `renderings` blocks must **not** start with `fig-`,
`tbl-`, or any other cross-reference prefix — Quarto will fail to resolve
them. Use plain `snake_case`:

- ✓ `eoq_curve_render`
- ✗ `fig-eoq-curve-render`

The cross-reference label lives on the outer div only (`#fig-eoq-curve`).

#### Theme and palette helpers

| Function | Use |
|---|---|
| `scale_laurelin()` | Light theme + colour scale — first line of R render chunk |
| `scale_laurelin_dark()` | Dark theme + colour scale — second line of R render chunk |
| `lc("name")` | Named colour accessor for manual geom colours (R only) |

Light palette: `green=#2D6A4F`, `blue=#4C72B0`, `orange=#DD8452`, `red=#C0392B`
Dark palette: `green=#52B788`, `blue=#74A9D8`, `orange=#F4A261`, `red=#E76F51`

For Python, use the hex values directly — there is no `lc()` equivalent.

#### Background colours

- Light: `#ffffff` (set by `theme_laurelin()` / `fig.patch.set_facecolor`)
- Dark: `#222222` (darkly body background / `fig.patch.set_facecolor`)

#### EOQ legend caveat

`scale_laurelin()` resets the complete theme, which wipes any
`theme(legend.position = ...)` baked into the base plot object. Re-append
manual theme overrides in the render chunk:

```r
p + scale_laurelin()      + theme(legend.position = "bottom")
p + scale_laurelin_dark() + theme(legend.position = "bottom")
```

#### Python rcParams reset

`plt.rcParams.update({"text.color": "white"})` in a dark render block
persists into subsequent chunks. Each Python plot block must call
`plt.style.use("seaborn-v0_8-whitegrid")` at the top to reset rcParams
and prevent dark-mode text leaking into light renders.

#### `annotate("text")` defaults to black — never inherits theme

**Critical:** ggplot2's `annotate("text", ...)` and `annotate("label", ...)`
default to black (`#000000`) regardless of `theme_laurelin_dark()`. They
do **not** inherit the theme's text colour. On a `#222222` dark background,
black annotation text is invisible.

**Rule:** never use `annotate("text", ...)` without an explicit `color`
argument in any chunk that participates in `renderings: [light, dark]`.
Always pass `color = lc("ref_text", dark = dark)`.

Since the base chunk builds `p` once for both renders, annotation colours
cannot be baked into `p` directly. Use a helper function pattern:

```r
# In the base chunk — build p WITHOUT annotations
p_base <- ggplot(...) + geom_...() + labs(...)

# Helper defined in the base chunk
add_labels <- function(pl, dark = FALSE) {
  pl +
    annotate("text", x = x0, y = y0,
             label = "some label",
             color = lc("ref_text", dark = dark))
}
```

```r
# In the render chunk
add_labels(p_base, FALSE) + scale_laurelin()
add_labels(p_base, TRUE)  + scale_laurelin_dark()
```

The same pattern applies to `geom_vline`, `geom_hline`, `geom_segment`,
and any other geom with a hardcoded reference colour:

```r
add_refs <- function(pl, dark = FALSE) {
  pl +
    geom_vline(xintercept = x_ref, linetype = "dashed",
               color = lc("ref_line", dark = dark)) +
    annotate("text", x = x_ref + 80, y = y_ref,
             label = "label text",
             color = lc("ref_text", dark = dark))
}
```

**Name helper functions uniquely per figure** to avoid collisions when
multiple figures are defined in the same chapter session:
`add_refs_eoq`, `add_labels_convexity`, `add_labels_gd_step`, etc.

#### Reference colour palette entries

`laurelin_pal()` includes two reference colours in addition to the six
data colours:

| Name | Light | Dark | Use |
|---|---|---|---|
| `ref_line` | `#999999` | `#BBBBBB` | vlines, hlines, guide segments |
| `ref_text` | `#666666` | `#DDDDDD` | annotation text, inline labels |

Access via `lc("ref_line")` / `lc("ref_line", dark = TRUE)` in R.
In Python dark blocks use the hex values directly:
`#BBBBBB` for lines, `#DDDDDD` for text.

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

### The rule: descriptive everywhere, narrative nowhere in headings

All headings — chapter `title:` in YAML, `##` section headers,
`###` subsection headers — must be descriptive and navigable.
A reader scanning the TOC or skimming section headers should find
any concept immediately, without opening the chapter.

The narrative voice lives in the body text, not in any heading.

### Chapter titles (YAML `title:` field)

The `title:` appears in the sidebar, TOC, and browser tab.
It answers: "what will I learn in this chapter?"

✓ Correct:
- "Unconstrained Optimization"
- "The Lagrangian and Duality"
- "KKT Conditions"
- "Kernel Functions"
- "ε-SVR with MAPE"

✗ Avoid — these are narrative hooks, not titles:
- "A Forecast That Costs More Than It Saves"
- "When the Gradient Points Uphill"
- "The Box That Knows Its Own Constraints"
- "Kernels Without Coordinates"

### Section and subsection headers (`##`, `###`)

Same rule. Descriptive, direct, unambiguous.

✓ Correct:
- "First-order optimality conditions"
- "Convexity and global minima"
- "Gradient descent: geometric intuition"
- "The dual problem"
- "Sample-dependent box constraints"

✗ Avoid — these belong in prose, not headings:
- "The cost of a bad inventory decision"
- "Following the gradient downhill"
- "Not every zero gradient is a minimum"
- "Why convexity matters"

### Opening hook

Every chapter opens with 2–4 sentences of narrative prose
**before the first `##` section heading**. This is where the
concrete anchor lives — a real problem, a question, an observation.
It earns the reader's attention before the formalism starts.

The hook does not repeat the title. It does not say
"In this chapter we will cover...". It drops the reader into
a situation.

Example for "Unconstrained Optimization":
> Every warehouse manager knows the feeling. Order too little
> and you run out. Order too much and you pay to store inventory
> nobody needs. Somewhere between those two failures is the right
> number — and finding it does not require guessing.

Section openings follow the same principle: the first sentence
of a section's body is concrete and situational, not a restatement
of the header.

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
4. Note any renv dependencies the chapter introduces. Add them with
   `renv::record("packagename")` — never `renv::snapshot()` (see
   Data and environment conventions below).

---

## Data and environment conventions

### Loading data files

All dataset reads — in both R and Python chunks — must use
project-root-relative paths, never bare relative paths like
`"data/file.csv"`. Bare paths break in CI because Quarto renders
chapters from the `chapters/` subdirectory, not the project root.

**R:** always use `here::here()`:

```r
df <- readr::read_csv(here::here("data", "myfile.csv"))
```

`here` is already in `renv.lock`. Never use `read_csv("data/myfile.csv")`.

**Python:** `__file__` is not defined under reticulate (the knitr
engine used by this book). Use this helper instead:

```python
from pathlib import Path
import pandas as pd

def _project_root(markers=("_quarto.yml", "renv.lock")):
    for d in (Path.cwd(), *Path.cwd().parents):
        if any((d / m).exists() for m in markers):
            return d
    return Path.cwd()

df = pd.read_csv(_project_root() / "data" / "myfile.csv")  # <1>
```
1. Walks up from the current working directory until it finds
   `_quarto.yml` or `renv.lock` — the project root markers.

### renv: adding packages

Never run `renv::snapshot()` to add individual packages. The project
uses `snapshot.type: implicit`, which prunes the lockfile to only
packages referenced in current files — this silently removes packages
used by chapters not yet written.

Always add packages additively:

```r
renv::install("packagename")
renv::record("packagename")
```

`renv::record()` adds the package to `renv.lock` without touching
anything else.

### Python environment in CI

The CI workflow (`.github/workflows/publish.yml`) installs Python 3.11
via `actions/setup-python` and runs `pip install -r requirements.txt`
before rendering. Python dependencies must be listed in
`requirements.txt` at the project root. When adding a new Python
package used in any chunk, add it to `requirements.txt` — not just
as a pip install in the workflow directly.

`reticulate` is pinned to the system Python in CI via `.Rprofile`:

```r
if (Sys.getenv("GITHUB_ACTIONS") == "true") {
  Sys.setenv(RETICULATE_PYTHON = Sys.which("python3"))
}
```

Do not remove or modify this guard.

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
