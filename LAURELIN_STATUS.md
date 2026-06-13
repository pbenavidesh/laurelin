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
| `_quarto.yml` | ⚠️ Needs `reference-location: margin` and `citation-location: margin` added |
| Running datasets | ✅ `data/vic_elec.csv`, `data/california_housing.csv` |

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

### Ch. 2 — `02-unconstrained.qmd` — 🟡 Structure agreed

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
of GD on EOQ surface (R + Python).
**Concepts installed:** ∇f = 0, Hessian, convexity → unique minimum.
Seed planted: "convexity is what makes SVR tractable."
**Introduces running examples:** NO
**Depends on:** Ch. 1 (motivation for why we minimize things)

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
**Depends on:** Ch. 4 (Lagrangian and multipliers)

---

### Ch. 6 — `06-numerical-methods.qmd` — 🔲 Stub

**Title:** A Map of Numerical Methods
**Anchor:** Churn prediction model calibration — parameters must be
tuned to minimize prediction error. Gradient descent walks the error
surface; smarter methods matter at scale.
**Scope IN:**
- First-order methods: GD (full algorithm), SGD, Adam — with learning
  rate, convergence, trade-offs
- Second-order methods: Newton, BFGS — curvature information,
  cost per iteration
- Interior-point methods: overview, when they apply
- Decomposition methods: overview only — motivation for SMO in Ch. 22
- Computational complexity comparison
**Scope OUT:**
- Derivation of any specific SVR solver → Part V
- Hyperparameter tuning strategies → Ch. 15
**Sections:**
```
[Opening hook]
## First-order methods
### Gradient descent
### Stochastic gradient descent
### Adaptive methods (Adam)
## Second-order methods
### Newton's method
### Quasi-Newton methods (BFGS)
## Interior-point methods
## Decomposition methods
## Choosing a method: complexity and trade-offs
## Exercises
```
**Code:** Animate GD with different learning rates on a simple loss
surface; compare convergence curves (R + Python).
**Concepts installed:** Full GD algorithm, SGD, Newton, decomposition
idea. Motivates why SMO (Ch. 22) is needed.
**Introduces running examples:** NO
**Depends on:** Ch. 2 (gradient intuition), Ch. 5 (KKT — interior
point methods require understanding of duality)

---

## Part II — The Kernel Trick

### Ch. 7 — `07-representation.qmd` — 🔲 Stub

**Title:** Feature Maps and High-Dimensional Representations
**Anchor:** Fraud detection — transaction amount and frequency do not
linearly separate fraud from legitimate transactions. Need richer
representation.
**Scope IN:**
- Why linear models fail for complex patterns
- Explicit feature maps: mapping to higher dimensions
- The curse of dimensionality as motivation for a smarter approach
**Scope OUT:**
- The kernel trick (computing inner products implicitly) → Ch. 8
**Sections:**
```
[Opening hook]
## Linear models and their limits
## Explicit feature maps
## The curse of dimensionality
## Exercises
```
**Code:** Visualize non-linear decision boundary with synthetic fraud
data; show explicit feature map in 2D → 3D (R + Python).
**Concepts installed:** Feature map φ(·), high-dimensional
representation, why explicit maps are intractable.
**Introduces running examples:** NO
**Depends on:** Ch. 2–5 (optimization toolkit)

---

### Ch. 8 — `08-kernel-trick.qmd` — 🔲 Stub

**Title:** The Kernel Trick
**Anchor:** Same fraud detection — explicit mapping is computationally
intractable; kernel computes the inner product without materializing
the map.
**Scope IN:**
- Inner products in feature space
- The kernel trick: K(xᵢ, xⱼ) = φ(xᵢ)ᵀφ(xⱼ)
- Mercer's theorem (informal — existence of a valid feature map)
- Positive definiteness as the key condition
**Scope OUT:**
- Specific kernel functions → Ch. 9
- Representer theorem → Ch. 10
**Sections:**
```
[Opening hook]
## Inner products in feature space
## The kernel function
## Mercer's theorem
## Positive definiteness
## Exercises
```
**Code:** Compare explicit feature map vs kernel computation cost;
verify PD condition numerically (R + Python).
**Concepts installed:** K(xᵢ, xⱼ), Mercer's theorem, PD condition.
**Introduces running examples:** NO
**Depends on:** Ch. 7 (feature maps)

---

### Ch. 9 — `09-common-kernels.qmd` — 🔲 Stub

