#!/bin/bash
#コンテナ起動用のスクリプト

# デフォルトは開発環境
ENV=${1:-dev}

# 環境ファイルの存在確認
if [ ! -f ".env.$ENV" ]; then
    echo "Error: .env.$ENV file not found"
    exit 1
fi

# Docker Composeコマンドの実行
docker-compose --env-file .env.$ENV ${@:2}
