build:
	go build -o bin/api ./cmd/api

run:

test:
	go test ./...

lint:
	golangci-lint run