**Title:** Common Kernel Functions
**Anchor:** Customer segmentation by purchase behavior — find similar
customers. RBF captures local similarity, polynomial captures feature
interactions, linear is the baseline.
**Scope IN:**
- RBF kernel: σ hyperparameter, locality, universality
- Polynomial kernel: degree, interactions
- Linear kernel: why it is a special case
- Kernel matrices: construction and visualization
- When each kernel applies
**Scope OUT:**
- Representer theorem → Ch. 10
- Kernel selection in practice (for SVR) → Ch. 12–13
**Sections:**
```
[Opening hook]
## The RBF kernel
## The polynomial kernel
## The linear kernel
## Kernel matrices
## Choosing a kernel
## Exercises
```
**Code:** Visualize kernel matrices for the same dataset under
different kernels (R + Python).
**Concepts installed:** RBF, polynomial, linear kernels; kernel matrix
Ω; σ hyperparameter.
**Introduces running examples:** NO
**Depends on:** Ch. 8 (kernel trick)

---

### Ch. 10 — `10-representer-theorem.qmd` — 🔲 Stub

**Title:** The Representer Theorem
**Anchor:** Any kernel model from Ch. 9 — despite infinite-dimensional
feature space, the solution depends only on N training points.
**Scope IN:**
- RKHS: definition, reproducing property (informal)
- Representer theorem: statement and geometric intuition
- Implication: solution f*(x) = Σ αₖ K(xₖ, x)
- Computational tractability: N parameters instead of ∞
**Scope OUT:**
- Formal RKHS theory (Hilbert space axioms) — intuition only
- Application to SVR dual → Ch. 12
**Sections:**
```
[Opening hook]
## Reproducing kernel Hilbert spaces
## The representer theorem
## From infinite dimensions to N parameters
## Exercises
```
**Code:** Demonstrate that kernel model solution is a linear
combination of N kernel evaluations (R + Python).
**Concepts installed:** RKHS, representer theorem, f*(x) = Σ αₖ K(xₖ, x).
Used verbatim in every SVR derivation from Ch. 12 onward.
**Introduces running examples:** NO
**Depends on:** Ch. 8–9 (kernel trick, kernel functions)

---

## Part III — Support Vector Machines

### Ch. 11 — `11-svm-classification.qmd` — 🔲 Stub

**Title:** Support Vector Machines for Classification
**Anchor:** Binary classification — fraud detection revisited
(Ch. 7/8) or spam detection as secondary.
**Scope IN:**
- Maximum margin classifier: geometric motivation
- Hard margin SVM: primal and dual
- Soft margin SVM: slack variables, C hyperparameter
- Support vectors: which training points matter
- Dual formulation via KKT (connects to Ch. 5)
**Scope OUT:**
- Regression → Ch. 12
- Percentage-error loss → Part IV
**Sections:**
```
[Opening hook]
## Maximum margin classification
## Hard margin SVM
## Soft margin SVM and slack variables
## The dual problem
## Support vectors
## Exercises
```
**Code:** Fit SVM classifier, visualize margin and support vectors
(R + Python).
**Concepts installed:** Margin, support vectors, slack variables, C,
SVM dual. Foundation for SVR in Ch. 12.
**Introduces running examples:** NO
**Depends on:** Ch. 5 (KKT), Ch. 8–10 (kernel machinery)

---

### Ch. 12 — `12-svr.qmd` — 🔲 Stub

**Title:** Support Vector Regression
**Anchor:** vic_elec demand forecasting + California Housing price
prediction — the two running examples enter here and stay.
**Scope IN:**
- ε-insensitive loss: tube around the prediction
- Primal formulation: ω, b, slack variables ξₖ, ξₖ*
- Lagrangian and KKT conditions
- Dual problem: convex QP, box constraints αₖ, αₖ* ∈ [0, C]
- Kernel trick application: f(x) = Σ βₖ K(xₖ, x) + b
- Support vectors in regression context
- Hyperparameters: C, ε, σ (RBF)
**Scope OUT:**
- LS-SVR → Ch. 13
- Percentage-error loss → Part IV
- SMO solver → Part V
**Sections:**
```
[Opening hook]
## The ε-insensitive loss
## Primal formulation
## Lagrangian and KKT conditions
## The dual problem
## Support vectors in regression
## Hyperparameters and their role
## Fitting SVR: vic_elec and California Housing
## Exercises
```
**Code:** Fit classical ε-SVR on both running datasets, visualize
ε-tube and support vectors, tune C/ε/σ (R + Python).
**Concepts installed:** ε-SVR primal/dual, βₖ = αₖ − αₖ*, box
constraints, kernel SVR prediction formula. Used in all of Part IV.
**Introduces running examples:** YES — vic_elec + California Housing
enter here and continue through Ch. 24.
**Depends on:** Ch. 5 (KKT), Ch. 10 (representer theorem),
Ch. 11 (SVM intuition)

