.PHONY: test clean

bin/ssm-env:
	CGO_ENABLED=0 go build -o $@ .

all: bin/ssm-env bin/ssm-env-linux-aarch64 bin/ssm-env-linux-x86_64 bin/ssm-env-darwin-arm64 bin/ssm-env-darwin-amd64

bin/ssm-env-linux-aarch64: *.go
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o $@ .

bin/ssm-env-linux-x86_64: *.go
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o $@ .

bin/ssm-env-darwin-arm64: *.go
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -o $@ .

bin/ssm-env-darwin-amd64: *.go
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o $@ .

test:
	go test -race $(shell go list ./... | grep -v /vendor/)

clean:
	rm -rf bin
