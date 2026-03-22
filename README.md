# Learning Check

A REST API for managing English language tests, classroom, and students assessments. Built with Go, following clean architecture principles.

## Status

**In Development** - Phase 0: Foundation & Setup

## Tech Stack

- **Language:** Go 1.26
- **Database:** PostgreSQL
- **Containerization:** Docker
- **CI/CD:** Github Actions

## Prerequisites

- Go 1.26+
- Docker & Docker Compose
- Make

## Getting Started
```bash
# Clone the repository
git clone https://github.com/pablohenriques/learning-check-app.git
cd learning-check-app

# Build the application
make build

# Run the application
make run

# Run tests
make test
```

## Project Structure
```
├── cmd/
│   └── api/          # Application entry point
├── internal/         # Private application code
├── docs/             # Design docs and ADRs
├── Makefile          # Build automation
├── go.mod            # Go module definition
└── README.md
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
