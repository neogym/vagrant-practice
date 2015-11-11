# config.vm

## config.vm.boot_timeout

仮想マシンが起動するまでの待ち時間を設定。  
デフォルトは300秒です。

## config.vm.box

使用する仮想マシンの名前を指定。

## config.vm.box_check_update

仮想マシン起動時に、毎回最新のボックスか確認するかどうかを設定。  
最新のボックスがある場合は、ユーザに通知されます。  
デフォルトは`true`です。

## config.vm.box_download_checksum

ボックスのチェックサムを設定。
`config.vm.box_url`でURL指定してボックスを利用する際に必要な項目。

## config.vm.box_download_checksum_type

チェックサムの形式を指定。  
`md5`、`sha1`または`sha256`をサポート。

## config.vm.box_download_client_cert

ボックスをダウンロードする際に、クライアント証明書が必要な場合はそのパスを指定します。  
デフォルトでは不要。

## config.vm.box_download_ca_cert

ボックスをダウンロードする際に、CA証明書バンドルが必要な場合はそのパスを指定します。  
デフォルトではMozilla証明書バンドル。

## config.vm.box_download_insecure

`true`の場合、サーバのSSL証明書の検証をしません。  
URLがHTTPS URLの場合、デフォルトではSSL証明書の検証を行います。

## config.vm.box_download_location_trusted

`true`の場合すべてのHTTPリダイレクトは信頼できるものとして処理されます。  
デフォルトでは、最初のHTTPリクエストの証明書のみを使用するので
リダイレクト先は信頼しません。

## config.vm.box_url

仮想マシン(ボックス)のURLを直接していします。  
`config.vm.box`が設定されている場合は、この設定は不要です。  
`file://`のような形式で、ローカルファイルの指定ができます。

## config.vm.box_version

ボックスのバージョンを指定できます。  
デフォルトは`>= 0`です。
`>= 1.0, < 1.5`のように範囲を指定して設定することができます。

## config.vm.communicator

仮想マシンに接続する方式を指定できます。  
デフォルトでは`ssh`が設定されていますが、必要があれば`winrm`と指定することで  
Windowsの仮想マシンに接続することが可能です。

## config.vm.graceful_halt_timeout

`vagrant halt`を実行した際の、仮想マシンの待ち時間を設定できます。  
デフォルトは60秒です。

## config.vm.guest

仮想マシンの形式を設定できます。  
デフォルトは`:Linux`です。  
適切なディストリビューションを自動検出して、ディレクトリのマウントや  
ネットワーク設定などOS固有の設定をおこないます。

## config.vm.hostname

仮想マシンのホスト名を設定できます。  
デフォルトは`nil`で、ホスト名は設定されません。

## config.vm.network

ネットワークに関する設定ができます。  
詳細は、別途記入します。

## config.vm.post_up_message

`vagrant up`が完了した後に、表示するメッセージを設定できます。

## config.vm.provider

固有のプロバイダに関する設定ができます。  
詳細は、別途記入します。

## config.vm.provision

仮想マシン作成時に自動インストールするソフトウェアを設定できます。  
詳細は、別途記入します。

## config.vm.synced_folder

ホストマシンのディレクトリと仮想マシンのディレクトリを共有することができます。
詳細は、別途記入します。

## config.vm.usable_port_range

`Vagrant`が使用するポートの範囲を設定できます。  
デフォルトは`2200..2250`です。

以上