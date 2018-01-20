## zookeeper分布式集群脚本化部署
伪分布式集群zookeeper集群快速部署与搭建</br>
1. 建立目录，将zookeeper与zk-cluester中的脚本置于其中</br>
2. 运行脚本zkconfig.sh 运行结果如下:</br>


zkconfig.sh脚本相关参数说明:
> basePath：zk部署路径</br>
> nodeNum：节点个数</br>
> zkFileName：zookeeper文件夹名称</br>
> baseClientPort：客户端端口号，随着节点个数的递增而递增</br>
> baseProposalPort：集群成员的信息交换端口，随着节点个数的递增而递增</br>
> baseElectionPort：选举端口，随着节点个数的递增而递增</br>

