## 直接运行方式(geth-pbft)

下载可执行文件，直接运行：

命令行运行`git clone https://github.com/Agzs/geth-pbft-exe.git`

命令行打开`cd geth-pbft-exe`

命令行运行`chmod 777 install.sh`

命令行运行`sudo ./install.sh`

ctrl+art+T打开命令行，运行`sudo gedit .bashrc`

在文件最后一行添加`export PATH=$PATH:"/usr/local/geth-pbft"`

保存文件后，在命令行运行`source .bashrc`

若后期想修改配置文件，命令行运行`cd $HOME/.geth-pbft`，该目录下有两个.yaml文件：

config.yaml文件配置PBFT相关参数，诸如VP个数、timeout等

core.yaml文件配置rocksDB数据库的存储，用于保存viewchange过程中的信息。

**注:** 运行时，由于权限问题，需要通过命令行`sudo -s`进入root模式，在root模式下，运行[geth指令](https://github.com/shaoxiaobei/geth-pbft/wiki/%E6%93%8D%E4%BD%9C%E6%AD%A5%E9%AA%A4)，注意，不能通过`sudo geth ...`，否则会提示`sudo: geth: command not found`

在root模式下，运行`geth version`，可能会提示:
```go
root@blockchain:~# geth version
geth: error while loading shared libraries: librocksdb.so.4.1: cannot open shared object file: No such file or directory
```
原因：系统没有安装`librocksdb.so.4.1`的共享库

解决方法：[安装librocksdb.so.4.1的共享库](https://github.com/Agzs/geth-pbft-study/wiki/%E5%AE%89%E8%A3%85librocksdb.so.4.1%E7%9A%84%E5%85%B1%E4%BA%AB%E5%BA%93)
