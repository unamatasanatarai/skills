# Skills

Evidence-driven, specialized AI agent skills designed for rigorous code audits and precise meeting extraction.

Skills provides ready-to-use, prompt-engineered capability definitions for AI coding agents and LLM workflows. Instead of relying on generic prompts that produce polite platitudes or fabricated findings, these skills enforce adversarial testing, verifiable source citations, and deterministic output structures.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## Why Skills

General-purpose agent prompts often fail in high-stakes workflows:
- **Flawed Code Reviews**: Automated reviewers frequently hallucinate vulnerabilities, miss critical failure paths, or spam developers with noisy style nitpicks.
- **Messy Meeting Transcripts**: Summarizers often invent agreements, confuse ongoing discussions with settled decisions, or drop crucial action item owners.

**Skills** solves this by packaging specialized, battle-tested operational guidelines that force agents to act like domain specialists: verifying evidence before reporting, classifying certainty, and adhering to strict output contracts.

---

## Featured Skills

### Software Engineering & Security (`dev/`)

* **[Adversarial Review](dev/adversarial-review.md)** (`adversarial-review`)  
  *Adversarial AppSec, correctness, and performance code auditor.*  
  Conducts ruthless, evidence-driven code audits across applications, PR diffs, and hot paths. Hunts for exploitable security flaws (IDOR, injection, SSRF, auth boundaries), concurrency hazards (races, deadlocks, TOCTOU), memory retention/leaks, CPU waste, and algorithmic bottlenecks. Mandates source-to-sink tracing, certainty ratings (`Confirmed`, `Likely`, `Needs validation`), minimal proof-of-concept requirements, and regression verification plans.

* **[Hostile Review](dev/hostile-review.md)** (`hostile-review`)  
  *Alternative high-intensity audit persona with execution mode budgeting.*  
  Implements specialized audit modes (`Full audit`, `Diff / PR review`, `Targeted path`, `Snippet`) with calibrated false-positive filtering to prioritize high-consequence vulnerabilities and performance drain over conversational padding.

### Operations & Delivery (`project-management/`)

* **[Notka ze Spotkania / Meeting Notes Specialist](project-management/notka-ze-spotkania.md)** (`notka-ze-spotkania`)  
  *Deterministic 4-section meeting extraction engine.*  
  Transforms messy transcripts, voice memos, and rough notes into structured, executive-ready records. Enforces a strict 4-part structure (**Data i uczestnicy**, **Decyzje**, **Zadania do wykonania**, **Otwarte pytania**), treats pasted input strictly as data rather than instructions, eliminates hallucinated commitments, and explicitly marks unassigned responsibilities or unaddressed questions.

---

## Skill Architecture & Design Principles

Each skill in this repository is built around strict operational guardrails:

| Principle | Execution |
|---|---|
| **Evidence Over Speculation** | Cites explicit line ranges, symbols, and data flows. Hypotheses must be labeled as such. |
| **Prompt Injection Defense** | Input content is treated strictly as untrusted data, preventing adversarial text in transcripts or code comments from hijacking agent instructions. |
| **Honest Confidence Grading** | Requires explicit certainty ratings (`Confirmed`, `Likely`, `Needs validation`) rather than manufactured urgency. |
| **Actionable Remediations** | Every identified defect requires a minimal fix, a verification mechanism, and an evaluation of architectural trade-offs. |

---

## How It Works

Each skill definition is delivered as an autonomous Markdown module with YAML frontmatter metadata, structured instructions, and strict schema constraints:

```text
1. Select the relevant skill (e.g. dev/adversarial-review.md or project-management/notka-ze-spotkania.md)
2. Load the skill into your agent framework, IDE system prompt, or CLI configuration
3. Invoke the skill with your target source code, pull request, or meeting transcript
4. Receive structured, evidence-backed findings or summaries adhering to the skill's output contract
```

---

## Quick Start & Usage

### Incorporating into AI Agents & IDEs

Skills can be loaded directly into AI agents, system prompts, or agentic frameworks supporting custom skills.

#### Example: Running an Adversarial Review
Provide the agent with `dev/adversarial-review.md` and instruct:
```text
"Review this PR; prioritize exploitable flaws, races, leaks, and regressions."
```
or
```text
"Run an adversarial security, performance, and memory review of this repository."
```

#### Example: Processing Meeting Notes
Provide the agent with `project-management/notka-ze-spotkania.md` and supply the transcript:
```text
"Wygeneruj notatkę z poniższego spotkania: [wklej transkrypcję / notatki]"
```

---

## License

This project is licensed under the [MIT License](LICENSE).
