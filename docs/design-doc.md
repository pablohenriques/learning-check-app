# Design Doc: LearningCheck - Test Engine MVP

## 1. Context and Problem
The learning of English is fragmented, exists many options, many resources, but for students can be a nightmare, what could be the best option? 
    Another problem is the proficiency test, multiple tests and a lof of money to buy one or more tests. The student does not have a progress tracking.
English centers have the best workers, but the summary of data is not automated. For exemple, assessments, feebacks, messages, 
    to process all these things it is necessary a lot of manual job. Dashboards, graphics exists, but create panels it is a hard work. 
    For the teachers is the same bureaucracy, extra meterials, tips, exercises, homeowrk, all need to send email, a lot of hours lost read large emails list.
The LearningCheck solve these problems, the unification the process for all, students and teachers have one space for own 
    activities and the administrator of centers an autometed process to take important decision. One space, autometed process.

## 2. Goals & Non-Goals
### Goals
- Secure multi-roles access: Admins, Students and Teacher authenticate and access role-specific functionality 
- Assigned Test: Teachers can create test from templates  
- Practice Tests: Students can practice the test from the Question Bank at any time
- Question Bank: Administrator can manage questions
- Results & Feedback: students can see the history of tests and feedbacks
- Teacher Monitoring: Teachers view student results to identify knowledge gaps
- Admin Dashboard: Administrators access class averages and completion rates for data-driven decisions

### Non-Goals
- AI-generated questions (MVP uses manually curated Question Bank; architecture prepared for future AI integration)
- Frontend application (backend REST API only, documented via OpenAPI/Swagger)
- Infrastructure monitoring (no Prometheus/Grafana in MVP, planned for Phase 7)
- Classroom management (homework, links, uploads, teacher-student communication — planned for post-MVP)
- Real-time features (live test sessions, WebSocket notifications)

## 3. Proposed Solution
### Overview
- LearningCheck is a REST API monolithic application built 
    with Go, using Clean Architecture (handler → service → repository) to 
    ensure separation of concerns and testability.
- Data is stored in PostgreSQL with versioned migrations.
    Authentication uses JWT tokens with RBAC supporting three
    roles: admin, teacher, and student.
    
- The system supports two test flows:
      **Assigned Tests**: created by teachers from templates
        (IELTS, Cambridge) or custom format, assigned to a
        classroom with a deadline
      **Practice Tests**: generated from a Question Bank
          curated by administrators, available to students at
          any time for self-paced preparation
    
- The Question Bank architecture is designed to support
      future AI-generated content (post-MVP) without changes to the core data model.

### Domain Entities
- User (id, name, email, password_hash, role, created_at)
    - role: admin | teacher | student

- Classroom (id, name, description, teacher_id, created_at)
    - has many Students (via enrollment)
    - has many Tests

- TestTemplate (id, name, exam_format, skill, num_questions, time_limit_minutes)
    - ex: "IELTS Academic Reading" → reading, 40 questions,
      60 min

- Question (id, content, type, options, correct_answer, skill, exam_format, difficulty, created_by)
    - type: multiple_choice | fill_in | true_false | essay

- Test (id, title, type, template_id, classroom_id, time_limit, deadline, created_by, created_at)
    - type: assigned | practice
    - has many Questions (via test_questions join table)

- TestAttempt (id, student_id, test_id, score, started_at, finished_at, status)
    - status: in_progress | completed | expired
    - has many Answers

- Answer (id, attempt_id, question_id, student_answer, is_correct)

### API Overview
- Login
  - POST /api/v1/auth/login            -> autenticação de usuário
  - POST /api/v1/auth/logoff           -> encerramento de autenticação do usuário

- User
  - POST    /api/v1/users              -> cria um usuário
  - GET     /api/v1/users              -> lista todos usuários
  - GET     /api/v1/users/:id          -> retorna apenas um usuário
  - PUT     /api/v1/users/:id          -> atualiza dados de um usuário
  - DELETE  /api/v1/users/:id           -> delete um usuário

- Test
  - POST    /api/v1/tests              -> cria um teste
  - GET     /api/v1/tests               -> lista todos testes
  - GET     /api/v1/tests/:id           -> retorna apenas um teste
  - PUT     /api/v1/tests/:id           -> atualiza dados de um teste
  - DELETE  /api/v1/tests/:id           -> delete um teste

- Classroom
  - POST    /api/v1/classrooms          -> cria um sala de aula
  - GET     /api/v1/classrooms           -> lista todos sala de aula         
  - GET     /api/v1/classrooms/:id       -> retorna apenas uma sala de aula
  - PUT     /api/v1/classrooms/:id       -> atualiza dados de uma sala de aula
  - DELETE  /api/v1/classrooms/:id       -> delete uma sala de aula

- Practice Test
    - POST /api/v1/practice-tests/generate  → gera um teste do Question Bank
    - GET /api/v1/practice-tests/:id        → busca teste gerado

- Test Attempts (core do produto)
    - POST /api/v1/tests/:id/attempts       → aluno inicia um teste
    - PUT /api/v1/attempts/:id/submit       → aluno submete respostas
    - GET /api/v1/attempts/:id/results      → aluno vê resultado

- Question Bank
    - POST /api/v1/questions                → admin adiciona questão
    - GET /api/v1/questions                 → lista questões (com filtros)

- History / Dashboard
    - GET /api/v1/students/:id/history      → histórico do aluno
    - GET /api/v1/classrooms/:id/results    → resultados da turma
    - GET /api/v1/dashboard/overview        → dados do admin

## 4. Alternatives Considered
- Golang x Python: 
    Python has an easy syntax and offers a great support for IA and connections with a lot of tools. 
    Golang has a great ecosystem and has a native execution

- Why Go: Safe language (strong typing), prepared for concurrency and parallelism
- PostgreSQL: Safe place for data, the context of data
- Swagger: Pattern for documentations
- GitHub: Easy configuration for system deploy

## 5. Risks & Open Questions
- System does not support many users
- When use IA
- Stackoverflow the time project or bugdets
