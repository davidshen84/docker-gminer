ARG cudaVersion=11.6.2
ARG ubuntuVersion=20.04

FROM alpine:3 as builder

WORKDIR /gminer

ARG gminerVersion=3.03
ARG gminerFilename=gminer_3_03_linux64.tar.xz

ADD https://github.com/develsoftware/GMinerRelease/releases/download/${gminerVersion}/${gminerFilename} ${gminerFilename}
RUN tar xaf ${gminerFilename}


FROM nvidia/cuda:${cudaVersion}-runtime-ubuntu${ubuntuVersion}

RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-ml.so

WORKDIR /gminer
COPY --from=builder /gminer/miner .

ENTRYPOINT ["./miner", "--config", "config.txt"]
