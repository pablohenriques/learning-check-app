.PHONY: build run test lint clean

build:
	go build -o bin/api ./cmd/api

run:
	go run ./cmd/api

test:
	go test ./...

lint:
	golangci-lint run ./...

clean:
	rm -rf bin/
