FROM mysql:8.2.0

# 初期セットアップで利用するmy.cnfをイメージへコピー
COPY my.cnf /etc/mysql/conf.d

# 初期セットアップで実行したいスクリプトをイメージへコピー
# docker-entrypoint-initdb.dに入れておくとmysqlの初期化スクリプトとして実行される
COPY init/01-create-user.sql /docker-entrypoint-initdb.d