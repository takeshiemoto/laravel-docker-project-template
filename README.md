# Laravel docker project template

このリポジトリはDocker上でLaravelを動かすための雛形プロジェクトです。

## 環境

- PHP: 8.2
- MySQL: latest
- Redis: latest

## 特徴

- テスト用データベース `laravel_testing` が設定済み
- 静的解析: PHPStan
- フォーマッター: php-cs-fixer
- Model型定義: laravel-ide-helper

## 使い方

このリポジトリをフォークして新しいプロジェクトを作成してください。

基本的なコマンド：

```
# 初期化
make init

# 起動
make up

# テスト実行
make test

# 終了
make down
```

詳細な使用方法については、Makefileを参照してください。

## 注意事項

このREADMEは基本的な情報のみを含んでいます。プロジェクトの詳細な設定や高度な使用方法については、ソースコードやMakefileを確認してください。
