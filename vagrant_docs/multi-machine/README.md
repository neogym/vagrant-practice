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