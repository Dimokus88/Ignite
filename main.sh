#!/bin/bash
echo 'export my_root_password='${my_root_password}  >> $HOME/.bashrc
echo 'export ignite='${ignite}  >> $HOME/.bashrc
echo 'export YOUR_CHAIN_NAME='${YOUR_CHAIN_NAME}  >> $HOME/.bashrc
curl -s https://raw.githubusercontent.com/Dimokus88/universe/main/script/start.sh | bash
ver="1.18.1" && wget "https://go.dev/dl/go$ver.linux-amd64.tar.gz" && \
sudo rm -rf /usr/local/go && \
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz" && \
rm "go$ver.linux-amd64.tar.gz" && \
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile && \
source $HOME/.bash_profile && \
go version
sed -i.bak -e "s~"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"~"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/usr/local/go/bin:$HOME/go/bin"~;" /etc/sudoers
mkdir -p /root/go/bin/
cd /
git clone https://github.com/ignite/cli
cd cli && checout $ignite
make install
ignite scaffold chain $YOUR_CHAIN_NAME
cd $YOUR_CHAIN_NAME
ignite chain serve
