# Provisioning

## Basic Usage

### Configuration

`Vagrantfile`で`config.vm.provision`メソッドを呼び出すことでプロビジョニングの設定ができます。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  # ... other configuration

  config.vm.provision "shell", inline: "echo hello"
end
```

下記のような書き方もできます。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  # ... other configuration

  config.vm.provision "shell" do |s|
    s.inline = "echo hello"
  end
end
```

プロヴィジョナーに、名前をつけることもできます。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  # ... other configuration

  config.vm.provision "bootstrap", type: "shell" do |s|
    s.inline = "echo hello"
  end
end
```

### Running Provisioners

`vagrant up`、`vagrant provision`、および`vagrant reload --provision`のコマンドを実行した時にプロビジョニングされます。

* `--no-provision`
    * `vagrant up`および`vagrant reload`に、このオプションをつけることでプロビジョニングされないようになります。
* `--provision-with`
	* 一部のプロビジョニングのみを実行したい場合に、このオプションをつけます。例えば`shell`と`Puppet`のプロビジョニングが設定されている場合、`vagrant provision --provision-with shell`と実行すると`shell`のみがプロビジョニングされます。

### Run Once Or Always

デフォルトでは、プロビジョナーは一回しか実行されません。

常にプロビジョニングするためには、`run`オプションに`always`を設定する必要があります。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo hello",
    run: "always"
end
```

下記のような書き方もできます。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", run: "always" do |s|
    s.inline = "echo hello"
  end
end
```

### Multiple Provisioners

`config.vm.provision`を複数設定することで、プロビジョニングを複数行うことができます。

下記の場合、`foo`、`baz`、`bar`の順に実行されます。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo foo"

  config.vm.define "web" do |web|
    web.vm.provision "shell", inline: "echo bar"
  end

  config.vm.provision "shell", inline: "echo baz"
end
```

`config.vm.provision`に名前を設定することで、`--provision-with`オプションを指定して特定のプロビジョニングのみを実行することができます。

### Overrinding Provisioner Settings

***Warging: Advanced Topic!***
*プロフィジョナーのオーバーライドは高度な内容です。*

下記の例では、プロビジョナーに`foo`という名前が2つ設定されています。
この場合は、`echo foo`は実行されずに`echo bar`のみが実行されます。

**Vagrantfile**

```
Vagrant.configure("2") do |config|
  config.vm.provision "foo", type: "shell",
    inline: "echo foo"

  config.vm.define "web" do |web|
    web.vm.provision "foo", type: "shell",
      inline: "echo bar"
  end
end
```

下記の場合は、`foo`、`bar`の順に出力されます。

```
Vagrant.configure("2") do |config|
  config.vm.provision "foo", type: "shell",
    inline: "echo ORIGINAL!"

  config.vm.define "web" do |web|
    web.vm.provision "shell",
      inline: "echo foo"
    web.vm.provision "foo", type: "shell",
      inline: "echo bar"
  end
end
```

もし、`echo ORIGINAL!`を実行したい場合は、`preserve_order: true`フラグを設定してください。(未確認)

## File

## Shell

## Ansible

## CFEngine

## Chef Solo

## Chef Zero

## Chef Client

## Chef Apply

## Docker

## Puppet Apply

## Puppet Agent

## Salt

以上