---

### Ch. 13 — `13-ls-svr.qmd` — 🔲 Stub

**Title:** Least-Squares SVR
**Anchor:** Continues vic_elec + California Housing.
**Scope IN:**
- Quadratic loss instead of ε-insensitive: no tube, equality
  constraints
- Primal formulation: no αₖ*, single multiplier αₖ (unrestricted)
- KKT → linear system: bordered (N+1)×(N+1) matrix
- Classical LS-SVR system: (Ω + Γ⁻¹I)α = y
- Trade-offs vs ε-SVR: no sparsity, faster solve, no ε to tune
- Hyperparameters: Γ (regularization), σ (RBF)
**Scope OUT:**
- RMSPE modification → Ch. 18
- Symmetric variants → Ch. 19
**Sections:**
```
[Opening hook]
## Quadratic loss and equality constraints
## Primal formulation
## KKT conditions and the linear system
## Structural differences from ε-SVR
## Hyperparameters
## Fitting LS-SVR: vic_elec and California Housing
## Exercises
```
**Code:** Fit LS-SVR on both datasets, compare with ε-SVR from Ch. 12,
compare solve time (R + Python).
**Concepts installed:** LS-SVR linear system, Γ regularization,
no-sparsity trade-off. Foundation for Ch. 18.
**Introduces running examples:** Continues from Ch. 12.
**Depends on:** Ch. 12 (ε-SVR as baseline)

---

### Ch. 14 — `14-gaussian-processes.qmd` — 🔲 Stub

**Title:** Gaussian Processes
**Anchor:** Synthetic dataset — visualize uncertainty bands around
predictions (vic_elec or California Housing too large for GP at scale).
**Scope IN:**
- Bayesian perspective on regression
- Kernels as covariance functions
- Posterior predictive distribution
- Uncertainty quantification: confidence bands
- Connection to kernel methods (GP as a kernel method)
**Scope OUT:**
- Sparse GP approximations
- GP hyperparameter optimization details
**Sections:**
```
[Opening hook]
## A Bayesian view of regression
## Kernels as covariance functions
## The posterior predictive distribution
## Uncertainty quantification
## Connection to SVR
## Exercises
```
**Code:** Fit GP on a small synthetic dataset, visualize posterior
mean and uncertainty bands (R + Python).
**Concepts installed:** GP, posterior predictive, uncertainty bands.
Provides contrast for Ch. 15 comparison.
**Introduces running examples:** NO (synthetic only — scale constraint)
**Depends on:** Ch. 9–10 (kernels, RKHS)

---

### Ch. 15 — `15-svr-in-perspective.qmd` — 🔲 Stub

**Title:** SVR in Perspective
**Anchor:** vic_elec + California Housing — honest empirical comparison.
**Scope IN:**
- Conceptual comparison: SVR vs RF, XGBoost, Elastic Net, GP, NNs
  — guarantees, assumptions, failure modes
- Empirical comparison on both running datasets
- When to choose SVR: small N, kernel matters, sparsity desired
- When not to choose SVR: large N, tree methods dominate, no
  percentage-error concern yet (that is Part IV)
- Hyperparameter tuning strategies overview
**Scope OUT:**
- Percentage-error variants → Part IV
- Scale problem and SMO → Part V
**Sections:**
```
[Opening hook]
## A taxonomy of regression methods
## SVR vs Random Forests and XGBoost
## SVR vs Elastic Net
## SVR vs Gaussian Processes
## SVR vs Neural Networks
## Empirical comparison: vic_elec and California Housing
## When to use SVR
## Exercises
```
**Code:** Fit all methods on both datasets, produce comparison table
and boxplots (R + Python).
**Concepts installed:** Honest assessment of SVR trade-offs. Closes
Part III; motivates Part IV (percentage error) and Part V (scale).
**Introduces running examples:** Continues from Ch. 12.
**Depends on:** Ch. 12–14

