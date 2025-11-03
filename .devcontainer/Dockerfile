FROM mcr.microsoft.com/devcontainers/base:ubuntu

ARG TARGETARCH

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg tar \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/install

RUN mkdir -p /workspaces/.kube \
    && chmod 777 /workspaces/.kube
RUN mkdir -p /workspaces/.temporal \
    && chmod 777 /workspaces/.temporal

# Install Go
ARG GO_VERSION=1.23.3
RUN curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-${TARGETARCH}.tar.gz" \
    | tar -xz -C /usr/local \
    && ln -s /usr/local/go/bin/go /usr/local/bin/go \
    && ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt

ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV PATH="${GOPATH}/bin:${PATH}"

RUN curl -fsSL -o /usr/local/bin/kubectl \
      "https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/${TARGETARCH}/kubectl" \
 && chmod +x /usr/local/bin/kubectl

# Install k3d
RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh

RUN curl -fsSL "https://temporal.download/cli/archive/latest?platform=linux&arch=${TARGETARCH}" \
    | tar -xz -C /usr/local/bin temporal \
    && chmod +x /usr/local/bin/temporal