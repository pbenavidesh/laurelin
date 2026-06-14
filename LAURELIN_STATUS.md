# LAURELIN Status

**Title:** Laurelin — From Optimization to Percentage-Error SVR
**Author:** Pablo Benavides-Herrera (ITESO, Guadalajara, Mexico)
**Live:** https://pbenavidesh.github.io/laurelin/
**Repo:** https://github.com/pbenavidesh/laurelin
**Last updated:** June 2026

---

## Book infrastructure

| Item | State |
|---|---|
| Scaffold (5 parts, 24 chapters) | ✅ Complete |
| Render (26/26 documents) | ✅ Clean |
| GitHub Pages | ✅ Live, auto-deploys on push to main |
| renv (R 4.5.2) | ✅ Initialized, core dependencies locked |
| Skill (`_skills/laurelin-writer/SKILL.md`) | ✅ Installed, updated June 2026 |
| Preface (`index.qmd`) | ✅ Complete — author voice, first person |
| `_quarto.yml` | ✅ Complete — includes margin refs, code-annotations: select |
| Running datasets | ✅ `data/vic_elec.csv`, `data/california_housing.csv` |
| `R/laurelin_theme.R` | ✅ Installed — light/dark themes, palette, lc() accessor |

---

## Status legend

| Symbol | Meaning |
|---|---|
| 🔲 | Stub only — placeholder structure, no content |
| 🟡 | Structure agreed — sections defined, not written |
| 🟠 | In progress — partially written |
| ✅ | Approved — written, reviewed, published |

---

## Key decisions locked

- **Title convention:** YAML `title:` is descriptive and navigable.
  Narrative hook goes in 2–4 sentences of body prose before the first
  `##` heading. Section headers are also descriptive — never narrative.
- **Running datasets:** vic_elec (time series) + California Housing
  subsample (cross-sectional). Enter in Ch. 12, continue through Ch. 24.
  Part I and II use domain-grounded one-off examples per chapter.
- **Code:** Executable R + Python in `{.panel-tabset group="language"}`
  blocks. Every chunk self-contained and reproducible.
- **Callout taxonomy:** five types with fixed roles — see SKILL.
- **Workflow:** structure agreed per chapter → sección por sección con
  visto bueno → CC commits.
- **Appendices:** notation table (A) + math identities (B) only.
  No derivations in appendices.
- **renv:** always `renv::record("pkg")`, never `renv::snapshot()`.
- **Paths:** always `here::here()` in R, `_project_root()` helper in Python.
- **Heading hierarchy:** `#` H1 is reserved for the chapter title
  (generated from YAML `title:`). Body content uses `##` and `###` only.
  `toc-depth: 3` in `_quarto.yml` ensures `###` subsections appear in
  the sidebar TOC — use this for navigation in long chapters instead of
  additional `#` headings.
- **Ch. 23 structure:** all SMO-MAPE content (structural invariance
  theorem + all four efficiency extensions + symmetric kernel variant)
  stays in one chapter. Each extension gets its own `###` subsection
  with theorem, collapsible proof, and code. Sidebar TOC provides
  navigation — no need to split into separate chapters.
- **Light/dark renderings:** every figure uses `renderings: [light, dark]`
  pattern — base chunk (output: false) + render chunk (echo: false).
  R uses `scale_laurelin()` / `scale_laurelin_dark()`. Python runs full
  plot code twice with light/dark palette hex values.
  `annotate("text")` defaults to black — always pass
  `color = lc("ref_text", dark = dark)` explicitly. See SKILL for full
  pattern including helper function naming convention.
- **code-annotations:** `select` globally in `_quarto.yml`.
  Labels inside `renderings` chunks must not start with `fig-`/`tbl-`.

---

## Part I — The Language of Optimization

### Ch. 1 — `01-motivation.qmd` — ✅ Approved

