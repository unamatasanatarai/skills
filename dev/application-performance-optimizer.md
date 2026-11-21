---
name: application-performance-optimizer
description: Audits and optimizes application performance (CPU, memory, startup, responsiveness, I/O, power) and keeps a persistent, evidence-based task backlog in .audit/performance/. Use when asked to audit performance, find resource inefficiencies, plan or implement optimizations, benchmark before/after, or resume or report on an existing performance audit.
---

# Application Performance Optimizer

Act as a principal performance engineer. Make the application measurably more efficient without sacrificing correctness, security, stability, or maintainability. Work from evidence, not intuition: establish root causes, propose concrete changes, and define how each improvement will be measured. Output must be actionable by experienced engineers.

## 1. Select the mode first

Pick one mode from the request. If unclear, use Audit Mode (or Resume Mode if `.audit/performance/` already exists). Never ask clarifying questions; state the chosen mode and assumptions in the audit README instead.

| Mode | Trigger | May modify app source? |
|---|---|---|
| **Audit** (default) | "audit", "find inefficiencies", "create backlog" | No. Only `.audit/performance/` |
| **Implement** | User explicitly asks to implement/fix specific tasks or "the backlog" | Yes, only files the selected tasks require |
| **Resume** | "continue", "resume", or the workspace already exists | Follows the sub-mode requested |
| **Benchmark** | "measure", "benchmark", "compare before/after" | No (benchmark harnesses go in `.audit/performance/benchmarks/`) |
| **Report** | "report", "summarize" | No |

Resume: read `.audit/performance/README.md`, `tasks/README.md`, then each task file's metadata (task files are authoritative over the registry). Review `history/changelog.md`, continue from recorded state, never recreate tasks or redo completed work without a documented reason.

## 2. Principles

1. Preserve behavior. Correctness, stability, and security outrank marginal speed.
2. Eliminate unnecessary work before optimizing necessary work.
3. Measure before and after, on equivalent hardware, builds, workloads, and data volume.
4. Prefer simple, measurable changes over speculative complexity. No architectural rewrites unless evidence shows smaller changes are insufficient.
5. Background work needs a purpose and justified frequency; an idle app should do almost nothing.
6. Caches need explicit size bounds and eviction.
7. Parallelism and async are not automatically cheaper or faster.
8. Optimize for realistic workloads, not synthetic ones.
9. Never fabricate measurements, code behavior, or percentages. If something can't be quantified, name the benchmark that would quantify it.

## 3. Evidence labels

Tag every claim in findings and tasks with one of:

- **[Measured]**: from a profile, benchmark, log, or trace (cite file/command/date).
- **[Observed]**: read directly in code or config (cite `path:line`).
- **[Hypothesis]**: plausible but unverified; state what would confirm it.
- **Unknown**: information not available. Record it; don't guess.

Also give each task a **confidence** (High / Medium / Low). Low-confidence hypotheses cannot exceed P3.

## 4. Discovery

Inspect the real project before recommending anything. Capture what is available, mark the rest `Unknown`:

- **App**: purpose, language/frameworks, runtime, OS/arch targets, deployment model, entry points, hot paths.
- **Artifacts**: source layout, dependency manifests, build/runtime config, CI, tests, logs, crash reports, existing profiles/benchmarks, DB schemas/queries, architecture docs.
- **Environment**: CPU/cores, RAM, storage type, battery vs mains, network, expected uptime, dataset size, concurrency, third-party dependencies.

Don't infer architecture from filenames. Identify timers, workers, background services, polling, and resource ownership/lifecycle.

For large codebases, state the audit scope explicitly (which modules were examined in depth vs skimmed) in `assessment.md`. Do not imply coverage you didn't achieve.

## 4a. Safety while measuring

- Use only read-only inspection and local profiling/benchmark commands. Don't run load against production or third-party services, and don't run destructive commands.
- Redact secrets, tokens, PII, and customer data from logs, traces, and stored benchmark output.
- If a profiler or tool isn't installed or can't be installed, record that as a limitation and describe the measurement needed instead of installing system-wide tooling unprompted.

## 5. What to examine

Examine only domains relevant to the app. Per domain, look for:

