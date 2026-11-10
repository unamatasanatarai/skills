# Skills

Production-grade, evidence-driven capability playbooks that turn AI coding agents into ruthless security auditors, principal architects, and deterministic product operators.

Skills delivers self-contained, battle-tested operational prompts designed for Claude Code, Gemini CLI, Google Antigravity, and OpenAI Codex. Instead of polite platitudes, unverified suggestions, and hallucinated meeting agreements, each skill enforces source-to-sink evidence tracing, explicit confidence ratings, prompt injection defense, and strict output contracts.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Claude | Gemini | Antigravity | Codex](https://img.shields.io/badge/Platform-Claude%20%7C%20Gemini%20%7C%20Antigravity%20%7C%20Codex-lightgrey.svg)]()

---

## Why Skills

General-purpose LLM prompts fail when engineering and operational stakes are high:

* **Superficial Code Audits**: Standard AI reviewers browse the happy path, invent non-existent CVEs, miss critical concurrency races and memory retention leaks, and pollute reports with trivial style nitpicks.
* **Unanchored Architecture**: Models routinely sketch generic microservice diagrams without interrogating traffic thresholds, failure modes, bounded contexts, or operational costs.
* **Disconnected Product Handoffs**: Moving from architecture blueprints to PRDs, roadmaps, and agile user stories frequently drops critical constraints and edge cases.
* **Hallucinated Meeting Outcomes**: Default summaries turn unresolved arguments into false decisions and misattribute action items.

**Skills** eliminates guesswork by packaging autonomous playbooks that hold agents to the standards of principal systems architects, offensive security reviewers, and rigorous technical managers.

---

## Featured Capabilities

### 1. Software Engineering & Security (`dev/`)

* **[Adversarial Review](dev/adversarial-review.md)** (`adversarial-review`)  
  *Offensive AppSec, correctness, and performance audit engine.*  
  Conducts hostile code audits across applications, PR diffs, and critical hot paths. Hunts for exploitable security flaws (IDOR, injection, SSRF, broken trust boundaries), concurrency hazards (races, deadlocks, TOCTOU), memory retention/leaks, CPU waste, and algorithmic bottlenecks. Mandates source-to-sink traces, explicit certainty ratings (`Confirmed`, `Likely`, `Needs validation`), minimal reproduction steps, and regression verification plans.

* **[Hostile Review](dev/hostile-review.md)** (`hostile-review`)  
  *Budgeted code audit engine with systematic candidate disproof.*  
  Enforces dedicated execution modes (**Full audit**, **Diff / PR review**, **Targeted path**, **Snippet analysis**). Systematically attempts to disprove candidate findings before reporting them to eliminate false positives.

* **[Strict Pure Bash Review](dev/bash-review-strict.md)** (`bash-review-strict`)  
  *High-performance pure Bash refactoring engine.*  
  Transforms shell scripts into flat, linear execution flows. Eliminates subshells, forks, pipelines, and external utilities (`sed`, `awk`, `cut`, `grep`) in favor of native Bash built-ins, parameter expansions, and regex matching.

* **[Commercial README Maker](dev/readme-maker.md)** (`readme-maker`)  
  *Product-focused GitHub documentation generator.*  
  Analyzes repository source code, architecture, and configuration to produce high-converting product landing pages embedded directly within GitHub repositories.

### 2. System Architecture (`architecture/`)

* **[HLD Discovery & Drill-Me](architecture/hld-drill-me.md)** (`hld-drill-me`)  
  *Principal Systems Architect discovery interrogator.*  
  Systematically interrogates ambiguous project ideas through a disciplined 7-phase interview to extract validated technical requirements, challenge weak decisions, and build complete, production-grade High-Level Designs.

* **[HLD Product System Designer](architecture/hld-designer.md)** (`hld-designer`)  
  *Interactive HLD interview simulator and product system designer.*  
  Simulates an architectural grill session, evaluates non-functional requirements and tradeoffs, and produces structured product architecture blueprints for engineering alignment.

* **[FAANG-Caliber HLD Review](architecture/hld-faang-review.md)** (`hld-faang-review`)  
  *Large-scale architecture review specialist.*  
  Evaluates High-Level Designs across Web platforms, PHP distributed backend ecosystems, and Android mobile applications for scalability ceilings, security boundaries, resilience, and operational maintainability.

* **[Reverse-Engineer HLD from Project](architecture/hld-from-project.md)** (`hld-from-project`)  
  *Reconstruction blueprint generator.*  
  Reverse-engineers existing codebases, schemas, APIs, and configuration files into implementation-ready High-Level Designs for system recreation from scratch.

### 3. Product Strategy & Execution (`product/`)

* **[HLD to PRD Translator](product/hld-to-prd.md)** (`hld-to-prd`)  
  *Technical architecture-to-product specification translator.*  
  Transforms technical High-Level Designs into comprehensive Product Requirements Documents (PRDs) with testable acceptance criteria, user personas, failure modes, and measurable KPIs.

* **[Technical Sequence Roadmap Planner](product/roadmap.md)** (`roadmap`)  
  *PRD-to-execution sequence planner.*  
  Decomposes product requirements into milestone-based build orders, mapping dependencies and distinguishing sequential paths from parallel tracks.

* **[Agile User Story Generator](product/stories.md)** (`stories`)  
  *INVEST-compliant user story creator.*  
  Synthesizes specifications and architecture docs into user stories grouped by epic, complete with testable acceptance criteria and priority tiers.

### 4. Operations & Project Management (`project-management/`)

* **[Notka ze Spotkania](project-management/notka-ze-spotkania.md)** (`notka-ze-spotkania`)  
  *Deterministic 4-section meeting extraction engine.*  
  Transforms messy transcripts, voice memos, and rough notes into structured records (**Data i uczestnicy**, **Decyzje**, **Zadania do wykonania**, **Otwarte pytania**). Enforces prompt injection defense by treating input strictly as data and explicitly flags unassigned responsibilities.

* **[Development Task Breakdown](project-management/tasks.md)** (`tasks`)  
  *Actionable engineering task decomposition specialist.*  
  Translates documentation and user stories into bite-sized, independently deliverable developer tasks with explicit acceptance criteria, context summaries, and dependencies.

### 5. Meta & Prompt Engineering (`prompt-engineering/`)

* **[Meta Prompt Optimizer](prompt-engineering/meta.md)** (`meta`)  
  *Master prompt engineering specialist.*  
  Transforms topics, goals, target audiences, and constraints into self-contained, high-performance LLM prompts with step-by-step thinking requirements and output validation rules.

---

## Core Engineering Principles

| Principle | Implementation in Skills |
|---|---|
| **Evidence Over Speculation** | Every technical finding must cite line numbers, symbols, and data flows. Unverified leads remain labeled `Needs validation`. |
| **Zero Hallucination Tolerance** | Meeting decisions, architectural details, and task owners are never inferred; unstated details are preserved as open questions or unassigned items. |
| **Prompt Injection Resilience** | Agent instructions explicitly treat external transcripts, code comments, and test fixtures as untrusted data rather than operational commands. |
| **Verification-First Remediation** | Audit findings must include minimal actionable fixes accompanied by concrete regression tests, benchmarks, or reproduction procedures. |

---

## How It Works

```text
1. Select Target Agent Environment (Claude, Gemini, Antigravity, or Codex)
2. Deploy Skills via the unified CLI (`./install <target>`)
3. Supply source code, pull request diffs, transcripts, or design docs
4. Receive structured, evidence-backed findings and actionable outputs
```

Each skill is distributed as a self-contained Markdown definition with YAML frontmatter, making it fully portable across agent runtimes, local IDE configurations, and custom agent workflows.

---

## Supported Environments

The repository includes standalone CLI management tools (`install` and `uninstall`) with native symlink deployment:

| Target | Description | Default Path |
|---|---|---|
| **`claude`** | Claude Code & Desktop | `~/.claude/skills` |
| **`gemini`** | Gemini CLI & Assistant | `~/.gemini/skills` |
| **`antigravity`** | Google Antigravity IDE & CLI | `~/.gemini/antigravity-cli/skills`, `~/.gemini/config/skills` |
| **`codex`** | OpenAI Codex CLI | `~/.codex/skills` |
| **`all`** | All detected environments | Installs across all supported destinations |

---

## Quick Start

### 1. Install Skills to Your Agent

Deploy skills across your agent environments using the standalone `install` tool:

```bash
# Display help and usage
./install

# Install all skills into all supported agent environments
./install all

# Install all skills into a specific agent
./install antigravity
./install claude
./install gemini
./install codex
```

### 2. Selective Skill Installation

Install individual skills by passing the `--skill` flag:

```bash
# Install only the adversarial code review skill into Claude
./install claude --skill=dev/adversarial-review.md

# Install the HLD discovery skill into Antigravity
./install antigravity --skill=architecture/hld-drill-me.md

# Install the meeting notes specialist into Gemini
./install gemini --skill=project-management/notka-ze-spotkania.md
```

### 3. Uninstalling Skills

Remove managed symlinks cleanly using the `uninstall` tool:

```bash
# Display help and usage
./uninstall

# Remove all skills from all environments
./uninstall all

# Remove a specific skill from a single target
./uninstall gemini --skill=prompt-engineering/meta.md
```

### 4. Custom Installation Targets

To configure custom destination directories, create a targets file at `$XDG_CONFIG_HOME/skills-install/targets` (default: `~/.config/skills-install/targets`):

```text
# Custom agent skill locations
~/.claude/skills
~/.config/custom-agent/skills
```

When present, `./install all` reads from this file automatically.

---

## Invoking Skills in Agents

Once installed, invoke skills naturally within your agent chat or terminal:

### Code Audits
```text
"Run an adversarial security, performance, and memory review of this repository."
"Review this PR; prioritize exploitable flaws, races, leaks, and regressions."
"Audit this code path as if you were trying to break it."
```

### Architecture Discovery & Design
```text
"Drill me on my idea for an event-driven payment processing platform."
"Simulate an HLD review session for a multi-tenant SaaS dashboard."
"Reverse-engineer an HLD from this repository."
```

### Meeting Notes & Product Specs
```text
"Wygeneruj notatkę z poniższego spotkania: [wklej transkrypcję / notatki]"
"Translate this HLD into a full PRD with acceptance criteria."
"Break down this feature into developer tasks."
```

---

## License

This project is licensed under the [MIT License](LICENSE).
