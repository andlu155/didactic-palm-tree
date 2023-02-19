#printf "验证成功"
iptables -F
iptables -X
iptables -Z
ip6tables -F
ip6tables -X
ip6tables -Z
ip6tables=/system/bin/ip6tables
iptables=/system/bin/iptables
#echo "初始化成功"
#自动获取uid
uid=`cat /data/system/packages.list | grep com.tencent.tmgp.sgame | awk '{print $2}'`
iptables -t filter -I INPUT -m owner --uid-owner=$uid -j DROP
iptables -t filter -A OUTPUT -m owner --uid-owner=$uid -j DROP

#echo "禁止王者获取本地联网成功"
#echo "正在放行正常ip"


#更新/会三方
#iptables -I OUTPUT -m owner --uid-owner=$uid -p tcp --dport 1884 -j ACCEPT
#iptables -I OUTPUT -m owner --uid-owner=$uid -p tcp --dport 8085 -j ACCEPT
#iptables -I OUTPUT -m owner --uid-owner=$uid -p tcp --dport 20000 -j ACCEPT
#iptables -I OUTPUT -m owner --uid-owner=$uid -p tcp --dport 50012 -j ACCEPT
#iptables -I OUTPUT -m owner --uid-owner=$uid -p tcp --dport 50014 -j ACCEPT

#登录qq
#iptables -I OUTPUT -m owner --uid-owner=$uid -d ap6.ssl.msdk.qq.com -j ACCEPT

#大厅联网awx.smoba.qq.com端口10042
iptables -I OUTPUT -m owner --uid-owner=$uid -d njawx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d awxcs.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d awx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d gzawx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d cqawx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d tjawx.smoba.qq.com -j ACCEPT


#大厅联网aqq.smoba.qq.com端口11229
iptables -I OUTPUT -m owner --uid-owner=$uid -d njaqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d aqqcs.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d aqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d gzaqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d cqaqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d tjaqq.smoba.qq.com -j ACCEPT

#特权
iptables -I OUTPUT -m owner --uid-owner=$uid -d lbs.map.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d priv.igame.qq.com -j ACCEPT

#语音转文字端口10001，443，16285
iptables -I OUTPUT -m owner --uid-owner=$uid -d capi.voice.gcloud.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d cn.voice.gcloudcs.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d api.pr.weixin.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -p udp --dport 10001 -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -p udp --dport 16285 -j ACCEPT
#游戏对战
iptables -I OUTPUT -m owner --uid-owner=$uid -p udp --dport "10000:17004" -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -p udp --dport "17006:30000" -j ACCEPT

