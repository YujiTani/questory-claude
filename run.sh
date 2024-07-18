#!/bin/bash
# コンテナ起動用のスクリプト

# デフォルト値の設定
ENV="dev"
USE_BUILDKIT="no"
BUILDKIT_VERSION="1"

# 引数の解析
while [[ $# -gt 0 ]]; do
  case $1 in
    dev|prod)
      ENV="$1"
      shift
      ;;
    --buildkit-version)
      BUILDKIT_VERSION="$2"
      shift 2
      ;;
    *)
      break
      ;;
  esac
done

# 環境ファイルの存在確認
if [ ! -f ".env.$ENV" ]; then
    echo "Error: .env.$ENV file not found"
    exit 1
fi

# buildコマンドの場合のみBuildKitを有効化
if [[ "$1" == "build" ]]; then
    USE_BUILDKIT="yes"
fi

# ビルドキットの設定
if [ "$USE_BUILDKIT" = "yes" ]; then
    export DOCKER_BUILDKIT=$BUILDKIT_VERSION
else
    unset DOCKER_BUILDKIT
fi

# Docker Composeコマンドの実行
docker-compose --env-file .env.$ENV "$@"

# 使用方法の表示
usage() {
    echo "Usage: $0 [env] [options] [docker-compose commands]"
    echo "  env: dev or prod (default: dev)"
    echo "Options:"
    echo "  --buildkit-version <version>: Set BuildKit version for build command (default: 1)"
    echo "Example: $0 prod build --no-cache api"
    echo "         $0 dev --buildkit-version 0 build"
    echo "         $0 dev up -d"
}

# 引数がない場合は使用方法を表示
if [ $# -eq 0 ]; then
    usage
    exit 1
fi