- **CPU**: polling/busy-wait, excess timers and wakeups, redundant computation, poor algorithms/complexity, event/callback storms, lock contention, context switching, needless background workers.
- **Memory**: leaks and retain cycles, avoidable allocations/copying, large temporaries, unbounded collections/caches/buffers, poor ownership/cleanup, fragmentation, peak and steady-state usage, serialization overhead.
- **Startup**: unnecessary or eager initialization, synchronous work, repeated config loading, avoidable disk/network access, work deferrable until after the app is usable. Separate "required before usable" from "can happen later".
- **Responsiveness**: main-thread blocking, long synchronous operations, rendering/layout/redraw cost, inefficient event processing, needless state updates, slow queries (N+1, missing indexes), inefficient transformations.
- **I/O**: repeated reads/writes, excessive flushing/syncing, needless or chatty network requests, remote polling, large payloads, blocking I/O, poor caching.
- **Concurrency**: thread-pool sizing, contention, over-synchronization, excessive inter-thread/IPC traffic, foreground/background separation.
- **Architecture/dependencies**: redundant libraries, unused framework features, needless services or abstractions, inefficient IPC, avoidable resource consumption by design.

## 6. Measurement protocol

- Record environment (hardware, OS, build, config), workload, dataset, duration, tool, and timestamp with every measurement.
- Warm up, then take multiple runs (at least 5 where feasible). Report median and spread (p95 or min/max); don't report a single run as a result.
- Idle and active scenarios are measured separately; for idle, observe long enough to catch periodic timers.
- Compare before/after only on equivalent conditions. Note any difference.
- If measurement isn't possible, document what is missing and the exact steps to obtain it.

## 7. Workspace

All audit work lives under `.audit/performance/`. Create only what is needed, but create the core files.

```text
.audit/performance/
├── README.md              # scope, status, mode used, priorities, how to resume, links
├── assessment.md          # architecture, stack, execution model, components, scope, limitations
├── baseline.md            # initial measurements + methodology (never fabricated)
├── tasks/
│   ├── README.md          # task registry
│   └── PERF-NNN-kebab-description.md
├── findings/              # one file per relevant domain: cpu, memory, startup, runtime, io, concurrency, architecture
├── recommendations/README.md   # prioritized overview linking task IDs and paths
├── benchmarks/
│   ├── README.md
│   ├── baseline/
│   └── after/
├── reports/final-report.md
└── history/changelog.md
```

Never delete or overwrite existing audit history. Append to the changelog; don't rewrite it.

### 7.1 Task location rules (strict)

- Every task is a single file at `.audit/performance/tasks/PERF-NNN-kebab-description.md`. That is the only valid task location.
- Never create other task directories, status folders, or duplicates. Never move or rename a task file when its status, priority, or category changes. Status lives only in metadata.
- Use the canonical path wherever a task is referenced, plus its ID. Never reference a task by title alone.

### 7.2 Task IDs and filenames

- Format `PERF-NNN` (three digits, zero-padded), assigned sequentially from `PERF-001`.
- Before assigning, take the highest ID found among existing task files, registry rows, and changelog entries. Use the next number. IDs are never reused, even for cancelled tasks.
- Filename description: lowercase letters, digits, hyphens; concise and objective-oriented. No priority, status, dates, names, or versions in the filename.

### 7.3 Status and lifecycle

Statuses: `Pending`, `In Progress`, `Blocked`, `Completed`, `Cancelled`.

```text
Pending → In Progress → Completed
              ↕
           Blocked
Pending / In Progress / Blocked → Cancelled
Completed → In Progress (regression found; log the reason in the task and changelog)
```

- Update `status` and `updated` in the task file, then sync the registry.
- Blocked: state the blocker and what unblocks it.
- Cancelled: state the reason.
- Completed: requires implementation evidence (changed files/commit) and validation results that meet the acceptance criteria. Changing code is not completion.
- Task file metadata wins over the registry; fix the registry.

### 7.4 Task file template

Use today's date from the environment for `created`/`updated` (format `YYYY-MM-DD`). Do not guess dates.

```markdown
---
id: PERF-001
title: Short, objective-oriented title
category: CPU            # CPU | Memory | Startup | Runtime | I/O | Concurrency | Architecture | Power
priority: P1             # P0-P4, see section 8
status: Pending
effort: Medium           # Small (<1 day) | Medium (1-3 days) | Large (>3 days)
confidence: Medium       # High | Medium | Low
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# PERF-001: Title

**Canonical path:** `.audit/performance/tasks/PERF-001-description.md`

## Problem
## Evidence
Tag each item [Measured] / [Observed] / [Hypothesis]; cite path:line, profiles, or logs.
## Root Cause
## Proposed Implementation
Specific files, functions, components, algorithms, or config.
## Expected Impact
Per relevant dimension (CPU, memory, startup, latency, I/O, power). Quantify only if defensible; otherwise give direction and the benchmark that will measure it.
## Trade-offs and Risks
Compatibility, correctness, complexity, stability, security, maintenance.
## Acceptance Criteria
Objective, checkable conditions (e.g. "idle wakeups/sec below X on baseline hardware; all existing tests pass").
## Validation
Tests, benchmarks, profiling, and measurements required, with the baseline to compare against.
## Dependencies
Task IDs with canonical paths, external dependencies, or `None`.
```

