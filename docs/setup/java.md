# setup_java.sh ドキュメント

## 概要
`setup_java.sh` は Java Development Kit (JDK) をダウンロードし、インストールするためのシェルスクリプトです。スクリプトは指定されたバージョンの JDK をダウンロードし、ユーザーのホームディレクトリ内の `server/java/` にインストールします。また、環境変数 `JAVA_HOME` と `PATH` を設定し、Java コマンドを利用可能にします。

## 使い方
1. スクリプトに実行権限を与えます。
    ```bash
    chmod +x setup_java.sh
    ```

2. スクリプトを実行します。
    ```bash
    ./setup_java.sh
    ```

## スクリプトの内容
- **変数の設定**: JDK のバージョンとダウンロード URL、インストールディレクトリのパスを設定します。
- **ダウンロードと展開**: `wget` を使用して JDK をダウンロードし、`tar` コマンドで展開します。
- **環境変数の設定**: `.bashrc` ファイルに `JAVA_HOME` と `PATH` の設定を追加します。
- **確認メッセージの表示**: インストールが完了したことをユーザーに通知します。成功メッセージは緑色で表示されます。

## 注意点
- このスクリプトはユーザー固有のインストールを行います。システム全体に影響を与えることはありません。
- スクリプトを実行した後、変更を反映させるために新しいターミナルウィンドウを開くか、
  ~~~bash
  source ~/.bashrc
  ~~~
   を実行してください。

## エラーハンドリング
スクリプト内でエラーが発生した場合、エラーメッセージは赤色で表示され、スクリプトは即座に終了します。これにより、ユーザーは問題が発生したことを容易に認識できます。