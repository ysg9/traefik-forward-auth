#!/bin/sh
set -ex

go mod tidy
go build -o ./traefik-forward-auth ./cmd/main.go
ls -l ./traefik-forward-auth
rm -f .dockerignore

# for deps scanning
go list -m all > go.list
ls -l go.list

