FROM golang:1.18 as build

WORKDIR /go/src

COPY go.* ./
RUN go mod download

COPY . ./
RUN go build -o /app

FROM gcr.io/distroless/base:debug
COPY --from=build /app /app
ENTRYPOINT ["/app"]