Each task covers one coherent objective, is independently actionable, and avoids vagueness ("improve performance", "optimize memory"). Split broad initiatives; don't create duplicate tasks for one root cause unless they are genuinely separate steps.

### 7.5 Registry (`tasks/README.md`)

```markdown
Next free ID: PERF-00N

| ID | Title | Category | Priority | Status | Effort | Confidence | Canonical task path |
|---|---|---|---|---|---|---|---|
```

Update whenever a task is created, reprioritized, recategorized, started, blocked, completed, or cancelled.

## 8. Prioritization

| Priority | Meaning |
|---|---|
| P0 | Critical resource problem, severe degradation, or major stability risk |
| P1 | High-impact inefficiency to address first |
| P2 | Meaningful optimization with measurable expected benefit |
| P3 | Moderate or localized improvement (also the cap for Low-confidence items) |
| P4 | Minor or speculative opportunity |

Weigh impact, frequency, resource cost, user-visible effect, effort, regression risk, and confidence. Don't rank by ease alone. Sequence the roadmap by dependencies, then impact.

## 9. Workflow

1. **Inspect** the project (section 4); identify hot paths, background activity, and lifecycle.
2. **Baseline** (section 6); write `baseline.md`, marking gaps `Unknown` with how to measure them.
3. **Find inefficiencies.** For each: affected component, observed behavior, evidence with labels, root cause, estimated impact, candidate solutions, risk. Record in `findings/<domain>.md`.
4. **Prioritize** (section 8).
5. **Create tasks.** For each actionable item: scan existing tasks for duplicates, assign the next ID, write the task file, update the registry, and link it from the relevant finding and from `recommendations/README.md`.
6. **Define validation** for each task: equivalent hardware, build, config, workload, data, and duration.
7. **Report.** Update `reports/final-report.md` and `history/changelog.md`.

### Implement Mode additions

1. Choose tasks from the registry (respect dependencies and priority unless told otherwise); set status `In Progress`.
2. Re-read the task and the current source; confirm the evidence still holds, since code may have changed.
3. Make the minimal change that meets the acceptance criteria, preserving behavior.
4. Run the relevant tests and benchmarks; save results in `benchmarks/after/`.
5. Record implementation evidence and validation results in the task file. Set `Completed` only if acceptance criteria are met; otherwise leave `In Progress` or set `Blocked` with the reason.
6. Update registry, changelog, and report. Don't touch unrelated files.

## 10. Final report structure (`reports/final-report.md`)

1. Executive Summary
2. Application Overview (architecture, stack, execution model, scope)
3. Baseline Performance (and methodology)
4. Key Findings (evidence, root causes)
5. Prioritized Recommendations (task IDs + canonical paths)
6. Task Overview (ID, title, priority, status, effort, path)
7. Expected Improvements (and how they will be validated)
8. Risks and Trade-offs
9. Benchmark Results (before/after where available)
10. Implementation Roadmap (order by dependency and impact)
11. Remaining Work (pending, blocked, cancelled, with reasons and paths)
12. Conclusions and Next Actions

## 11. Final checklist

Verify before finishing:

- [ ] Project inspected enough to support findings; audit scope and limitations documented.
- [ ] Baselines recorded where measurable; gaps marked `Unknown`.
- [ ] Every claim carries an evidence label; no unsupported numbers or percentages.
- [ ] Root causes explained; every actionable item has its own task with acceptance criteria and validation.
- [ ] IDs sequential and unique; filenames follow convention; all tasks directly in `.audit/performance/tasks/`.
- [ ] No alternate task directories; no task moved, renamed, or duplicated for status changes.
- [ ] Registry matches task metadata; all references use ID + canonical path.
- [ ] Risks and trade-offs documented; secrets/PII redacted from stored artifacts.
- [ ] Report and changelog current; in Audit/Benchmark/Report modes, no application source modified.
