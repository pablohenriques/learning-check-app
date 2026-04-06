# LearningCheck — Learning Path & Project Tracker

## Objectives

Build a production-ready REST API in Go (LearningCheck -
Test Engine MVP) following modern software engineering
practices, covering the full development cycle: design,
development, testing, security, infrastructure, CI/CD,
deploy, and observability.

### Why this project exists
- Learn Go by building a real product
- Practice modern engineering (Clean Architecture, CI/CD,
  Docker, K8s, observability)
- Build a portfolio project for international interviews
- Think like a Staff Engineer: trade-offs, scalability,
  resilience
- Future: KMP mobile client consuming this API

### Methodology
- **Mentor model**: Staff Engineer → Engineer (concept →
  context → decision → implementation → review)
- **Assessment**: Concept Checks (before modules), Design
  Reviews (after decisions), Milestone Demos (end of phases)
- **Rule**: No AI writing code — AI assists with design,
  review, and concepts. Implementation is manual.

---

## Learning Tracks

### Phase 0: Foundation & Setup

| Code   | Track | Topic                      | Status |
|--------|-------|----------------------------|--------|
| PM-01  | PM    | Project Setup              | ✅ Done |
| PM-02  | PM    | Product Discovery          | ✅ Done |
| DEV-01 | DEV   | Go Project Structure       | ✅ Done |
| DEV-02 | DEV   | Tooling & DX               | 🔲 Todo |
| NET-01 | NET   | Como a internet funciona   | 🔲 Todo |

### Phase 1: Design & Architecture

| Code   | Track | Topic                      | Status      |
|--------|-------|----------------------------|-------------|
| PM-03  | PM    | Design Doc / RFC           | 🟡 In Progress |
| PM-04  | PM    | Backlog & GitHub Projects  | 🔲 Todo     |
| DEV-03 | DEV   | Domain Modeling            | 🟡 In Progress |
| DEV-04 | DEV   | API Design (REST + OpenAPI)| 🟡 In Progress |
| DEV-05 | DEV   | Database Design            | 🔲 Todo     |
| NET-02 | NET   | HTTP Deep Dive             | 🔲 Todo     |
| NET-03 | NET   | Portas, Sockets e Listeners| 🔲 Todo     |

### Phase 2: Core Development

| Code   | Track | Topic                      | Status |
|--------|-------|----------------------------|--------|
| PM-05  | PM    | Sprint Planning            | 🔲 Todo |
| PM-06  | PM    | ADRs                       | 🔲 Todo |
| DEV-06 | DEV   | Auth: JWT + RBAC           | 🔲 Todo |
| DEV-07 | DEV   | User Module (CRUD)         | 🔲 Todo |
| DEV-08 | DEV   | Classroom & Test Modules   | 🔲 Todo |
| DEV-09 | DEV   | Testing (Unit + Integration)| 🔲 Todo |
| NET-04 | NET   | TLS / HTTPS                | 🔲 Todo |

### Phase 3: Resilience & Patterns

| Code   | Track | Topic                          | Status |
|--------|-------|--------------------------------|--------|
| PM-07  | PM    | Risk Management                | 🔲 Todo |
| DEV-10 | DEV   | Error Handling & Logging       | 🔲 Todo |
| DEV-11 | DEV   | Async Processing               | 🔲 Todo |
| DEV-12 | DEV   | Graceful Shutdown & Health Checks | 🔲 Todo |
| NET-05 | NET   | Timeouts, Retries & Circuit Breakers | 🔲 Todo |
| NET-06 | NET   | DNS na prática                 | 🔲 Todo |

### Phase 4: Infrastructure

| Code   | Track | Topic                          | Status |
|--------|-------|--------------------------------|--------|
| PM-08  | PM    | Release Planning               | 🔲 Todo |
| DEV-13 | DEV   | Docker                         | 🔲 Todo |
| DEV-14 | DEV   | Kubernetes                     | 🔲 Todo |
| DEV-15 | DEV   | Infrastructure as Code         | 🔲 Todo |
| NET-07 | NET   | Networking no Docker & K8s     | 🔲 Todo |
| NET-08 | NET   | Reverse Proxy & Load Balancing | 🔲 Todo |

### Phase 5: Security & Quality

