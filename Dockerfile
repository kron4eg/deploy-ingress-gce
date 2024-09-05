
FROM docker.io/alpine:3.19


COPY ./bin/amd64/404-server \
     ./bin/amd64/404-server-with-metrics \
     ./bin/amd64/check-gke-ingress \
     ./bin/amd64/e2e-test \
     ./bin/amd64/echo \
     ./bin/amd64/fuzzer \
     ./bin/amd64/workload-controller \
     ./bin/amd64/workload-daemon \
     ./bin/amd64/glbc \
     /usr/local/bin/

USER nobody