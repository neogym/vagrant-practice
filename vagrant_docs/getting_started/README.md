# Getting Started

## Project Setup

`Vagrant`用のディレクトリを作成し、そのディレクトリ内で初期化(`vagrant init`)してください。

```
$ mkdir vagrant_getting_started
$ cd vagrant_getting_started
$ vagrant init
```

初期化が成功すると`Vagrantfile`が作成されます。

## Boxes

### Installing A Box

下記コマンド(`vagrant box add`)で、ボックスをローカルにダウンロードしてください。

**コマンド**

```
$ vagrant box add hashicorp/precise32
```

### Using A Box

下記のように`Vagrantfile`を編集してください。  
*`config.vm.box`にダウンロードしたボックスの名前を指定*

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
end
```

### Finding More Boxes

他のボックスを使いたい場合は、下記のサイトから検索してください。

[Discover Vagrant Boxes | Atlas by HashiCorp:](https://atlas.hashicorp.com/boxes/search)

## Up And SSH

仮想マシンを起動する場合は、下記のコマンドを実行してください。

**コマンド**

```
$ vagrant up
```

仮想マシンの起動が終了したら、下記コマンドで仮想マシンにアクセスしてください。

**コマンド**

```
$ vagrant ssh
```

仮想マシンが不要になった場合は、`vagrant destroy`コマンドを実行して削除してください。

## Synced Folder

仮想マシンの`/vagrant`ディレクトリにファイルを作成すると  
`Vagrant`のプロジェクト直下に同じファイルが作成される。  
(ディレクトリが同期している)

下記は、仮想マシンの`/vagrant`ディレクトリに`foo`ファイルを作成した場合に  
`Vagrant`のプロジェクトにファイルが同期されるかどうか確認した結果です。

**コマンド**

```
vagrant@precise32:~$ touch /vagrant/foo
vagrant@precise32:~$ exit
$ ls
foo Vagrantfile
```

## Provisioning

仮想マシン起動直後に、シェルスクリプトを使ってプロビジョニングした例です。

**bootstrap.sh**

```
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
```

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.provision :shell, path: "bootstrap.sh"
end
```

**コマンド**

```
vagrant@precise32:~$ wget -qO- 127.0.0.1
```

**出力**

*`Vagrant`のプロジェクトに格納されているファイル一覧が表示されたら成功*

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
 <head>
  <title>Index of /</title>
 </head>
 <body>
<h1>Index of /</h1>
<table><tr><th><img src="/icons/blank.gif" alt="[ICO]"></th><th><a href="?C=N;O=D">Name</a></th><th><a href="?C=M;O=A">Last modified</a></th><th><a href="?C=S;O=A">Size</a></th><th><a href="?C=D;O=A">Description</a></th></tr><tr><th colspan="5"><hr></th></tr>
<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="README.md">README.md</a></td><td align="right">14-Nov-2015 00:24  </td><td align="right">  1 </td><td>&nbsp;</td></tr>
<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="Vagrantfile">Vagrantfile</a></td><td align="right">14-Nov-2015 00:32  </td><td align="right">170 </td><td>&nbsp;</td></tr>
<tr><td valign="top"><img src="/icons/text.gif" alt="[TXT]"></td><td><a href="bootstrap.sh">bootstrap.sh</a></td><td align="right">14-Nov-2015 00:31  </td><td align="right">138 </td><td>&nbsp;</td></tr>
<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="foo">foo</a></td><td align="right">14-Nov-2015 00:30  </td><td align="right">  0 </td><td>&nbsp;</td></tr>
<tr><th colspan="5"><hr></th></tr>
</table>
<address>Apache/2.2.22 (Ubuntu) Server at 127.0.0.1 Port 80</address>
</body></html>
```

## Networking

### Port Forwarding

下記は、4567ポートを仮想マシンの80ポートにフォワーディングする設定です。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 80, host: 4567
end
```

`vagrant reload`または`vagrant up`を実行することで  
ネットワーク設定を有効にすることができます。

**コマンド**

```
$ vagrant reload
```

**出力**

```
==> default: Attempting graceful shutdown of VM...
==> default: Checking if box 'hashicorp/precise32' is up to date...
==> default: Clearing any previously set forwarded ports...
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 80 => 4567 (adapter 1)
    default: 22 => 2222 (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection timeout. Retrying...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: The guest additions on this VM do not match the installed version of
    default: VirtualBox! In most cases this is fine, but in rare cases it can
    default: prevent things such as shared folders from working properly. If you see
    default: shared folder errors, please make sure the guest additions within the
    default: virtual machine match the version of VirtualBox you have installed on
    default: your host and reload your VM.
    default: 
    default: Guest Additions Version: 4.2.0
    default: VirtualBox Version: 4.3
==> default: Mounting shared folders...
    default: /vagrant => /Users/masaki/Documents/Development/github/neogym/vagrant-practice/3_sample
==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> default: flag to force provisioning. Provisioners marked to run always will still run.
```

コマンドを実行した後に、`http://127.0.0.1:4567`にアクセスして  
仮想マシンのWebサーバにアクセスできることを確認してください。  
プロジェクトのファイル一覧が表示されるはずです。

### Other Networking

この他にも、静的IPアドレスの設定やブリッジ設定などが可能です。

## Share

`Vagrant`で作成した仮想マシンを、一時的にインターネットに公開することができます。  
下記サイトで詳細に説明されているので、こちらを参考にしてください。

[Vagrantで作った仮想マシンを簡単に共有できる「Vagrant Share」を使ってみる - さくらのナレッジ:](http://knowledge.sakura.ad.jp/tech/2488/)

*別拠点から仮想マシンの動作確認をしたい場合や、モックサーバとしてテストを行う場合に使えます。*

## Teardown

**Suspending**

`vagrant suspend`コマンドによって、仮想マシンの状態を維持したまま停止することができます。  
`vagrant up`コマンドで、仮想マシンを再開することができます。

**Halting**

`vagrant halt`コマンドによって、仮想マシンをクレースフルシャットダウンすることができます。  
`vagrant up`コマンドで、仮想マシンを起動することができます。

**Destroying**

`vagrant destroy`コマンドによって、仮想マシンを削除することができます。  
`vagrant up`コマンドで、仮想マシンを作成および起動することができます。


## Rebuild

仮想マシンをリビルドしたい場合は、`vagrant up`コマンドを実行してください。

**コマンド**

```
$ vagrant up
```

**出力**

*下記の例は、変更がない場合の出力です。*

```
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Checking if box 'hashicorp/precise32' is up to date...
==> default: VirtualBox VM is already running.
```

## Providers

`vagrant up`コマンドにオプションを指定することで、プロバイダを変更することができます。

**コマンド**

```
$ vagrant up --provider=vmware_fusion
```

```
$ vagrant up --provider=aws
```

以上