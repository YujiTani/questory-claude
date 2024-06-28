# ベースイメージとして Ruby の公式イメージを使用
FROM ruby:3.1.5

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y nodejs default-mysql-client vim

# アプリケーションディレクトリの作成
WORKDIR /app

# Bundler のインストール
RUN gem install bundler

# Gemfile と Gemfile.lock をコピー
COPY Gemfile Gemfile.lock ./

# gem をインストール
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . .

# コンテナ起動時に実行するスクリプトをコピー
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Rails サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]

# コンテナがリッスンするポート
EXPOSE 3000
