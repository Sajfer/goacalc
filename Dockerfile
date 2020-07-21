from golang as builder

WORKDIR /work/
RUN env GO111MODULE=on go get -u goa.design/goa/v3/...@v3
COPY . /work/
RUN cd cmd/calc && go build

from ubuntu:latest
WORKDIR /app/
COPY --from=builder /work/cmd/calc/calc .
ENTRYPOINT ["/app/calc"]