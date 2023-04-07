#!/bin/sh
set -ex

go mod edit -replace github.com/dgrijalva/jwt-go=github.com/dgrijalva/jwt-go/v4@v4.0.0-preview1
go mod edit -replace github.com/gogo/protobuf=github.com/gogo/protobuf@v1.3.2
go mod tidy
go build -o ./traefik-forward-auth ./cmd/main.go
ls -l ./traefik-forward-auth
rm -f .dockerignore

# for deps scanning
go list -m all > go.list
#ls -l go.list

