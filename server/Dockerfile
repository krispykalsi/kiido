# syntax=docker/dockerfile:1.2

FROM golang:1.19-alpine

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN go build -o bin ./cmd/kiido-server

ARG PORT=8000
ENV KIIDO_PORT=${PORT}

EXPOSE ${PORT}

CMD [ "bin/kiido-server" ]
