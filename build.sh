#!/bin/sh
set -ex

go mod edit -replace github.com/dgrijalva/jwt-go=github.com/dgrijalva/jwt-go/v4@v4.0.0-preview1
go mod edit -replace github.com/gogo/protobuf=github.com/gogo/protobuf@v1.3.2
go mod edit -replace github.com/miekg/dns=github.com/miekg/dns@v1.1.53
go mod edit -replace golang.org/x/text=golang.org/x/text@v0.9.0
go mod edit -replace golang.org/x/net=golang.org/x/net@v0.9.0
go mod edit -replace golang.org/grpc=golang.org/grpc@v1.56.0
go mod tidy
go build -o ./traefik-forward-auth ./cmd/main.go
ls -l ./traefik-forward-auth
rm -f .dockerignore

# for deps scanning
go list -m all > go.list
#ls -l go.list

# whitelist sonatype-2021-4899: don't use gorilla sessions
# https://github.com/gorilla/sessions/issues/248
echo sonatype-2021-4899 > .nancy-ignore

