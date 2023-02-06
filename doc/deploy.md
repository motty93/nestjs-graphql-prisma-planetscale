## デプロイ手順
前提として `pscale`コマンド、`flyctl`コマンドが実行できるようにしておいてください。npm（yarn）が入ってないのは論外で。

[https://planetscale.com/features/cli:embed:cite]

[https://fly.io/docs/hands-on/install-flyctl/:embed:cite]

### PlanetScaleの作成

```bash
$ pscale auth login

$ pscale database create nestjs-sample --region ap-northeast

$ pscale branch create nestjs-sample dev
$ pscale branch promote nestjs-sample main

$ pscale password create nestjs-sample dev <name> # nameは識別子なのでなんでもおｋ
```
`pscale password list`でも取得できますが、`DATABASE_URL`の形式に書き換えるのだるいのでPlanetScaleのダッシュボードで確認してください。

データベース → connectで表示されます。

[f:id:rdwbocungelt5:20230131211141p:plain]

passwordがまだ作成できてない場合は `New password`を押しましょう。`DATABASE_URL`が出来上がったらコピーしておいてください。`flyctl`で使用します。

### Fly.ioの作成
```bash
$ flyctl auth login

# databaseはPlanetScaleを使用するのでNo
# Dockerfileを上書きしないように注意
# Dockerfileがあるため最後にデプロイするかどうか聞かれますがNoで（DATABASE_URLを設定してないため）
# fly.tomlは上書きしてください
$ flyctl launch

# DATABASE_URLは上でコピーしたやつ
# 後ろのパラメータ大事、絶対忘れるな
$ flyctl secrets set DATABASE_URL="mysql://~~~~~~~~~~~~~~~~~~~~~~~~~/nestjs-sample?sslaccept=strict?sslcert=/etc/ssl/certs/ca-certificates.crt"

$ flyctl deploy
```

これでデプロイ完了です。お疲れさまでした。
