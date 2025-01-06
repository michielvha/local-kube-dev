#!/bin/bash

curl -L -O https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz

cat << 'EOF' | sudo tee -a ~/.zshrc
# system-wide Go install
export PATH=$PATH:/usr/local/go/bin
EOF

# vulnerability scanner
go install golang.org/x/vuln/cmd/govulncheck@latest


# set PATH so it includes GOPATH/bin if it exists
# if [ -x "$(command -v go)" ] && [ -d "$(go env GOPATH)/bin" ]; then
#    PATH="$(go env GOPATH)/bin:\$PATH"
# fi