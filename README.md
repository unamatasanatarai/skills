# Skills

Evidence-driven, specialized AI agent capabilities designed for software engineering, system architecture, product discovery, and project management across modern AI environments.

Skills replaces generic, polite LLM responses with rigorous, role-specific operational playbooks. Instead of unverified advice or hallucinated plans, each skill enforces source-to-sink evidence tracing, strict confidence grading, prompt injection defense, and structured output contracts.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Claude | Gemini | Antigravity | Codex](https://img.shields.io/badge/Platform-Claude%20%7C%20Gemini%20%7C%20Antigravity%20%7C%20Codex-lightgrey.svg)]()

---

## Why Skills

General-purpose agent prompts fail when the stakes are high:

* **Vague and Hallucinated Code Audits**: Conventional AI reviewers skim the happy path, report speculative vulnerabilities, miss concurrency races and memory retention defects, and pad reports with noisy stylistic advice.
* **Unstructured System Architecture**: LLMs often generate textbook microservice diagrams without probing edge cases, failure states, or trade-offs.
* **Disconnected Product Deliverables**: Moving from architecture to PRDs, roadmaps, and agile stories frequently loses critical technical context.
* **Unreliable Meeting Notes**: Standard conversational summarizers frequently invent commitments, confuse discussion points with decided outcomes, and drop action item owners.

**Skills** eliminates guesswork by providing specialized operational contracts that hold agents to the standards of principal architects, security researchers, and precision technical managers.

---

## Skill Catalog by Domain

### 1. Software Engineering & Security (`dev/`)

* **[Adversarial Review](dev/adversarial-review.md)** (`adversarial-review`)  
  *Ruthless AppSec, correctness, and performance audit engine.*  
  Hunts exploitable security flaws (IDOR, injection, SSRF, auth boundaries), concurrency hazards (races, deadlocks, TOCTOU), memory retention/leaks, CPU waste, and algorithmic bottlenecks with source-to-sink evidence tracing.
* **[Hostile Review](dev/hostile-review.md)** (`hostile-review`)  
  *Execution-mode budgeted security and performance auditor.*  
  Tailors audit intensity to operational contexts with dedicated modes for **Full audit**, **Diff / PR review**, **Targeted path**, and **Snippet analysis**, systematically attempting to disprove candidate findings before reporting.
* **[Strict Pure Bash Review](dev/bash-review-strict.md)** (`bash-review-strict`)  
  *High-performance pure Bash refactoring and review skill.*  
  Transforms shell scripts into flat, linear execution flows that eliminate subshells, forks, pipelines, and external binaries in favor of robust Bash built-ins and parameter expansions.
* **[Adversarial macOS & Swift Audit](dev/cr-adversarial-swift.md)** (`cr-adversarial-swift`)  
  *Specialized macOS platform assurance, exploitation, and optimization team.*  
  Deeply investigates Swift Concurrency/Actors, AppKit/SwiftUI lifecycle, sandboxing, entitlements, Accessibility, Mach ports, memory leaks, and distribution readiness.
* **[Commercial Project README Generator](dev/readme-marketing-from-project.md)** (`readme-marketing-from-project`)  
  *Product-focused GitHub README generator.*  
  Analyzes project code and architecture to produce persuasive, commercial-grade product landing pages embedded directly in GitHub repositories.

### 2. System Architecture (`architecture/`)

* **[HLD Discovery & Drill-Me](architecture/hld-drill-me.md)** (`hld-drill-me`)  
  *Principal Systems Architect technical discovery interrogator.*  
  Systematically interrogates ambiguous project ideas through a disciplined 7-phase interview to force specificity, challenge weak decisions, and build complete, production-grade High-Level Designs.
* **[HLD Product System Designer](architecture/hld-designer.md)** (`hld-designer`)  
  *Interactive HLD interview simulator and product system designer.*  
  Conducts a realistic architectural grill session, evaluates tradeoffs, and delivers structured product architecture blueprints for Product Owners and engineering alignment.
* **[FAANG-Caliber HLD Review](architecture/hld-faang-review.md)** (`hld-faang-review`)  
  *Senior Product Owner and large-scale architecture reviewer.*  
  Evaluates HLD documents across Web, PHP distributed backends, and Android systems for scalability limits, integration contracts, failure resilience, and maintainability.
* **[Reverse-Engineer HLD from Project](architecture/hld-from-project.md)** (`hld-from-project`)  
  *Reconstruction blueprint generator.*  
  Reverse-engineers existing codebases, repositories, and documentation to create comprehensive, implementation-ready High-Level Designs for system recreation from scratch.

### 3. Product Strategy & Execution (`product/`)

* **[HLD to PRD Translator](product/hld-to-prd.md)** (`hld-to-prd`)  
  *Architecture-to-product requirements translation specialist.*  
  Transforms technical High-Level Design blueprints into comprehensive, user-centric Product Requirements Documents (PRDs) with testable acceptance criteria, personas, and measurable KPIs.
* **[Technical Sequence Roadmap Planner](product/roadmap.md)** (`roadmap`)  
  *PRD-to-execution technical sequence planner.*  
  Decomposes product requirements into execution-ready, dependency-mapped, milestone-based build orders distinguishing sequential paths from parallel tracks.
* **[Agile User Story Generator](product/stories.md)** (`stories`)  
  *INVEST-compliant user story creator.*  
  Synthesizes product and architectural documentation into clear user stories grouped by epic, complete with testable acceptance criteria and priority tiers.

### 4. Operations & Project Management (`project-management/`)

* **[Notka ze Spotkania](project-management/notka-ze-spotkania.md)** (`notka-ze-spotkania`)  
  *Deterministic 4-section meeting extraction engine.*  
  Converts chaotic meeting transcripts, voice memos, and rough notes into clean records (**Data i uczestnicy**, **Decyzje**, **Zadania do wykonania**, **Otwarte pytania**), strictly isolating decisions from discussions and defending against prompt injection.
* **[Development Task Breakdown](project-management/tasks.md)** (`tasks`)  
  *Actionable developer task decomposition specialist.*  
  Translates documentation and user stories into bite-sized, independently deliverable engineering tasks with explicit acceptance criteria, context summaries, and dependencies.

### 5. Meta & Prompt Engineering (`prompt-engineering/`)

* **[Meta Prompt Optimizer](prompt-engineering/meta.md)** (`meta`)  
  *Master prompt engineering and optimization specialist.*  
  Transforms topics, goals, audiences, and output constraints into self-contained, high-performance LLM prompts with step-by-step thinking requirements, validation rules, and output constraints.

---

## Core Engineering Principles

| Principle | Execution in Skills |
|---|---|
| **Evidence Over Speculation** | Every technical finding must cite line numbers, symbols, and data flows. Plausible hypotheses without complete traces must be labeled `Needs validation`. |
| **Zero Hallucination Tolerance** | Meeting decisions, architectural details, and task owners are never inferred without evidence; missing details are preserved as open questions. |
| **Prompt Injection Resilience** | Agent instructions explicitly treat external transcripts, code comments, and test fixtures as untrusted data rather than operational commands. |
| **Verification-First Remediation** | Audit findings must include minimal actionable fixes accompanied by concrete regression tests, benchmarks, or reproduction procedures. |

---

## How It Works

```text
1. Select Target Agent Environment (Claude, Gemini, Antigravity, or Codex)
2. Deploy Skill via the unified CLI (`./install <target>`)
3. Pass your source code, pull request diff, transcript, or design doc
4. Receive structured, evidence-backed findings and actionable outputs
```

Each skill is distributed as a self-contained Markdown definition with YAML frontmatter, making it portable across agent runtimes and local IDE configurations.

---

## Supported Environments

The bundled `install` tool provides native symlink deployment into all major coding agent configurations:

| Target | Description | Default Path |
|---|---|---|
| **`claude`** | Claude Code & Desktop | `~/.claude/skills` |
| **`gemini`** | Gemini CLI & Assistant | `~/.gemini/skills` |
| **`antigravity`** | Google Antigravity IDE & CLI | `~/.gemini/antigravity-cli/skills`, `~/.gemini/config/skills` |
| **`codex`** | OpenAI Codex CLI | `~/.codex/skills` |
| **`all`** | All detected environments | Installs across all supported destinations |

---

## Quick Start

### 1. Install or Uninstall Skills

Use the standalone `install` and `uninstall` tools to manage symlinks in your agent directories:

```bash
# Display help and usage
./install
./uninstall

# Install all skills into all supported agent environments
./install all

# Uninstall all skills from all supported agent environments
./uninstall all

# Install / uninstall across a specific agent
./install antigravity
./uninstall antigravity
./install claude
./uninstall claude
./install gemini
./uninstall gemini
./install codex
./uninstall codex
```

### 2. Selective Skill Management

Install or uninstall individual skills by passing the `--skill` flag:

```bash
# Install only the adversarial code review skill into Claude
./install claude --skill=dev/adversarial-review.md

# Uninstall only a specific skill from Gemini
./uninstall gemini --skill=prompt-engineering/meta.md
```

### 3. Custom Installation Targets

To configure custom destination directories, create a targets configuration file at `$XDG_CONFIG_HOME/skills-install/targets` (default: `~/.config/skills-install/targets`):

```text
# Custom agent skill locations
~/.claude/skills
~/.config/custom-agent/skills
```

When present, `./install all` reads from this file automatically.

---

## Repository Structure

```text
skills/
├── LICENSE                                # MIT License
├── README.md                              # Repository overview and skill documentation
├── install                                # Standalone CLI installer with multi-target support
├── uninstall                              # Standalone CLI uninstaller matching install options
├── architecture/
│   ├── hld-designer.md                    # Interactive HLD interview simulator & designer
│   ├── hld-drill-me.md                    # Technical discovery interrogation facilitator
│   ├── hld-faang-review.md                # FAANG-caliber HLD reviewer (Web, PHP, Android)
│   └── hld-from-project.md                # Reverse-engineering HLD blueprint generator
├── dev/
│   ├── adversarial-review.md              # AppSec, correctness, and performance audit engine
│   ├── bash-review-strict.md              # Pure Bash performance refactoring & review
│   ├── cr-adversarial-swift.md            # Adversarial macOS & Swift application audit
│   ├── hostile-review.md                  # Mode-budgeted adversarial code review skill
│   └── readme-marketing-from-project.md   # Commercial GitHub README generator
├── product/
│   ├── hld-to-prd.md                      # HLD to Product Requirements Document translator
│   ├── roadmap.md                         # Technical sequence roadmap planner
│   └── stories.md                         # Agile INVEST user story generator
├── project-management/
│   ├── notka-ze-spotkania.md              # Deterministic 4-section meeting extraction engine
│   └── tasks.md                           # Developer task breakdown specialist
└── prompt-engineering/
    └── meta.md                            # Master prompt optimization & engineering specialist
```

---

## License

This project is licensed under the [MIT License](LICENSE).
