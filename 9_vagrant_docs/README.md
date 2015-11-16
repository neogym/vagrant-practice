# Vagrantfile

## config.vm

### config.vm.boot_timeout

仮想マシンが起動するまでの待ち時間を設定。  
デフォルトは300秒です。

### config.vm.box

使用する仮想マシンの名前を指定。

### config.vm.box_check_update

仮想マシン起動時に、毎回最新のボックスか確認するかどうかを設定。  
最新のボックスがある場合は、ユーザに通知されます。  
デフォルトは`true`です。

### config.vm.box_download_checksum

ボックスのチェックサムを設定。
`config.vm.box_url`でURL指定してボックスを利用する際に必要な項目。

### config.vm.box_download_checksum_type

チェックサムの形式を指定。  
`md5`、`sha1`または`sha256`をサポート。

### config.vm.box_download_client_cert

ボックスをダウンロードする際に、クライアント証明書が必要な場合はそのパスを指定します。  
デフォルトでは不要。

### config.vm.box_download_ca_cert

ボックスをダウンロードする際に、CA証明書バンドルが必要な場合はそのパスを指定します。  
デフォルトではMozilla証明書バンドル。

### config.vm.box_download_insecure

`true`の場合、サーバのSSL証明書の検証をしません。  
URLがHTTPS URLの場合、デフォルトではSSL証明書の検証を行います。

### config.vm.box_download_location_trusted

`true`の場合すべてのHTTPリダイレクトは信頼できるものとして処理されます。  
デフォルトでは、最初のHTTPリクエストの証明書のみを使用するので
リダイレクト先は信頼しません。

### config.vm.box_url

仮想マシン(ボックス)のURLを直接していします。  
`config.vm.box`が設定されている場合は、この設定は不要です。  
`file://`のような形式で、ローカルファイルの指定ができます。

### config.vm.box_version

ボックスのバージョンを指定できます。  
デフォルトは`>= 0`です。
`>= 1.0, < 1.5`のように範囲を指定して設定することができます。

### config.vm.communicator

仮想マシンに接続する方式を指定できます。  
デフォルトでは`ssh`が設定されていますが、必要があれば`winrm`と指定することで  
Windowsの仮想マシンに接続することが可能です。

### config.vm.graceful_halt_timeout

`vagrant halt`を実行した際の、仮想マシンの待ち時間を設定できます。  
デフォルトは60秒です。

### config.vm.guest

仮想マシンの形式を設定できます。  
デフォルトは`:Linux`です。  
適切なディストリビューションを自動検出して、ディレクトリのマウントや  
ネットワーク設定などOS固有の設定をおこないます。

### config.vm.hostname

仮想マシンのホスト名を設定できます。  
デフォルトは`nil`で、ホスト名は設定されません。

### config.vm.network

ネットワークに関する設定ができます。  
詳細は、別途記入します。

### config.vm.post_up_message

`vagrant up`が完了した後に、表示するメッセージを設定できます。

### config.vm.provider

固有のプロバイダに関する設定ができます。  
詳細は、別途記入します。

### config.vm.provision

仮想マシン作成時に自動インストールするソフトウェアを設定できます。  
詳細は、別途記入します。

### config.vm.synced_folder

ホストマシンのディレクトリと仮想マシンのディレクトリを共有することができます。
詳細は、別途記入します。

### config.vm.usable_port_range

`Vagrant`が使用するポートの範囲を設定できます。  
デフォルトは`2200..2250`です。

## Networking

### Basic Usage

#### Configuration

`Vagrantfile`で、`config.vm.network`メソッドを呼び出すことでネットワークの設定ができます。

#### Multiple Networks

`config.vm.network`を複数設定することが可能です。

#### Enabling Networks

`vagrant up`または`vagrant reload`を実行することで、ネットワーク設定を有効にできます。

### Forwarded Ports

`forwarded_port`で、ポートフォワードの設定をすることができます。

