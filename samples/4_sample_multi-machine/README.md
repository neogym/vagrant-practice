# Multi-Machine

## ファイル

* Vagrantfile
    * ボックス : `centos/7`
    * 仮想マシン : `vm1`, `vm2`
    * プロビジョニング : `file`
        * ファイル : `source1.txt`, `source2.txt`

## 備考

メモリ節約のために、下記の記述を追加しています。

```
  config.vm.provider "virtualbox" do |v|
    v.memory = 256
    v.cpus = 1
  end
```

## 参考

* [CentOS 7 でLAMP(Nginx+MariaDB(MySQL)+PHP)インストールからWordPressを動かすまで(Nginx編) | レンタルサーバー・自宅サーバー設定・構築のヒント:](http://server-setting.info/centos/nginx-wordpress-centos7.html)

以上