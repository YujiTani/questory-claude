# ベースイメージとして Ruby 3.1.5 を使用
# AS builder でこのステージに名前を付け、後で参照できるようにする
FROM ruby:3.1.5 AS builder

# 必要なパッケージをインストール
# build-essential: debine用のコンパイルツール群
# default-libmysqlclient-dev: MySQLクライアントライブラリ
# --no-install-recommends: 推奨パッケージをインストールしないことでイメージサイズを削減
# rm -rf /var/lib/apt/lists/*: パッケージリストを削除してイメージサイズを削減
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

# --jobs 4: 並列インストールによる高速化
# --retry 3: ネットワーク問題に対する耐性向上
# --without development test: 開発環境とテスト環境の gem を除外
RUN gem install bundler && \
    bundle install --jobs 4 --retry 3 --without development test

COPY . .

# 実行用の軽量イメージを作成
FROM ruby:3.1.5-slim

# 実行に必要な最小限のパッケージをインストール
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]

# 注意点:
# - 本番環境では適切な環境変数（DATABASE_URL, SECRET_KEY_BASE など）を設定すること
# - セキュリティのため、実行時は非 root ユーザーを使用することを検討
# - 必要に応じて healthcheck を追加することを検討