---

## Part IV — Percentage-Error SVR

All chapters use vic_elec + California Housing exclusively.

---

### Ch. 16 — `16-percentage-error.qmd` — 🔲 Stub

**Title:** Percentage-Error Loss Functions
**Anchor:** Energy forecasting billing — a 5% error on a 1000 MW day
costs the same as a 5% error on a 100 MW day, but MSE treats them
very differently.
**Scope IN:**
- Why relative error matters in practice (forecasting, business,
  heterogeneous targets)
- MAPE: definition, properties, breakdown at y≈0, under-forecasting
  bias
- RMSPE: definition, smoothness, quadratic compatibility
- MAAPE, sMAPE: brief mention as variants
- Statistical foundations: multiplicative-noise model, Gamma variance
  function, MAPE as L₁ quasi-likelihood, RMSPE as L₂ quasi-likelihood
- Bayes-risk characterization of MAPE
**Scope OUT:**
- How to optimize MAPE/RMSPE in SVR → Ch. 17–18
**Sections:**
```
[Opening hook]
## Absolute vs relative error
## MAPE: definition and properties
## RMSPE: definition and properties
## Statistical foundations of percentage error
## Limitations and when not to use MAPE
## Exercises
```
**Code:** Compute MAPE, RMSPE, MAAPE on vic_elec and California Housing
predictions from Ch. 15; show scale-dependence of MSE vs MAPE
(R + Python).
**Concepts installed:** MAPE, RMSPE, multiplicative noise model,
quasi-likelihood framing. Foundation for Ch. 17–20.
**Introduces running examples:** Continues.
**Depends on:** Ch. 15 (baseline predictions to evaluate)

---

### Ch. 17 — `17-eps-svr-mape.qmd` — 🔲 Stub

**Title:** ε-SVR with MAPE
**Anchor:** vic_elec + California Housing — refit with MAPE-optimized
model, compare with Ch. 12 ε-SVR.
**Scope IN:**
- How MAPE loss modifies the primal constraints
- Lagrangian and KKT with percentage-error scaling
- Dual: sample-dependent box constraints αₖ, αₖ* ∈ [0, 100C/yₖ]
- Combined variable βₖ := (αₖ − αₖ*) → |βₖ| ≤ 100C/yₖ
- Capacity reallocation interpretation (DeMyttenaere 2016)
- Convexity preservation
- Elastic-net extension via GLMM (§2.6 of thesis) — brief treatment
**Scope OUT:**
- LS formulation → Ch. 18
- Symmetric variants → Ch. 19
- SMO implementation → Ch. 23
**Sections:**
```
[Opening hook]
## From absolute to relative constraints
## Primal formulation
## Lagrangian and KKT conditions
## The dual problem
## Sample-dependent box constraints
## Structural properties
## Fitting on vic_elec and California Housing
## Exercises
```
**Code:** Fit m1 (ε-SVR + MAPE) using psvr package on both datasets,
compare MAPE vs classical ε-SVR from Ch. 12 (R + Python).
**Concepts installed:** Sample-dependent box constraints, capacity
reallocation. Core result of the thesis.
**Introduces running examples:** Continues.
**Depends on:** Ch. 12 (classical ε-SVR), Ch. 16 (MAPE definition)

---

### Ch. 18 — `18-ls-svr-rmspe.qmd` — 🔲 Stub

**Title:** LS-SVR with RMSPE
**Anchor:** vic_elec + California Housing — compare m3 vs m1.
**Scope IN:**
- How RMSPE loss modifies the LS-SVR regularization
- Stationarity in eₖ → eₖ = (yₖ²/Γ)αₖ → origin of Y_Γ
- Linear system with target-weighted diagonal:
  Y_Γ = diag(y₁²/Γ, ..., yₙ²/Γ)
- Existence and uniqueness (Y_Γ ≻ 0 since yₖ > 0)
- Spectral condition number: κ(H) grows with dynamic range of y
- Comparison with Ch. 13 LS-SVR (Γ⁻¹I → Y_Γ)
**Scope OUT:**
- Symmetric variant → Ch. 19
- SMO not applicable (linear system) → note this explicitly
**Sections:**
```
[Opening hook]
## RMSPE and the least-squares paradigm
## Primal formulation
## KKT conditions and the linear system
## Target-weighted regularization Y_Γ
## Existence, uniqueness, and conditioning
## Fitting on vic_elec and California Housing
## Exercises
```
**Code:** Fit m3 (LS-SVR + RMSPE) on both datasets, compare with
m1 and classical LS-SVR from Ch. 13 (R + Python).
**Concepts installed:** Y_Γ, target-weighted regularization.
**Introduces running examples:** Continues.
**Depends on:** Ch. 13 (classical LS-SVR), Ch. 16 (RMSPE definition)

