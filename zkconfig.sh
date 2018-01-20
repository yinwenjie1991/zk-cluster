#! /bin/bash
# zk部署路径
basePath=/home/yinwenjie/zk-cluster/
# 伪分布式集群节点个数
nodeNum=3
zkFileName="zookeeper-3.4.9"
baseClientPort=2181
baseProposalPort=2887
baseElectionPort=3887
initFileName="zoo_init.cfg"

for (( i = 0; i < $nodeNum; i++ )); do
  num=`expr $i + 1`
  filePath="$basePath""zookeeper-""$num"
  fileName="$filePath""/conf/zoo.cfg"
  clientPort=`expr $baseClientPort + $i`
  # cp zookeeper文件
  cp -rf "$basePath""$zkFileName""/" "zookeeper-"$num"/"
  # 修改zoo.cfg
  cp $initFileName $fileName
  echo "dataDir=""$filePath""/data" >> $fileName
  echo "clientPort=""$clientPort" >> $fileName
  for (( j = 1; j <= $nodeNum; j++ )); do
    proposalPort=`expr $baseProposalPort + $j - 1`
    electionPort=`expr $baseElectionPort + $j - 1`
    echo "server.""$j""=localhost:""$proposalPort"":""$electionPort" >> $fileName
  done
  # 配置myid
  echo "===  ""$filePath""/data""  ==="
  mkdir -p "$filePath""/data"
  echo $num > "$filePath""/data/myid"
done

echo "====== the zookeeper config end ======"
exit 0;
