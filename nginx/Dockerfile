# ベースイメージとして軽量なNginxアルパインイメージを使用
FROM nginx:alpine

# タイムゾーンを設定（必要に応じて変更してください）
ENV TZ=Asia/Tokyo

# 必要なパッケージをインストール
RUN apk add --no-cache tzdata openssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY /error_pages/ /var/www/html/error_pages/

# SSL証明書とキーを生成
RUN mkdir -p /etc/nginx/ssl && \
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx-selfsigned.key \
  -out /etc/nginx/ssl/nginx-selfsigned.crt \
  -subj "/C=JP/ST=Tokyo/L=Tokyo/O=Example Inc./OU=IT Department/CN=localhost"

# Nginxのデフォルトコマンドを使用してNginxを起動
CMD ["nginx", "-g", "daemon off;"]
