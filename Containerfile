# UBI9 systemdベースイメージ（今回はsystemdは使わない）
FROM registry.access.redhat.com/ubi9/ubi-init

# ロケールなど最低限
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# C++開発に必要な基本ツールをインストール
# - gcc/g++: コンパイラ
# - make, cmake: ビルドツール
# - git: 取得/管理
# - gdb: デバッガ
# - pkgconf-pkg-config: pkg-config
# - which: 補助
RUN microdnf -y update \
    && microdnf -y install \
       gcc gcc-c++ make cmake git gdb pkgconf-pkg-config which \
    && microdnf clean all

# 開発用ユーザーと作業ディレクトリ
RUN useradd -m dev && mkdir -p /work && chown -R dev:dev /work
USER dev
WORKDIR /work

# 例: 必要ならここでソースをコピーしてビルド
# COPY . /work
# RUN cmake -S . -B build && cmake --build build -j

# 対話シェルをデフォルトに
CMD ["/bin/bash"]
