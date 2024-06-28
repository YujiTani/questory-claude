-- Rails用ユーザーの作成（既に存在する場合は無視）
CREATE USER IF NOT EXISTS 'rails_user'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- データベースの作成（既に存在する場合は無視）
CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}`;

-- Rails用ユーザーに必要な権限を付与
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, REFERENCES ON `${MYSQL_DATABASE}`.* TO 'rails_user'@'%';

FLUSH PRIVILEGES;
