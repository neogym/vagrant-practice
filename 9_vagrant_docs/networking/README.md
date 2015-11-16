# Networking

## Basic Usage

### Configuration

`Vagrantfile`で、`config.vm.network`メソッドを呼び出すことでネットワークの設定ができます。

### Multiple Networks

`config.vm.network`を複数設定することが可能です。

### Enabling Networks

`vagrant up`または`vagrant reload`を実行することで、ネットワーク設定を有効にできます。

## Forwarded Ports

`forwarded_port`で、ポートフォワードの設定をすることができます。

### Defining A Forwarded Port

**Vagrantfile**

```
  config.vm.network "forwarded_port", guest: 80, host: 8080
```

### Options Reference

* `guest`(int) : 仮想マシンのゲスト側のポート
* `guest_ip`(string) : 仮想マシンのゲスト側のIPアドレス
* `host`(int) : 仮想マシンのホスト側のポート
* `host_ip`(string) : 仮想マシンのホスト側のIPアドレス
* `protocol`(string) : プロトコル(`tcp`または`udp`)

### Forwarded Port Protocols

下記は設定例です。

**Vagrantfile**

```
  config.vm.network "forwarded_port", guest: 2003, host: 12003, protocol: 'tcp'
  config.vm.network "forwarded_port", guest: 2003, host: 12003, protocol: 'udp'
```

### Port Collisions And Correction

オートコレクション(自動修正)を有効にできます。

```
  config.vm.network "forwarded_port", guest: 80, host: 8080,
    auto_correct: true
```

## Private Network

### DHCP

`Vagrantfile`の`config.vm.network`に`type: "dhcp"`を追加することで、  
DHCP(ネットワークアドレスの動的割当)を有効にできます。

**Vagrantfile**

```
  config.vm.network "private_network", type: "dhcp"
```

### Static IP

`Vagrantfile`の`config.vm.network`に`ip: "192.168.50.4"`を追加することで、  
静的IPアドレスを有効にできます。

**Vagrantfile**

```
  config.vm.network "private_network", ip: "192.168.50.4"
```

*`192.168.50.4`は任意のアドレスに変更してください。*

### Disable Auto-Configuration

`Vagrantfile`の`config.vm.network`に`auto_config: false`を追加することで、  
ネットワークの自動設定を無効にできます。

**Vagrantfile**

```
  config.vm.network "private_network", ip: "192.168.50.4",
    auto_config: false
```

## Public Network

### DHCP

### Static IP

### Default Network Interface

### Disable Auto-Configuration

### Default Router

以上