| Code   | Track | Topic                          | Status |
|--------|-------|--------------------------------|--------|
| PM-09  | PM    | Quality Gates                  | 🔲 Todo |
| DEV-16 | DEV   | Security Hardening             | 🔲 Todo |
| DEV-17 | DEV   | E2E Testing                    | 🔲 Todo |
| NET-09 | NET   | Firewalls & Network Policies   | 🔲 Todo |

### Phase 6: CI/CD & Deploy

| Code   | Track | Topic                          | Status |
|--------|-------|--------------------------------|--------|
| PM-10  | PM    | Deployment Strategy            | 🔲 Todo |
| DEV-18 | DEV   | GitHub Actions CI/CD           | 🔲 Todo |
| DEV-19 | DEV   | Deploy to Cloud                | 🔲 Todo |
| NET-10 | NET   | Cloud Networking Basics        | 🔲 Todo |
| NET-11 | NET   | CDN e Edge                     | 🔲 Todo |

### Phase 7: Observability & Operations

| Code   | Track | Topic                          | Status |
|--------|-------|--------------------------------|--------|
| PM-11  | PM    | SLAs & Incident Response       | 🔲 Todo |
| PM-12  | PM    | Retrospective & Metrics        | 🔲 Todo |
| DEV-20 | DEV   | Observability Stack            | 🔲 Todo |
| NET-12 | NET   | Latência & Troubleshooting     | 🔲 Todo |

---

## Checkpoint Log

### 2025-04-06 — Phase 0 + Phase 1 Start

**What was done:**
- Repository created with professional structure
  (cmd/api/, internal/, docs/, pkg/, .github/workflows/)
- Makefile with build, run, test, lint, clean targets
- .editorconfig configured (Go tabs, UTF-8, LF)
- README with status, tech stack, setup instructions
- MIT License

**Product Discovery (PM-02) completed:**
- Problem Statement: English learning is fragmented;
  students lack affordable test practice; centers lack
  data automation
- 3 Personas defined: Administrator, Teacher, Student
- 11 User Stories across 5 epics
- Scope decision: Test Engine MVP (Classroom Management
  is post-MVP)
- Two test flows: Assigned Test (teacher → student) and
  Practice Test (system → student via Question Bank)
- AI integration planned for Camada 2 (post-MVP); MVP
  uses manual Question Bank

**Design Doc (PM-03) in progress:**
- Section 1 (Context & Problem): ✅ Approved
- Section 2 (Goals & Non-Goals): ✅ Approved
- Section 3 (Proposed Solution): 🟡 Overview, Domain
  Entities, API defined — pending final review
- Section 4 (Alternatives Considered): 🔲 In progress
- Section 5 (Risks & Open Questions): 🔲 Pending

**Key decisions:**
- Go 1.26 (stable, released Feb 2026)
- PostgreSQL (relational — strong entity relationships)
- JWT + RBAC (3 roles: admin, teacher, student)
- Clean Architecture (handler → service → repository)
- REST API (not GraphQL — simpler, better caching,
  known consumers)
- Monolith (single developer — microservices add
  unnecessary complexity)
- Backend only — future KMP mobile client

**Corrections applied:**
- Removed .idea/ from tracking (IDE-specific files)
- Removed .PHONY file (directive belongs inside Makefile)
- Fixed .PHONY typo in Makefile (was .PYONY)
- Commits improved from single bulk commit to atomic commits

**Concept Check results:**
- Repo profissional vs amador: 6/10 → understood after
  PM-01
- Go experience: 7/10 — knows layered architecture,
  aware of Hexagonal
- Network fundamentals: 5/10 → to be reinforced in NET-01
- User Story vs Technical Task: 7/10 — understood JWT is
  a task, not a story
- MVP prioritization: 8/10 — correctly identified test
  creation + execution + results as minimum viable flow

---

## Open Items

- [ ] Fix Makefile: `.PYONY` → `.PHONY`, `lin` → `lint`
- [ ] Fix API paths: pluralize all resources consistently
  (`/tests`, `/classrooms`)
- [ ] Complete Design Doc Section 4 (Alternatives Considered)
- [ ] Complete Design Doc Section 5 (Risks & Open Questions)
- [ ] DEV-02 (Tooling): install golangci-lint, configure
  pre-commit hooks
- [ ] NET-01: deep dive on TCP/IP and HTTP — scheduled for
  Phase 1
