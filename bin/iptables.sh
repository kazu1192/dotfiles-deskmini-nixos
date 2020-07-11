#!/bin/bash

#####################################
# 前処理
#####################################
# iptables停止
systemctl stop iptables.service
# ルールの初期化
echo "" > /etc/iptables/iptables.rules

#####################################
# 基本設定
#####################################
# デフォルトルール
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# 自ホストからのアクセスをすべて許可
iptables -A INPUT -i lo -j ACCEPT

# 内部からのセッションが確立した後は許可
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

########################################
# 攻撃対策
########################################
# TCP SYN Flood攻撃対策
sysctl -w net.ipv4.tcp_syncookies=1 > /dev/null
sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.d/99-sysctl.conf
echo "net.ipv4.tcp_syncookies=1" >> /etc/sysctl.d/99-sysctl.conf

# Smurf攻撃対策
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1 > /dev/null
sed -i '/net.ipv4.icmp_echo_ignore_broadcasts/d' /etc/sysctl.d/99-sysctl.conf
echo "net.ipv4.icmp_echo_ignore_broadcasts=1" >> /etc/sysctl.d/99-sysctl.conf

# ICMP Redirectパケットの送信を拒否
sed -i '/net.ipv4.conf.*.send_redirects/d' /etc/sysctl.d/99-sysctl.conf
for dev in `ls /proc/sys/net/ipv4/conf/`
do
  sysctl -w net.ipv4.conf.$dev.send_redirects=0 > /dev/null
  echo "net.ipv4.conf.$dev.send_redirects=0" >> /etc/sysctl.d/99-sysctl.conf
done

# ICMP Redirectパケットは拒否
sed -i '/net.ipv4.conf.*.accept_redirects/d' /etc/sysctl.d/99-sysctl.conf

for dev in `ls /proc/sys/net/ipv4/conf/`
do
  sysctl -w net.ipv4.conf.$dev.accept_redirects=0 > /dev/null
  echo "net.ipv4.conf.$dev.accept_redirects=0" >> /etc/sysctl.d/99-sysctl.conf
done

# Source Routedパケットは拒否
sed -i '/net.ipv4.conf.*.accept_source_route/d' /etc/sysctl.d/99-sysctl.conf
for dev in `ls /proc/sys/net/ipv4/conf/`
do
  sysctl -w net.ipv4.conf.$dev.accept_source_route=0 > /dev/null
  echo "net.ipv4.conf.$dev.accept_source_route=0" >> /etc/sysctl.conf
done

# フラグメント化されたパケットはログを記録して破棄
iptables -A INPUT -f -j LOG --log-prefix '[IPTABLES FRAGMENT] : '
iptables -A INPUT -f -j DROP

# NetBIOS関連のアクセスは破棄
iptables -A INPUT -p tcp -m multiport --dports 135,137,138,139 -j DROP
iptables -A INPUT -p udp -m multiport --dports 135,137,138,139 -j DROP
iptables -A OUTPUT -p tcp -m multiport --sports 135,137,138,139 -j DROP
iptables -A OUTPUT -p udp -m multiport --sports 135,137,138,139 -j DROP

# Ping of Death攻撃対策
iptables -N LOG_PINGDEATH
iptables -A LOG_PINGDEATH -m limit --limit 1/s --limit-burst 4 -j ACCEPT
iptables -A LOG_PINGDEATH -j LOG --log-prefix '[IPTABLES PINGDEATH] : '
iptables -A LOG_PINGDEATH -j DROP
iptables -A INPUT -p icmp --icmp-type echo-request -j LOG_PINGDEATH

# 全ホスト(ブロードキャストアドレス、マルチキャストアドレス)宛パケットは破棄
iptables -A INPUT -d 255.255.255.255 -j DROP
iptables -A INPUT -d 224.0.0.1 -j DROP

# 113番ポート(IDENT)へのアクセスには拒否応答(メールサーバ等のレスポンス低下防止)
iptables -A INPUT -p tcp --dport 113 -j REJECT --reject-with tcp-reset

######################################
# 各種サービス設定
######################################
# ssh ※ssshの待受ポートは22だが、変更している場合は適宜dportを変更。ここでは50134
iptables -A INPUT -p tcp --dport 3000 -j ACCEPT
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT
iptables -A INPUT -p tcp --dport 13040 -j ACCEPT
iptables -A INPUT -p tcp --dport 13080 -j ACCEPT
iptables -A INPUT -p tcp --dport 13443 -j ACCEPT
iptables -A INPUT -p tcp --dport 50312 -j ACCEPT

######################################
# その他
######################################
# 上記のルールにマッチしなかったアクセスはログを記録して破棄
iptables -A INPUT -m limit --limit 1/s -j LOG --log-prefix '[IPTABLES INPUT] : '
iptables -A INPUT -j DROP
iptables -A FORWARD -m limit --limit 1/s -j LOG --log-prefix '[IPTABLES FORWARD] : '
iptables -A FORWARD -j DROP

######################################
# 後処理
######################################
# サーバー再起動時にも上記設定が有効となるようにルールを保存
iptables-save > /etc/iptables/iptables.rules

# ファイアウォール起動
systemctl restart iptables.service
