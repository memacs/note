#安装准备
>sudo yum -y groupinstall Base "Development Tools" "Perl Support"
>sudo yum -y install openssl openssl-devel unixODBC unixODBC-devel pkgconfig libSM libSM-devel libxslt ncurses-devel libyaml libyaml-devel expat expat-devel libxml2-devel libxml2 pam-devel
>cd ~
>mkdir download
>wget https://mirrors.ustc.edu.cn/centos/7/os/x86_64/Packages/openssl-perl-1.0.2k-16.el7.x86_64.rpm
>wget https://mirrors.ustc.edu.cn/centos/7/os/x86_64/Packages/openssl-devel-1.0.2k-16.el7.x86_64.rpm
>wget https://mirrors.ustc.edu.cn/centos/7/os/x86_64/Packages/openssl-static-1.0.2k-16.el7.x86_64.rpm
>wget https://mirrors.ustc.edu.cn/centos/7/os/x86_64/Packages/openssl-1.0.2k-16.el7.x86_64.rpm
>wget https://mirrors.ustc.edu.cn/centos/7/os/x86_64/Packages/openssl-libs-1.0.2k-16.el7.x86_64.rpm
>sudo yum install -y openssl-*
  
#下载安装文件
emqx-centos7-v3.1-rc.1.zip
  
#emqx_home=$HOME/emqx/emqx-3.1.rc1
#配置emq安装包
>sudo mkdir $HOME/emqx
>cd $HOME/emqx
>cp ../emqx-centos7-v3.1-rc.1.zip ./
>unzip emqx-centos7-v3.1-rc.1.zip
>mv emqx/ emqx-3.1.rc1/
  
#设置系统优化参数
>sudo sysctl -w fs.file-max=2097152
>sudo sysctl -w fs.nr_open=2097152
>sudo vim /etc/sysctl.conf
 -> fs.file-max = 2097152
>sudo vim  /etc/systemd/system.conf
 -> DefaultLimitNOFILE=2097152
>sudo vim /etc/security/limits.conf
 ->
   *      soft   nofile      1048576
   *      hard   nofile      1048576
     
#修改emq配置文件
>sudo vim emqx-3.1.rc1/etc/emqx.conf
cluster.name = mqttpush
cluster.discovery = static
cluster.static.seeds = emqx@1,emqx@2
node.name = emqx@1
node.cookie = xxxxxxxxxxxxxxxxxxx
log.rotation.size = 1000MB
log.rotation.count = 20
allow_anonymous = false
acl_nomatch = deny
mqtt.max_packet_size = 10MB
mqtt.retain_available = false
listener.ssl.external.max_connections = 1024000
listener.ssl.external.max_conn_rate = 10000
  
#修改emqx_auth_http.conf
>sudo vim emqx-3.1.rc1/etc/plugins/emqx_auth_http.conf
 auth.http.auth_req = http://{auth_service_ip}:8080/mqtt/auth
 auth.http.auth_req.method = get
 auth.http.auth_req.params = clientid=%c,username=%u,password=%P
 
 auth.http.super_req = http://xxxxxx/mqtt/superuser
 auth.http.super_req.method = get
 auth.http.super_req.params = clientid=%c,username=%u
 
 auth.http.acl_req = http://${auth_service_ip}:8080/mqtt/acl
 auth.http.acl_req.method = get
 auth.http.acl_req.params = access=%A,username=%u,clientid=%c,ipaddr=%a,topic=%t
 
#修改webhook
>sudo vim emqx-3.1.rc1/etc/plugins/emqx_web_hook.conf
web.hook.api.url = http://xxxxxxxx/push/emq/webhook
web.hook.rule.session.subscribed.1   = {"action": "on_session_subscribed"}
 
#配置emq环境变量
>sudo vim /etc/profile
 EMQ_HOME=$HOME/emqx/emqx-3.1.rc1
 export PATH=$EMQ_HOME/bin:$PATH
 
#启动服务
>sudo emqx start
#加载插件模块
>sudo emqx_ctl plugins load emqx_auth_http
>sudo emqx_ctl plugins load emqx_web_hook
#查看集群状态
>sudo emqx_ctl cluster status
 
在web控制台启动webhook
http://1:18083
 
 
debug
sudo emqx remote_consle
> etop:start([{output,text},{lines,10},{sort,reductions},{accumulations,true},{interval,10}]).
 
sudo emqx_ctl listeners
sudo emqx_ctl listeners stop mqtt:ssl 8883
