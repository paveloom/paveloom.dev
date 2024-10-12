FROM docker.io/nginx:1.27.2-alpine-slim AS builder

WORKDIR /build

RUN apk --no-cache add minify=2.20.37-r0

RUN --mount=type=bind,source=src,target=src \
	cp -r src output && \
	minify -rav -o . output

FROM docker.io/nginx:1.27.2-alpine-slim

COPY --from=builder /build/output /usr/share/nginx/html
