# Skills

Evidence-driven, specialized AI agent capabilities designed for adversarial code audits and deterministic meeting extraction across modern AI environments.

Skills replaces generic, polite LLM responses with rigorous, role-specific operational playbooks. Instead of unverified advice or hallucinated meeting notes, each skill enforces source-to-sink evidence tracing, strict confidence grading, prompt injection defense, and structured output contracts.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Claude | Gemini | Antigravity | Codex](https://img.shields.io/badge/Platform-Claude%20%7C%20Gemini%20%7C%20Antigravity%20%7C%20Codex-lightgrey.svg)]()

---

## Why Skills

General-purpose agent prompts fail when the stakes are high:

* **Vague and Hallucinated Code Audits**: Conventional AI reviewers skim the happy path, report speculative vulnerabilities, miss concurrency races and memory retention defects, and pad reports with noisy stylistic advice.
* **Unreliable Meeting Notes**: Standard conversational summarizers frequently invent commitments, confuse discussion points with decided outcomes, and drop action item owners.

**Skills** eliminates guesswork by providing specialized operational contracts that hold agents to the standards of principal security engineers and precision extractors.

---

## Featured Capabilities

### Application Security & Performance Audits (`dev/`)

* **[Adversarial Review](dev/adversarial-review.md)** (`adversarial-review`)  
  *Ruthless AppSec, correctness, and performance audit engine.*  
  Acts as an adversarial principal engineer auditing code before attackers, traffic spikes, or memory leaks break production.  
  - **Comprehensive Vulnerability Hunting**: Attacks trust boundaries, IDOR/BOLA, injection, SSRF, deserialization, and cryptographic flaws.  
  - **Runtime & Concurrency Analysis**: Catches race conditions, TOCTOU, deadlocks, lock contention, unbounded queues, and cancellation leaks.  
  - **Memory & Resource Lifecycle**: Dissects memory leaks vs. retention, allocation churn, buffer spikes, and unclosed descriptors.  
  - **Evidence-Based Grading**: Requires every finding to include concrete file/symbol/line citations, source-to-sink data flow traces, and calibrated confidence levels (`Confirmed`, `Likely`, `Needs validation`).

* **[Hostile Review](dev/hostile-review.md)** (`hostile-review`)  
  *Execution-mode budgeted security and performance auditor.*  
  Tailors audit intensity to operational contexts with dedicated modes for **Full audit**, **Diff / PR review**, **Targeted path**, and **Snippet analysis**. Systematically attempts to disprove candidate findings before reporting them to eliminate false alarms.

### Operations & Delivery (`project-management/`)

* **[Notka ze Spotkania](project-management/notka-ze-spotkania.md)** (`notka-ze-spotkania`)  
  *Deterministic 4-section meeting extraction engine.*  
  Converts chaotic meeting transcripts, voice memos, and rough notes into clean, structured records.  
  - **Fixed 4-Section Contract**: Guarantees consistent outputs (**Data i uczestnicy**, **Decyzje**, **Zadania do wykonania**, **Otwarte pytania**).  
  - **Decision Isolation**: Strictly separates settled agreements from ongoing discussions.  
  - **Unassigned Accountability**: Explicitly flags tasks without assignees (`[odpowiedzialny: nieprzypisany]`) rather than inventing owners.  
  - **Prompt Injection Defense**: Treats input transcripts strictly as data to summarize, ignoring embedded instructions or overrides.

---

## Core Engineering Principles

| Principle | Execution in Skills |
|---|---|
| **Evidence Over Speculation** | Every technical finding must cite line numbers, symbols, and data flows. Plausible hypotheses without complete traces must be labeled `Needs validation`. |
| **Zero Hallucination Tolerance** | Meeting decisions and action item owners are never inferred from general context; missing details are preserved as unassigned or open questions. |
| **Prompt Injection Resilience** | Agent instructions explicitly treat external transcripts, code comments, and test fixtures as untrusted data rather than operational commands. |
| **Verification-First Remediation** | Audit findings must include minimal actionable fixes accompanied by concrete regression tests, benchmarks, or reproduction procedures. |

---

## How It Works

```text
1. Select Target Agent Environment (Claude, Gemini, Antigravity, or Codex)
2. Deploy Skill via the unified CLI (`./install <target>`)
3. Pass your source code, pull request diff, or meeting transcript
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

### 1. Install Skills to Your Agent

Use the standalone `install` tool to symlink skills into your agent directory.

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

# Install the meeting notes specialist into Gemini
./install gemini --skill=project-management/notka-ze-spotkania.md
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

## Invoking Skills in Agents

Once installed, invoke skills naturally in your agent chat or terminal:

### Code Audits
```text
"Run an adversarial security, performance, and memory review of this repository."
"Review this PR; prioritize exploitable flaws, races, leaks, and regressions."
"Audit this code path as if you were trying to break it."
```

### Meeting Notes
```text
"Wygeneruj notatkę z poniższego spotkania: [wklej transkrypcję / notatki]"
```

---

## License

This project is licensed under the [MIT License](LICENSE).
