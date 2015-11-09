# Boxes

下記のリンクから使いたいボックス(仮想マシン)を探して  
`vagrant init`コマンドを実行する。

[public Vagrant box catalog](https://atlas.hashicorp.com/boxes/search)

**コマンド**

```
vagrant init centos/7
```

`vagrant init`した後で、ボックスを変更する場合は  
`Vagrantfile`の`config.vm.box`の項目を編集する。

**Vagrantfile**

```
  config.vm.box = "centos/7"
```

**コマンド**

```
$ vagrant up
```

**出力**

```
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'centos/7' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Loading metadata for box 'centos/7'
    default: URL: https://atlas.hashicorp.com/centos/7
==> default: Adding box 'centos/7' (v1509.01) for provider: virtualbox
    default: Downloading: https://atlas.hashicorp.com/centos/boxes/7/versions/1509.01/providers/virtualbox.box
==> default: Successfully added box 'centos/7' (v1509.01) for 'virtualbox'!
==> default: Importing base box 'centos/7'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'centos/7' is up to date...
==> default: Setting the name of the VM: 2_sample_default_1447042277261_96934
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 => 2222 (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection timeout. Retrying...
    default: Warning: Connection timeout. Retrying...
    default: Warning: Remote connection disconnect. Retrying...
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: No guest additions were detected on the base box for this VM! Guest
    default: additions are required for forwarded ports, shared folders, host only
    default: networking, and more. If SSH fails on this machine, please install
    default: the guest additions and repackage the box to continue.
    default: 
    default: This is not an error message; everything may continue to work properly,
    default: in which case you may ignore this message.
==> default: Installing rsync to the VM...
==> default: Rsyncing folder: /Users/masaki/Documents/Development/github/neogym/vagrant-practice/2_sample/ => /home/vagrant/sync
```

以上