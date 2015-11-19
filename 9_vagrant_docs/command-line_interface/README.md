# Command-Line Interface

`Vagrant`に関する操作は、`vagrant`コマンドを使います。  
`vagrant up`や`vagrant destroy`などのコマンドの後ろに、サブコマンドを指定することで様々な操作が可能です。

`vagrant`コマンドのみを実行するとヘルプが表示されます。

コマンドのヘルプを表示したい場合は、`vagrant init -h`のように、`-h`オプションを指定してください。

## box

**コマンド:**`vagrant box`

ボックスを管理するコマンドです。

**サブコマンド**

* add
* list
* outdate
* remove
* repackage
* update

### box add

**コマンド:**`vagrant box add ADDRESS`

`Vagrant`のボックスを追加します。  
アドレスの指定方法は、下記の3つの方法があります。

* `hashicorp/precise64`のように名前を指定。(ただし、[公開されたカタログ](https://atlas.hashicorp.com/boxes/search)登録されていること)
* ファイルパスまたは[公開されたカタログ](https://atlas.hashicorp.com/boxes/search)のHTTP URLを指定。
* ボックスのURLを直接指定。

#### options

* `--box-version VALUE` - 
* `--cacert CERTFILE` - 
* `--capath CERTDIR` - 
* `--cert CERTFILE` - 
* `--clean` - 
* `--force` - 
* `--insecure` - 
* `--provider PROVIDER` - 

#### options for direct box files

下記は、ボックスのURLを直接指定した場合のオプションです。

* `--checksum VALUE` - 
* `--checksum-type TYPE` - 
* `--name VALUE` - 

### box list

**コマンド:**`vagrant box list`

`Vagrant`にインストールされているボックスの一覧を表示します。

### box outdate

**コマンド:**`vagrant box outdated`

ボックスが最新かどうか確認します。

#### options

* `--global` - すべてのボックスに対して、最新かどうか確認します。

### box remove

**コマンド:**`vagrant box remove NAME`

インストールしたボックスを削除します。

#### options

* `--box-version VALUE` - バージョンを指定。
* `--force` - ボックスを使用中でも強制的に削除。
* `--provider VALUE` - プロバイダを指定。

### box repackage

**コマンド:**`vagrant box repackage NAME PROVIDER VERSION`

***TODO***

### box update

**コマンド:**`vagrant box update`

ボックスの更新をします。  
もし、ボックスが最新かどうか確認したい場合は、`vagrant box outdate`コマンドで確認してください。

#### options

* `--box VALUE` - 更新したいボックスを指定。
* `--provider VALUE` - 更新したいプロバイダを指定。

## connect

## destroy

## global-status

## halt

## init

**コマンド:**`vagrant init [box-name] [box-url]`

`Vagrant`の初期化コマンド。  
カレントディレクトリに`Vagrantfile`が作成されます。

### options

* `--force` - 既に`Vagrantfile`がある場合でも強制的に実行。
* `--minimal` - 最小構成の`Vagrantfile`を出力。(コメントがない`Vagrantfile`)
* `--output FILE` - `Vagrantfile`のファイル名を指定。`-`を指定した場合は標準出力される。

## login

## package

## plugin

**コマンド:**`vagrant plugin`

`Vagrant`のプラグインを管理するコマンドです。

**サブコマンド**

* `install`
* `license`
* `list`
* `uninstall`
* `update`

### pulugin istall

**コマンド:**`vagrant plugin install <name>...`

プラグインをインストールします。

* `--entry-point ENTRYPOINT` - ***TODO***
* `--plugin-source SOURCE` - ***TODO***
* `--plugin-version VERSION` - プラグインのバージョンを指定。(例:`"1.2.3"`、`"> 1.0.2"`、`"> 1.0.2, < 1.1.0"`)

### pulugin license

**コマンド:**`vagrant plugin license <name> <license-file>`

***TODO***

### pulugin list

**コマンド:**`vagrant plugin list`

インストールされているプラグインの一覧を表示します。

### pulugin uninstall

**コマンド:**`vagrant plugin uninstall <name> [<name2> <name3> ...]`

プラグインをアンインストールします。

### pulugin update

**コマンド:**`vagrant plugin update [<name>]`

プラグインを最新に更新します。  
もし、特定のバージョンのプラグインを使いたい場合は、`vagrant plugin install`で再インストールしてください。

## provision

## rdp

## reload

## resume

## share

## ssh

## status

## suspend

## up

**コマンド:**`vagrant up`

`Vagrantfile`に従って、仮想マシンを起動および構成します。

### options

* `--[no-]destroy-on-error` - 起動時にエラーが発生した場合に、仮想マシンを削除するかどうか指定。
* `--[no-]parallel` - 複数構成の仮想マシンを、並列に起動するかどうか指定。
* `--provider x` - プロバイダを指定。デフォルトは`virtualbox`。
* `--provision` - プロビジョン(仮想マシンのセットアップ)を強制する場合に指定。
* `--provision-with x,y,z` - どのプロビジョンを実行するか指定。(例:`Vagrantfile`に、`:shell`および`:chef_solo`が定義してある場合に、`vagrant provision --provision-with shell`を実行すると`shell`のみがプロビジョニングされる)

## version

**コマンド**`vagrant version`

インストールされている`Vagrant`のバージョンと、利用可能な最新バージョンを表示します。

このコマンドはネットワーク通信が発生します。  
インストールされている`Vagrant`のバージョンだけを確認したい場合は、`vagrant --version`を実行してください。

## More Commands

## Machine Readable

## Output


以上