---

### Ch. 19 — `19-symmetric-variants.qmd` — 🔲 Stub

**Title:** Symmetric Kernel Extensions
**Anchor:** vic_elec — seasonal electricity demand has genuine
physical symmetry; symmetric kernel exploits it.
**Scope IN:**
- Motivation: when does symmetry in the data help?
- Symmetry constraint: ωᵀφ(xₖ) = a ωᵀφ(−xₖ), a ∈ {−1, +1}
- Modified kernel: Ωˢ = ½(Ω + aΩ*), Kˢ(xᵢ,xⱼ) = K(xᵢ,xⱼ) + aK(xᵢ,−xⱼ)
- m2: symmetric ε-SVR with MAPE — kernel changes, box constraints same
- m4: symmetric LS-SVR with RMSPE — kernel changes, Y_Γ same
- Kernel axis vs loss axis: structural orthogonality (preview of Ch. 20)
- When symmetry helps vs hurts: vic_elec positive, California Housing
  inconsistent (bias-variance trade-off)
**Scope OUT:**
- Full orthogonality proof → Ch. 20
**Sections:**
```
[Opening hook]
## When symmetry is a structural property, not an assumption
## The symmetry constraint
## The symmetric kernel
## m2: symmetric ε-SVR with MAPE
## m4: symmetric LS-SVR with RMSPE
## Empirical validation: vic_elec and California Housing
## Exercises
```
**Code:** Fit m2 and m4 on both datasets, ablation study comparing
s=0 vs s=1 variants (R + Python).
**Concepts installed:** Symmetric kernel Ωˢ, a parameter, m2 and m4.
**Introduces running examples:** Continues.
**Depends on:** Ch. 17–18 (m1, m3 as baselines)

---

### Ch. 20 — `20-unified-framework.qmd` — 🔲 Stub

**Title:** A Unified Framework
**Anchor:** All four models on both datasets — the family view.
**Scope IN:**
- Two binary axes: paradigm (ε vs LS) × symmetry (s=0 vs s=1)
- Loss axis: how percentage scaling enters (box constraints vs Y_Γ)
- Kernel axis: how symmetry enters (kernel only, solver unchanged)
- Structural orthogonality theorem: two axes act on disjoint
  components of the Lagrangian
- Paradigm-loss compatibility: four pairings are uniquely determined
- Unified table: four models, two axes, solver class, percentage entry
- Practical implications: solver selection, hyperparameter search
  space (σ shared; C/Γ not shared)
**Scope OUT:**
- SMO implementation → Part V
**Sections:**
```
[Opening hook]
## Two choices, four models
## The loss axis: percentage scaling
## The kernel axis: symmetry as kernel modification
## Structural orthogonality
## The unified table
## Practical implications for solver selection
## Practical implications for hyperparameter search
## Exercises
```
**Code:** Side-by-side comparison of all four models on both datasets,
unified results table (R + Python).
**Concepts installed:** Full unified framework — closes Part IV.
**Introduces running examples:** Continues.
**Depends on:** Ch. 17–19 (all four models)

---

## Part V — Optimization at Scale

### Ch. 21 — `21-scale-problem.qmd` — 🔲 Stub

**Title:** The Scale Problem
**Anchor:** California Housing full dataset (N=20,433) — generic QP
solvers fail or become impractical.
**Scope IN:**
- Why QP solvers fail at SVR scale: O(N²) memory, O(N³) time
- LS-SVR: O(N³) linear solve — infeasible at N=20,433
- The decomposition idea: work on small subsets of variables
- Why LS-SVR is excluded from large-scale experiments (connects
  to Ch. 7 experimental results)
**Scope OUT:**
- SMO algorithm → Ch. 22
**Sections:**
```
[Opening hook]
## Complexity of generic QP solvers
## Memory: the kernel matrix problem
## The decomposition principle
## LS-SVR at scale: why it is excluded
## Exercises
```
**Code:** Show memory and time scaling empirically on increasing N
subsets of California Housing (R + Python).
**Concepts installed:** O(N²) memory wall, decomposition principle.
**Introduces running examples:** California Housing full dataset.
**Depends on:** Ch. 12 (SVR dual QP), Ch. 6 (numerical methods)