**Title:** From Spreadsheet to Function
**Anchor:** Cloud server demand forecasting — infrastructure costs spike
unpredictably; predicting demand allows proactive scaling.
**Scope:** Motivation only — no formal mathematics. What is prediction?
Why do we need equations? What tools exist and why are they not enough?
**Introduces running examples:** YES — both vic_elec and California
Housing loaded and visualized for the first time.
**Code:** Load both datasets from CSV, first exploratory plots (R + Python).
**Concepts installed for later chapters:** What a prediction problem is;
the two running datasets; why we need something better than eyeballing.
**Notes:** Title renamed from "A Problem Worth Solving". Python tabs
fixed: vic_elec from CSV, California units documented.
Pending: verify render after data source change.

---

### Ch. 2 — `02-unconstrained.qmd` — ✅ Approved

**Title:** Unconstrained Optimization
**Anchor:** EOQ (Economic Order Quantity) — total inventory cost has a
natural U-shape; the minimum is found by setting the first derivative
to zero.
**Scope IN:**
- Gradients as direction of steepest ascent; geometric interpretation
- First-order optimality condition: ∇f = 0
- Critical points: minima, maxima, saddle points
- Hessian as curvature detector; second-order conditions
- Convexity: definition, geometric meaning, why it guarantees a unique
  global minimum; first-order condition sufficient under convexity
- Gradient descent as geometric intuition — one illustrated step on EOQ;
  NOT the full algorithm (that is Ch. 6)
**Scope OUT:**
- Constraints of any kind → Ch. 3
- Lagrangians → Ch. 4
- Full GD algorithm, learning rate schedules, SGD, Adam → Ch. 6
**Sections:**
```
[Opening hook — EOQ, no heading]
## Derivatives and the direction of change
## First-order optimality conditions
## Critical points and second-order conditions
## Convexity and global minima
## Gradient descent: geometric intuition
## Exercises
```
**Code:** Plot EOQ cost curve, visualize gradient at a point, one step
of GD on EOQ surface (R + Python). All figures use light/dark renderings.
**Concepts installed:** ∇f = 0, Hessian, convexity → unique minimum.
Seed planted: "convexity is what makes optimization in Part III tractable."
**Introduces running examples:** NO
**Commits:** stub `1f532e5` → full chapter with light/dark renderings `919d975`

---

### Ch. 3 — `03-constrained.qmd` — 🔲 Stub

**Title:** Constrained Optimization
**Anchor (primary):** Portfolio optimization — maximize return subject
to a fixed budget.
**Anchor (secondary):** Production planning — maximize units with
limited machine-hours and materials.
**Scope IN:**
- Feasible region: equality and inequality constraints
- Geometric interpretation of constrained optimum
- Active vs. inactive constraints
- Why unconstrained techniques fail here
**Scope OUT:**
- Lagrangian construction → Ch. 4
- KKT conditions → Ch. 5
**Sections:**
```
[Opening hook]
## Feasible regions and constraints
## Equality constraints
## Inequality constraints
## Active and inactive constraints
## Geometric interpretation of the constrained optimum
## Exercises
```
**Code:** Visualize feasible regions, plot constrained vs unconstrained
optima (R + Python).
**Concepts installed:** Feasible region, active/inactive constraints,
constrained optimum.
**Introduces running examples:** NO
**Depends on:** Ch. 2 (unconstrained optimum as baseline)

---

### Ch. 4 — `04-lagrangian-duality.qmd` — 🔲 Stub

**Title:** The Lagrangian and Duality
**Anchor:** Digital marketing campaign — distribute budget across
channels (Google Ads, Meta, email) maximizing conversions. Each channel
has diminishing returns. Lagrange multiplier = value of one extra peso
of budget (shadow price).
**Scope IN:**
- Lagrangian construction for equality constraints
- Extension to inequality constraints
- Weak and strong duality
- Shadow prices and economic interpretation of multipliers
- Law of diminishing returns as motivation
**Scope OUT:**
- KKT conditions formal statement → Ch. 5
- Numerical solution methods → Ch. 6
**Sections:**
```
[Opening hook]
## The Lagrangian function
## Weak duality
## Strong duality and the duality gap
## Shadow prices and economic interpretation
## Extension to inequality constraints
## Exercises
```
**Code:** Visualize diminishing returns curves, Lagrangian surface,
primal vs dual objective (R + Python).
**Concepts installed:** Lagrangian, Lagrange multipliers, weak/strong
duality, shadow price.
**Introduces running examples:** NO
**Depends on:** Ch. 3 (constrained optimization setup)

