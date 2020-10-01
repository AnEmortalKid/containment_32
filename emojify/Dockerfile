FROM ubuntu:18.04

ENV CC clang-8
ENV CXX clang++-8
ENV DEBIAN_FRONTEND=nontinteractive
ENV PYTHONIOENCODING utf8

RUN \
  apt-get update \
  && apt-get install -y \
    gnupg \
    wget \
  && echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main" >> /etc/apt/sources.list \
  && echo "deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main" >> /etc/apt/sources.list \
  && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - \
  && apt-get update \
  && apt-get install -y \
    clang-8 \
    cmake \
    gnupg \
    libclang1-8 \
    libclang-8-dev \
    libclang-common-8-dev \
    libfuzzer-8-dev\
    libllvm8 \
    libncurses-dev \
    libz-dev \
    llvm-8 \
    llvm-8-dev \
    llvm-runtime \
    ninja-build \
    python3 \
    rsync \
    wget \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /build

RUN wget https://github.com/emojicode/emojicode/releases/download/v1.0-beta.2/Emojicode-1.0-beta.2-Linux-x86_64.tar.gz -O emojicode.tar.gz \
&& tar -xzf emojicode.tar.gz && rm emojicode.tar.gz \
&& cd Emojicode-1.0-beta.2-Linux-x86_64 && echo y | ./install.sh \
&& cd .. && rm -r Emojicode-1.0-beta.2-Linux-x86_64

COPY emojify.🍇 .
RUN emojicodec emojify.🍇
ENTRYPOINT ["./emojify"]