---

### Ch. 22 — `22-smo-classical.qmd` — 🔲 Stub

**Title:** Sequential Minimal Optimization
**Anchor:** California Housing — fit classical ε-SVR with SMO.
**Scope IN:**
- SMO idea: decompose N-variable QP into 2-variable subproblems
- Working set selection (WSS3): which pair of variables to update
- Analytical solution of the 2-variable subproblem
- Bias update and shrinking heuristic
- Convergence: KKT violation as stopping criterion
- Comparison with generic solvers (OSQP, MOSEK, Clarabel) on
  medium-scale datasets
**Scope OUT:**
- Sample-dependent box constraints → Ch. 23
- Efficiency extensions → Ch. 23
**Sections:**
```
[Opening hook]
## The SMO idea
## Working set selection
## The two-variable subproblem
## Bias update and shrinking
## Convergence
## Comparison with generic QP solvers
## Exercises
```
**Code:** SMO on classical ε-SVR, convergence curve, comparison with
reference solvers (R + Python via psvr).
**Concepts installed:** SMO, WSS3, 2-variable update, shrinking.
**Introduces running examples:** California Housing full.
**Depends on:** Ch. 12 (ε-SVR dual), Ch. 21 (scale motivation)

---

### Ch. 23 — `23-smo-mape.qmd` — 🔲 Stub

**Title:** SMO with Sample-Dependent Constraints
**Anchor:** California Housing — fit m1 (ε-SVR + MAPE) at full scale.
**Scope IN:**
- Structural invariance theorem: SMO applies unchanged to MAPE-SVR
  because box constraint form is preserved
- Asymmetric freeze counters
- Predictive WSS3 (warm starting)
- Block-k=4: strictly novel contribution
- Combined ~8× speedup corollary
- Adaptive spectral regularization for symmetric kernel variant
**Scope OUT:**
- Empirical solver comparison → Ch. 24
**Sections:**
```
[Opening hook]
## Sample-dependent box constraints in SMO
## The structural invariance theorem
## Efficiency extensions
### Asymmetric freeze counters
### Predictive working set selection
### Block-k=4
### Combined speedup
## Symmetric kernel extension
## Exercises
```
**Code:** Fit m1 at full California Housing scale with psvr SMO,
convergence curves, speedup comparison (R + Python).
**Concepts installed:** Invariance theorem, all four efficiency
extensions. Author's main algorithmic contribution.
**Introduces running examples:** California Housing full (continues).
**Depends on:** Ch. 17 (m1), Ch. 22 (SMO classical)

---

### Ch. 24 — `24-empirical-comparison.qmd` — 🔲 Stub

**Title:** Solvers in Practice
**Anchor:** California Housing full dataset — definitive empirical
comparison.
**Scope IN:**
- SMO (psvr) vs LIBSVM vs OSQP vs MOSEK vs Clarabel
- Convergence curves
- Iteration counts and wall time
- Accuracy vs speed trade-offs
- Practical recommendations
**Sections:**
```
[Opening hook]
## The contenders
## Experimental setup
## Convergence curves
## Wall time and iteration counts
## Accuracy comparison
## Practical recommendations
## Closing: from spreadsheet to framework
```
**Code:** Full benchmark on California Housing (R + Python via psvr).
**Concepts installed:** Nothing new — synthesis and closure.
The final section "Closing: from spreadsheet to framework" echoes
Ch. 1 and closes the arc of the book.
**Introduces running examples:** California Housing full (continues).
**Depends on:** Ch. 22–23 (SMO variants)

---

## Pending decisions

| # | Question | Affects |
|---|---|---|
| 1 | Ch. 14 (GP): use synthetic only or a small subsample of vic_elec? | Ch. 14 code |
| 2 | Ch. 11 (SVM classification): use fraud detection synthetic or real dataset? | Ch. 11 code |
| 3 | Ch. 6 subsections: how much depth on Adam/BFGS for this audience? | Ch. 6 scope |
| 4 | `_quarto.yml`: add `reference-location: margin` and `citation-location: margin` | Infrastructure |

---

## Active work

- [ ] Update `_quarto.yml` with margin reference settings
- [ ] Ch. 2 — Unconstrained Optimization: write section by section
      (structure agreed — see entry above)