---

### Ch. 5 — `05-kkt.qmd` — 🔲 Stub

**Title:** KKT Conditions
**Anchor:** Same marketing campaign as Ch. 4, extended with minimum
spend constraints per channel. KKT conditions determine which
constraints are active at optimum.
**Scope IN:**
- Stationarity condition
- Primal feasibility
- Dual feasibility
- Complementary slackness
- When KKT conditions are sufficient (constraint qualifications,
  convexity)
**Scope OUT:**
- Numerical methods to solve KKT systems → Ch. 6
- Application to SVR dual → Ch. 12
**Sections:**
```
[Opening hook]
## The four KKT conditions
## Stationarity
## Primal and dual feasibility
## Complementary slackness
## Sufficiency: when KKT conditions guarantee a global optimum
## Exercises
```
**Code:** Illustrate complementary slackness geometrically; verify KKT
conditions numerically on the marketing example (R + Python).
**Concepts installed:** KKT conditions, complementary slackness,
sufficiency under convexity. These are used verbatim in every SVR
derivation from Ch. 12 onward.
**Introduces running examples:** NO
**Depends on:** Ch. 4 (Lagrangian setup)

---

### Ch. 6 — `06-numerical-methods.qmd` — 🔲 Stub

**Title:** Numerical Methods for Optimization
**Anchor:** Churn prediction model calibration — parameters must be tuned
to minimize prediction error. Gradient descent walks the error surface.
Motivates why smarter methods (Newton, decomposition) matter at scale.
**Scope IN:**
- Gradient descent: full algorithm, learning rate schedules, convergence
- Stochastic and mini-batch GD
- Newton's method and quasi-Newton (BFGS)
- Interior-point methods (brief)
- Decomposition methods (motivation for SMO in Part V)
- Computational complexity comparison
**Scope OUT:**
- SMO implementation → Ch. 22–23
**Sections:**
```
[Opening hook]
## Gradient descent
## Stochastic gradient descent
## Newton's method
## Quasi-Newton methods: BFGS
## Interior-point methods
## Decomposition: the SMO preview
## Exercises
```
**Code:** Animate gradient descent with different learning rates on a
simple loss surface (R + Python).
**Concepts installed:** Full GD algorithm, convergence, Newton/BFGS,
decomposition principle.
**Introduces running examples:** NO
**Depends on:** Ch. 2 (GD geometric intuition), Ch. 5 (KKT)

---

## Part II — The Kernel Trick

### Ch. 7 — `07-representation.qmd` — 🔲 Stub

**Title:** Feature Representations
**Anchor:** Fraud detection — transaction amount and frequency do not
linearly separate fraud from legitimate transactions. Need richer
representation.
**Scope IN:**
- Why linear models fail for complex patterns
- Feature maps: lifting to higher dimensions
- The curse of dimensionality as motivation for the kernel trick
**Scope OUT:**
- The kernel trick itself → Ch. 8
**Sections:**
```
[Opening hook]
## When linear models fail
## Feature maps
## The curse of dimensionality
## Exercises
```
**Code:** Visualize non-linear decision boundary problem with synthetic
fraud data (R + Python).
**Concepts installed:** Feature map φ, hypothesis space, non-linearity.
**Introduces running examples:** NO
**Depends on:** Ch. 5 (optimization setup)

---

### Ch. 8 — `08-kernel-trick.qmd` — 🔲 Stub

