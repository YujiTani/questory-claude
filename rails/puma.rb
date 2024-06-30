# 環境変数から設定を読み込むか、デフォルト値を使用
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# アプリケーションのディレクトリを指定
app_dir = File.expand_path("../..", __FILE__)
directory app_dir

# 環境を指定（デフォルトは "production"）
environment ENV.fetch("RAILS_ENV") { "production" }

# ポートを指定（デフォルトは 3000）
port ENV.fetch("PORT") { 3000 }

# アプリケーションを事前に読み込み
preload_app!
