# ベースイメージとして軽量なNginxアルパインイメージを使用
FROM nginx:alpine

# タイムゾーンを設定（必要に応じて変更してください）
ENV TZ=Asia/Tokyo

# 必要なパッケージをインストール（例：タイムゾーンデータ）
RUN apk add --no-cache tzdata

# Nginxの設定ファイルをコンテナにコピー
COPY nginx.conf /etc/nginx/nginx.conf

# その他の設定ファイルがある場合はここでコピー
# 例: COPY conf.d/ /etc/nginx/conf.d/

# ヘルスチェック用の空ファイルを作成
RUN touch /usr/share/nginx/html/healthz

# Nginxのデフォルトコマンドを使用してNginxを起動
CMD ["nginx", "-g", "daemon off;"]
