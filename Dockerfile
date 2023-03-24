FROM golang:alpine AS stage

COPY main.go .

RUN go build -ldflags="-s -w" main.go && rm main.go

FROM scratch

COPY --from=stage /go/main .

CMD [ "./main" ]