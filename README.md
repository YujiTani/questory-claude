# サービス名: QueStory

## サービス概要

15 分程度の短い隙間時間でも、スマホさえあればプログラミング学習できるアプリ

## このサービスへの思い・作りたい理由

アプリの試作型は既につくってしまったので、想いなどをまとめた記事が note にあります。(思いや動機に関しては、記事内の３つの動機という項目に書いてあります。)
(https://note.com/calm_borage173/n/n471630b64d15)

詳細は記事に書いてあるので、ここでは箇条書きにさせていただくと以下となります

- 過去に 365 日英語学習を継続できた「Duolingo」というアプリの仕組みをプログラミング学習にも応用できないかと考えた
- RUNTEQ に入り、たくさんの未経験者に教えているうちに、人に教えることが楽しく、好きだと気づいた
  しかしカリキュラムが進むにつれ教える時間を確保できなくなったので、自分の代わりに学習のサポートできるアプリを開発しようと思った
- RUNTEQ 生の中には、なかなか PC 前で学習する環境を整えられずに困っている人たちがいるので、スマホが使えれば学習できる環境を用意したいと考えた

## ユーザー層について

決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。

- ユーザー層は、プログラミング学習の初学者(特に RUNTEQ に入学してきた方たち)

## サービスの利用イメージ

日常生活のちょっとした隙間時間に、アプリを開いてぽちぽち学習する

例）

1. 電車に乗っている時間
2. 仕事が遅くなった日、カリキュラムを進めたいが、時間も遅いため、はやく寝ないといけない
3. 育児や、家事が片付き少しだけ時間ができたが、PC を開いて勉強するほどの時間はない

### ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかの説明

隙間時間を有効にプログラミング学習にあてることで、フルコミットでない RUNTEQ 受講生に発生しがちな学習間隔が空いてしまう問題の解消をめざす
これにより、プログラミング学習の天敵である学習内容を忘れてしまう事を軽減させ、途中離脱率をさげられる

### ユーザーの獲得について

RUNTEQ に入学してきた生徒たちに対して案内を設け、隙間時間での学習は、私が作ったアプリを使って勉強するように促していく
Qitta や Zenn で記事を書き、X を使って宣伝していく

## サービスの差別化ポイント・推しポイント

### 競合となるサービス

Progate、ドットインストール、Codecademy あたりが競合になるのではないかと思っている

- progate … 手軽にプログラミング学習ができるという点で、競合となりうるがスマホでの学習は非推奨のため、問題ないとかんがえる
- ドットインストール … スマホでも問題なく使用できるが、動画視聴という形になるため、ハンズオンできない場合、学習効率が低くなるとかんがえる、また継続的な学習意欲を掻き立てる仕組みに乏しいので、こちらがこの部分を強くすれば差別化は可能だと思っている

- Codecademy … 英語サイト、code をタイピングする必要があるので、スマホでの学習に向いていない

## 機能候補

### 使用予定の技術スタック

|                |                                                        |
| -------------- | ------------------------------------------------------ | --- |
| フロントエンド | TypeScript / React / Next.js / TailwindCSS / shadch/ui |
| バックエンド   | Ruby / Ruby on Rails / MySQL or PostgreSQL             |
| インフラ       | Cloudflare Pages                                       |
| CI/CD          | Cloudflare Pages / GitHub Actions                      |
| 認証           | OAuth 2.0 / LINE / Github                              |
| 開発環境       | Mac Apple Silicon / Cursor / Github Copilot            |     |

### 現状作ろうと思っている機能

#### バックエンド

- 認証機能(SNS 認証, LINE を優先)
- ユーザーデータの管理(CRAD、累計スコア、クリア問題数、ユーザーのレベル、連続ログイン日数)
- 問題の管理機能(CRAD)
- ユーザーからのフィードバックデータ管理

#### フロントエンド

- 問題を解く機能(下記は、問題の種類)
- SQL
- DB を確認できる機能
- SQL の用語学習
- SQL の基礎的な使い方
- SQL の組み立て練習
- 複数のテーブルを使う問題
- 現場を想定したデータ取得問題(営業成績の可視化など)

- ORM(ActiveRecord)
- ActiveRecord の用語学習
- ActiveRecord の基礎的な使い方
- リレーション系の問題
- ActiveRecord の組み立て練習
- 指定された SQL を ActiveRecord で作る問題
- 解凍後に作成した ActiveRecord を SQL に変換してみせる機能

- 累計クリア問題数を表示する機能
- 連続正答数を表示する機能
- クリアスコアを表示する機能(独自の計算式を用意する)
- SNS にクリア画面をシェアする機能
- アプリ内の問題をフィードバックしてもらえる機能
- 一定時間、問題の解答状況を保存する機能(1 ステージ、10 個の問題という単位にするので、朝少しプレイ、夜仕事おわってプレイする状況を考慮して)
- 連続ログイン日数を表示する機能
- 累計クリアスコアで、レベルが上がる機能
- ユーザー同士のスコアランキング表示機能
- 1 日のアプリプレイ回数を制限する機能
- LINE に通知する機能(連続ログイン日数など)

高度な機能

- LINE に通知する機能(連続ログイン日数など)
- 問題の自動生成機能(精度が安定するならば、LLM アプリを開発して問題はここから出力した)

### MVP リリース時に作っていたいもの

#### バックエンド

- 認証機能
- ユーザーデータの管理(スコア、クリア問題数)
- 問題の管理機能(CRAD)

#### フロントエンド

- 問題を解く機能(下記は、問題の種類)
- SQL
- DB を確認できる機能
- SQL の用語学習
- SQL の基礎的な使い方
- 累計クリア問題数を表示する機能
- 連続正答数を表示する機能
- クリアスコアを表示する機能(独自の計算式を用意する)
- SNS にクリア画面をシェアする機能
- アプリ内の問題をフィードバックしてもらえる機能

### 本リリースまでに作っていたいもの

#### バックエンド

- 認証機能(SNS 認証, LINE を優先)
- ユーザーデータの管理(スコア、クリア問題数)
- 問題の管理機能(CRAD)

#### フロントエンド

- 問題を解く機能(下記は、問題の種類)
- SQL
- DB を確認できる機能
- SQL の用語学習
- SQL の基礎的な使い方
- SQL の組み立て練習
- 複数のテーブルを使う問題
- 現場を想定したデータ取得問題(営業成績の可視化など)

- ORM(ActiveRecord)
- ActiveRecord の用語学習
- ActiveRecord の基礎的な使い方
- リレーション系の問題
- ActiveRecord の組み立て練習
- 指定された SQL を ActiveRecord で作る問題
- 解凍後に作成した ActiveRecord を SQL に変換してみせる機能

- 累計クリア問題数を表示する機能
- 連続正答数を表示する機能
- クリアスコアを表示する機能(独自の計算式を用意する)
- SNS にクリア画面をシェアする機能
- アプリ内の問題をフィードバックしてもらえる機能
- 一定時間、問題の解答状況を保存する機能(1 ステージ、10 個の問題という単位にするので、朝少しプレイ、夜仕事おわってプレイする状況を考慮して)
- 連続ログイン日数を表示する機能
- 累計クリアスコアで、レベルが上がる機能
- ユーザー同士のスコアランキング表示機能

## 機能の実装方針予定

### 問題を解く機能

- 解答データとユーザーの解答を比較して、正誤判定を行う
- ユーザーが解答する種類を増やすことで、様々なバリエーションが用意できるはず(スマホでの操作しやすさを考慮する)
- ベストは LLM アプリを開発し、問題を自動生成できるようにすること

### 問題に使用されるテーブルを確認できる機能

- shemas ファイルを読み込み、テーブル UI を作成し表示させるまたは、DB の内容を JSON 形式で表示させる

### SNS シェア機能

- 下記のようなライブラリを使って実装するつもり
  (https://github.com/nygardk/react-share?tab=readme-ov-file)

## 画面に関する設計図

FigJam で作成: https://www.figma.com/board/oLAwnKL7yg2kW3x0DnKRmn/QueStory%E7%94%A8%E3%81%AE%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%EF%BC%88%E5%85%A8%E4%BD%93%E8%A8%AD%E8%A8%88%E5%9B%B3%EF%BC%89?node-id=0%3A1&t=YbXnQPerkhS4ykTe-1

### README に記載した機能

バックエンド側(CRUR 関連は、余裕があれば管理画面もつくる)

認証

- [ ] ユーザー登録機能
- [ ] ログイン機能
- [ ] ユーザー情報更新機能(名前と画像)
- [ ] パスワード変更機能 ※必要
- [ ] メールアドレス変更機能

メイン機能

- [ ] クエスト作成機能
- [ ] クエスト編集機能
- [ ] クエスト取得機能
- [ ] クエスト削除機能
- [ ] クエスト一覧取得機能
- [ ] コース作成機能
- [ ] コース編集機能
- [ ] コース取得機能
- [ ] コース削除機能
- [ ] クエストに紐づくコース一覧取得機能
- [ ] ステージ作成機能
- [ ] ステージ編集機能
- [ ] ステージ取得機能
- [ ] ステージ削除機能
- [ ] コースに紐づくステージ一覧取得機能
- [ ] 問題作成機能
- [ ] 問題編集機能
- [ ] 問題削除機能
- [ ] 問題取得機能（不要かも）
- [ ] ステージに紐づく問題一覧取得機能
- [ ] ユーザーデータ更新機能(ステージクリア数、連続正解回数、スコア)
- [ ] ユーザーデータを取得する機能

ログインカウント関連

- [ ] ログイン日数を取得する機能
- [ ] ログイン日数を更新する機能
- [ ] 連続ログイン日数を取得する機能
- [ ] 連続ログイン日数を更新する機能
- [ ] 連続ログイン日数をリセットする機能

ランキング機能

- アクティブな全ユーザーのデータを取得する機能

マーケティング系

- [ ] ユーザーからのフィードバックを保存する機能
- [ ] SNS 投稿機能

フロントエンド

- [x] クエストを選択する機能
- [x] ステージを選択する機能
- [x] 問題に解答する機能
- [x] 次の問題を表示する機能
- [x] クリア画面を表示する機能
- [ ] 問題に使用するテーブルを表示する機能
- [ ] 一定時間、ステージのクリア状況を sessionStrage に保存する機能

### 未ログインでも閲覧または利用できるページ

以下の項目は適切に未ログインでも閲覧または利用できる画面遷移になっているか？

- [ ] トップページのみの予定

### メールアドレス・パスワード変更確認項目

直接変更できるものではなく、一旦メールなどを介して専用のページで変更する画面遷移になっているか？

- [ ] メールアドレス
- [ ] パスワード

## ER diagram

URL: https://mermaid.live/view#pako:eNqtlktrFEEQgP_K0OdN2F02-zqKNxEEb7Iw9M7U7jaZ6Rm7e5KsScCd9YUGBDEH8SBKFDWYiIoo-m_aGPMv7O55pMfEEMTLkq6u-urRVZVZR17kA-qjAQV2keAxw-GAJhwYdzY2FhY2NhyG6TKhY-70nQGS81dy_l2mn_XvbF_O38j5R5m-M7_v5Wz38Mm3o60PcrYt0y05eyVnt2T6YID-YOqDOyHjicu9iMFf2A9luiPTrzJV7BcyfSTTVM52NOx6AlyUtJh4Iikp6b5MX2uz-T1F-fHlprKRs73Dx98ONNGiVEKqQqqhnAWxQonWHS9KGD89kl87d39uv9fJaPLXCqQwyylc4HEJKfRLwmzPMO8Y-ZcKJzfMMSY0EtGCZBlZsIPth0fPt07mZAxz0mrE_IySa1v2-u5EWd0RgD_E3nKJKAQu4TzJk9OyC0qmcAe3Xx7cf1r0zbOSbrRluqtDTz_J-VuTgOWteMb1AXWcIRkTKhziO1cu6bM3wcxJEuLrwwpm5kxxCPYZQkyCioB6bBoL8N0Yc67zs29Vj4Aob1wRLQM9454DFS4WVY0QwqEqkscAazf6elOnUs7aqdnogylulo8-aoPibzNKOejEgJ0XKCKBA9uyuPBUO4CXCLICrrpg4Km0KF9VtS9VkjAJcKYRAGauaUelnVBR6Giyai43C9zEmk_Qvz-gD9xjJNYdq8U8xEFgCiJUdXMn5Xif6mYYRMNiA7g-FrgIVz0eEVO36j8T5uBidP9T-IaZj_H5kTGDEVmzJdEKsBUCq0UiPhmNiJcEOu5jLYHZGMTxE4dxAEK9GOZQCEdqOFSL2iK7rser4vzRquoFlQpkfWRLRjjg4J6Ue8rzOGJTO7qEVcd5LQ4wxVY5s-11anx_exM-pRGdhmVrE-rDmj1bx_vtTK4PQkXIKy8jJllOWcl191jzV9TTiIy7Pxfnmf6MTm6IaigEppabr_6_G6sBUr5VokgvXx9GWPWD3qGbShUnIro6pR7qC5ZADSWxmgPIPwkKIfhEROxy9slgvhxqKMYU9dfRGuo3lxY77V6jVe-1u_VGs92qoSnqNzqLS81Wfanb7PS6vU692dmsoRtRpKD1xV67sdTqNNvdVqPR7HZ6BnfNXGqPm78BXceQIw

# プロジェクトセットアップと実行ガイド

## 1. 事前準備

- Docker (ローカル環境構築に必要)

## 2. 基本的な操作

### コンテナの起動と停止

```bash
# 開発環境（デフォルト）
bash run.sh up -d
# 本番環境
bash run.sh prod up -d
# 停止
bash run.sh down
```

### コンテナのビルド

```bash
bash run.sh build [<サービス名>]
```

主要なサービス: `api` (バックエンド), `web` (フロントエンド), `db` (データベース), `nginx` (リバースプロキシ)

よく使用するオプション:

- `--buildkit-version <num>`: ビルドキットのバージョン指定
- `--progress=plain`: 詳細な進捗表示
- `--no-cache`: キャッシュを使用しないビルド

## 3. 開発フロー

### イメージの更新とデプロイ

1. コードを変更し、イメージを再ビルド

   ```bash
   bash run.sh build <サービス名>
   ```

2. 環境変数ファイル（`.env.dev`や`.env.prod`）のタグを更新

   ```
   API_TAG=v1.0.2
   ```

3. 新しいタグを付与

   ```bash
   docker tag ${API_IMAGE_NAME}:latest ${DOCKER_REGISTRY}/${API_IMAGE_NAME}:${API_TAG}
   ```

4. Docker Hub にプッシュ

   ```bash
   docker push ${DOCKER_REGISTRY}/${API_IMAGE_NAME}:${API_TAG}
   ```

5. 更新の確認と適用
   ```bash
   bash run.sh up -d --no-deps <サービス名>
   bash run.sh logs <サービス名>
   ```

## 4. トラブルシューティング

- Docker 動作確認
- 環境変数設定確認
- ポート競合確認
- ログ確認: `bash run.sh logs <コンテナ名>`

## 5. ベストプラクティス

- セマンティックバージョニングの使用
- 環境変数ファイルによる一貫した管理
- 定期的なイメージとコンテナのクリーンアップ
- 重要な更新前の安定版イメージバックアップ
- ステージング環境でのテスト実施

詳細な使用方法や高度な設定については、プロジェクトの詳細ドキュメントを参照してください。