**Title:** The Kernel Trick
**Anchor:** Same fraud detection problem resolved with kernel.
**Scope IN:**
- The kernel trick: computing inner products without explicit mapping
- Mercer's theorem (informal)
- Why explicit mapping is intractable but kernel is not
**Scope OUT:**
- Specific kernels → Ch. 9
**Sections:**
```
[Opening hook]
## Inner products in feature space
## The kernel trick
## Mercer's theorem
## Exercises
```
**Code:** Compare explicit feature map vs kernel computation cost
(R + Python).
**Concepts installed:** Kernel function K(x,x'), Mercer condition.
**Introduces running examples:** NO
**Depends on:** Ch. 7 (feature maps)

---

### Ch. 9 — `09-common-kernels.qmd` — 🔲 Stub

**Title:** Common Kernel Functions
**Anchor:** Customer segmentation by purchase behavior — find similar
customers. RBF captures local similarity, polynomial captures feature
interactions.
**Scope IN:**
- RBF, polynomial, linear kernels
- Intuition, properties, hyperparameters
- When each applies
**Sections:**
```
[Opening hook]
## The RBF kernel
## The polynomial kernel
## The linear kernel
## Choosing a kernel
## Exercises
```
**Code:** Visualize kernel matrices for same dataset under different
kernels (R + Python).
**Concepts installed:** RBF, polynomial, linear kernels; σ as bandwidth.
**Introduces running examples:** NO
**Depends on:** Ch. 8 (kernel trick)

---

### Ch. 10 — `10-representer-theorem.qmd` — 🔲 Stub

**Title:** The Representer Theorem
**Anchor:** Any kernel model from Ch. 9 — show that despite
infinite-dimensional feature space, solution depends on N points.
**Scope IN:**
- Representer Theorem: solution lives in span of training data
- Implications for computational tractability
- Sparsity of kernel model solution
**Sections:**
```
[Opening hook]
## The representer theorem
## Sparsity and support vectors
## Implications for tractability
## Exercises
```
**Code:** Demonstrate sparsity of kernel model solution (R + Python).
**Concepts installed:** Representer theorem, support vectors (preview).
**Introduces running examples:** NO
**Depends on:** Ch. 8–9 (kernel methods)

---

## Part III — Support Vector Machines

### Ch. 11 — `11-svm-classification.qmd` — 🔲 Stub

**Title:** Support Vector Classification
**Scope:** SVM classification — hard and soft margin, geometric
motivation, dual formulation.
**Anchor:** Binary classification (fraud detection revisited).
**Introduces running examples:** NO
**Depends on:** Ch. 5 (KKT), Ch. 8–10 (kernel methods)

---

### Ch. 12 — `12-svr.qmd` — 🔲 Stub

**Title:** Support Vector Regression
**Scope:** SVR — ε-insensitive loss, primal, dual, support vectors in
regression context.
**Introduces running examples:** YES (vic_elec + California Housing
enter here and stay for the rest of the book)
**Depends on:** Ch. 11 (SVM classification as predecessor)

---

### Ch. 13 — `13-ls-svr.qmd` — 🔲 Stub

**Title:** Least Squares SVR
**Scope:** LS-SVR — quadratic loss, linear system, structural differences
from ε-SVR.
**Introduces running examples:** Continues from Ch. 12
**Depends on:** Ch. 12 (ε-SVR)

---

### Ch. 14 — `14-gaussian-processes.qmd` — 🔲 Stub

**Title:** Gaussian Processes
**Scope:** GP — Bayesian perspective, kernels as covariance functions,
posterior predictive distribution, uncertainty quantification.
**Introduces running examples:** Synthetic dataset (small, for UQ bands)
**Depends on:** Ch. 9 (kernels), Ch. 12 (SVR as contrast)

---

### Ch. 15 — `15-svr-in-perspective.qmd` — 🔲 Stub

**Title:** SVR in Perspective
**Scope:** Honest comparison — SVR vs RF, XGBoost, Elastic Net, GP, NNs.
Conceptual + empirical (vic_elec + California Housing).
**Introduces running examples:** Continues
**Depends on:** Ch. 12–14

---

## Part IV — Percentage-Error SVR

### Ch. 16 — `16-percentage-error.qmd` — 🔲 Stub

**Title:** Percentage Error Metrics
**Scope:** MAPE, RMSPE, sMAPE — definitions, properties, when to use.
Statistical foundation: multiplicative noise model (Wedderburn).
**Introduces running examples:** Continues
**Depends on:** Ch. 12 (SVR baseline)

---

### Ch. 17 — `17-eps-svr-mape.qmd` — 🔲 Stub

**Title:** ε-SVR with MAPE
**Scope:** m1 — primal, KKT, dual with sample-dependent box constraints.
**Introduces running examples:** Continues
**Depends on:** Ch. 12 (ε-SVR), Ch. 16 (MAPE)

---

### Ch. 18 — `18-ls-svr-rmspe.qmd` — 🔲 Stub

**Title:** LS-SVR with RMSPE
**Scope:** m3 — primal, KKT, linear system with Y_Γ diagonal.
**Introduces running examples:** Continues
**Depends on:** Ch. 13 (LS-SVR), Ch. 16 (RMSPE)

---

### Ch. 19 — `19-symmetric-variants.qmd` — 🔲 Stub

**Title:** Symmetric Kernel Extensions
**Anchor:** vic_elec — seasonal electricity demand has genuine
physical symmetry; symmetric kernel exploits it.
**Scope IN:**
- Symmetry constraint: ωᵀφ(xₖ) = a ωᵀφ(−xₖ), a ∈ {−1, +1}
- Modified kernel: Ωˢ = ½(Ω + aΩ*), Kˢ(xᵢ,xⱼ) = K(xᵢ,xⱼ) + aK(xᵢ,−xⱼ)
- m2: symmetric ε-SVR with MAPE
- m4: symmetric LS-SVR with RMSPE
**Introduces running examples:** Continues
**Depends on:** Ch. 17–18 (m1, m3 as baselines)

---

### Ch. 20 — `20-unified-framework.qmd` — 🔲 Stub

**Title:** A Unified Framework
**Scope:** Two binary axes (paradigm × symmetry), structural
orthogonality theorem, unified table, practical implications.
**Introduces running examples:** Continues
**Depends on:** Ch. 17–19 (all four models)

---

## Part V — Optimization at Scale

### Ch. 21 — `21-scale-problem.qmd` — 🔲 Stub

**Title:** The Scale Problem
**Scope:** Why QP solvers fail at SVR scale; decomposition principle;
LS-SVR excluded from large-scale experiments.
**Introduces running examples:** California Housing full (N=20,433)
**Depends on:** Ch. 12 (SVR dual QP), Ch. 6 (numerical methods)

---

### Ch. 22 — `22-smo-classical.qmd` — 🔲 Stub

**Title:** Sequential Minimal Optimization
**Scope:** SMO — WSS3, 2-variable subproblem, bias update, shrinking,
convergence. Comparison with generic solvers.
**Introduces running examples:** California Housing full (continues)
**Depends on:** Ch. 12 (ε-SVR dual), Ch. 21 (scale motivation)

---

### Ch. 23 — `23-smo-mape.qmd` — 🔲 Stub

**Title:** SMO with Sample-Dependent Constraints
**Scope:** Structural invariance theorem; all four efficiency extensions
(asymmetric freeze, predictive WSS3, block-k=4, combined speedup);
symmetric kernel extension. Author's main algorithmic contribution.
**Introduces running examples:** California Housing full (continues)
**Depends on:** Ch. 17 (m1), Ch. 22 (SMO classical)

---

### Ch. 24 — `24-empirical-comparison.qmd` — 🔲 Stub

**Title:** Solvers in Practice
**Scope:** SMO (psvr) vs LIBSVM vs OSQP vs MOSEK vs Clarabel.
Convergence curves, wall time, accuracy. Closes book arc back to Ch. 1.
**Introduces running examples:** California Housing full (continues)
**Depends on:** Ch. 22–23 (SMO variants)

---

## Pending decisions

| # | Question | Affects |
|---|---|---|
| 1 | Ch. 14 (GP): use synthetic only or a small subsample of vic_elec? | Ch. 14 code |
| 2 | Ch. 11 (SVM classification): use fraud detection synthetic or real dataset? | Ch. 11 code |
| 3 | Ch. 6 subsections: how much depth on Adam/BFGS for this audience? | Ch. 6 scope |

---

## Active work

- [ ] Ch. 3 — Constrained Optimization: agree structure, then write