#### Defining A Forwarded Port

**Vagrantfile**

```
  config.vm.network "forwarded_port", guest: 80, host: 8080
```

#### Options Reference

* `guest`(int) : 仮想マシンのゲスト側のポート
* `guest_ip`(string) : 仮想マシンのゲスト側のIPアドレス
* `host`(int) : 仮想マシンのホスト側のポート
* `host_ip`(string) : 仮想マシンのホスト側のIPアドレス
* `protocol`(string) : プロトコル(`tcp`または`udp`)

#### Forwarded Port Protocols

下記は設定例です。

**Vagrantfile**

```
  config.vm.network "forwarded_port", guest: 2003, host: 12003, protocol: 'tcp'
  config.vm.network "forwarded_port", guest: 2003, host: 12003, protocol: 'udp'
```

#### Port Collisions And Correction

オートコレクション(自動修正)を有効にできます。

```
  config.vm.network "forwarded_port", guest: 80, host: 8080,
    auto_correct: true
```

### Private Network

#### DHCP

`Vagrantfile`の`config.vm.network`に`type: "dhcp"`を追加することで、  
DHCP(ネットワークアドレスの動的割当)を有効にできます。

**Vagrantfile**

```
  config.vm.network "private_network", type: "dhcp"
```

#### Static IP

`Vagrantfile`の`config.vm.network`に`ip: "192.168.50.4"`を追加することで、  
静的IPアドレスを有効にできます。

**Vagrantfile**

```
  config.vm.network "private_network", ip: "192.168.50.4"
```

*`192.168.50.4`は任意のアドレスに変更してください。*

#### Disable Auto-Configuration

`Vagrantfile`の`config.vm.network`に`auto_config: false`を追加することで、  
ネットワークの自動設定を無効にできます。

**Vagrantfile**

```
  config.vm.network "private_network", ip: "192.168.50.4",
    auto_config: false
```

### Public Network

#### DHCP

#### Static IP

#### Default Network Interface

#### Disable Auto-Configuration

#### Default Router

# Multi-Machine

`Vagrant`はマルチマシン構成の定義および制御が可能です。  
同時に複数起動することも、仮想マシンを関連づけして順番に起動することも可能です。  
下記はマルチマシン構成の例です。

* WebサーバとDBサーバのように、サーバが分かれたシステム
* 分散システム
* APIのようなインターフェースをテスト
* 災害時のテスト(Disaster-case testing)

## Defining multiple machines

`Vagrantfile`に`config.vm.define`を定義することでマルチマシン構成が可能。

```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "web" do |web|
    web.vm.box = "apache"
  end

  config.vm.define "db" do |db|
    db.vm.box = "mysql"
  end
end
```

`Vagrant`は外側から順に実行されます。  
下記の場合、`A`、`C`、`B`の順に実行されます。

```
Vagrant.configure("2") do |config|
    config.vm.provision :shell, inline: 'echo A'
    config.vm.define :testing do |test|
        test.vm.provision :shell, inline: 'echo B'
    end
    config.vm.provision :shell, inline: 'echo C'
end
```

## Controlling multiple machines

仮想マシンを個別に起動またはSSHしたい場合は、  
`vagrant up web`や`vagrant ssh db`のように  
名前を指定してコマンドを実行してください。

さらに正規表現を使って、複数の仮想マシンを制御することも可能です。  
`follower0`、`follower1`、`follower2`が定義されている場合、  
`vagrant up /follower[0-9]/`で起動できます。

## Communication between machines

## Specifying a primary machine

`primary: true`を記述することで  
デフォルトで起動するマシンを指定することができます。

```
config.vm.define "web", primary: true do |web|
  # ...
end
```

## Autostart machines

自動起動を防ぎたい場合は、`autostart`を定義して  
`false`を設定してください。

```
config.vm.define "web"
config.vm.define "db"
config.vm.define "db_follower", autostart: false
```

以上