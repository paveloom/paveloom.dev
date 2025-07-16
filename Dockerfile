FROM docker.io/nginx:stable-alpine-slim AS builder

WORKDIR /build

RUN apk --no-cache add minify zola

RUN --mount=type=bind,source=.,target=src \
    zola -r src build -o output; \
    minify -rav -o . output

FROM docker.io/nginx:stable-alpine-slim

LABEL org.opencontainers.image.source=https://github.com/paveloom/paveloom.dev

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /build/output /usr/share/nginx/html
