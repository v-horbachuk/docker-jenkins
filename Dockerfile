FROM alpine
RUN apk add -U curl
CMD ["curl", "google.com"]
