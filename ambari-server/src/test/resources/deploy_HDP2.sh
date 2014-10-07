# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

HOST=dev01.hortonworks.com

curl -i -X POST -d '{"Clusters": {"version" : "HDP-2.0.1"}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------Cluster-----------------------"
curl -i -X POST -d '[{"ServiceInfo":{"service_name":"HDFS"}},{"ServiceInfo":{"service_name":"YARN"}}, {"ServiceInfo":{"service_name":"MAPREDUCEv2"}}, {"ServiceInfo":{"service_name":"TEZ"}}]' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services
echo "-----------------------Services-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"global","tag":"version1","properties":{"hive_lib":"/usr/lib/hive/lib/","hadoop_heapsize":"1024","hive_log_dir":"/var/log/hive","dfs_datanode_http_address":"50075","zk_user":"zookeeper","dfs_data_dir":"/grid/0/hadoop/hdfs/data,/grid/1/hadoop/hdfs/data","clientPort":"2181","hdfs_user":"hdfs","hive_dbroot":"/usr/lib/hive/lib","dfs_name_dir":"/grid/0/hadoop/hdfs/namenode,/grid/1/hadoop/hdfs/namenode","hfile_blockcache_size":"0.25","kadmin_pw":"","gmond_user":"nobody","hregion_majorcompaction":"86400000","user_group":"hadoop","dfs_datanode_failed_volume_tolerated":"0","zk_pid_file":"/var/run/zookeeper/zookeeper_server.pid","zookeeper_sessiontimeout":"60000","hcat_user":"hcat","zk_log_dir":"/var/log/zookeeper","oozie_derby_database":"Derby","hbase_conf_dir":"/etc/hbase","oozie_data_dir":"/grid/0/hadoop/oozie/data","dfs_replication":"3","fs_checkpoint_period":"21600","hive_database_type":"mysql","hbase_hdfs_root_dir":"/apps/hbase/data","run_dir":"/var/run/hadoop","oozie_log_dir":"/var/log/oozie","hbase_pid_dir":"/var/run/hbase","hive_user":"hive","security_enabled":"false","dfs_datanode_address":"50010","dfs_block_local_path_access_user":"hbase","dfs_datanode_data_dir_perm":"750","nagios_web_password":"admin","dtnode_heapsize":"1024m","tickTime":"2000","oozie_database":"New Derby Database","regionserver_memstore_upperlimit":"0.4","datanode_du_reserved":"1","hbase_tmp_dir":"/var/log/hbase","java64_home":"/usr/jdk/jdk1.6.0_31","oozie_user":"oozie","hive_metastore_port":"9083","namenode_heapsize":"1024m","nagios_contact":"a@d.m","oozie_JPAService_url":"${oozie.data.dir}/${oozie.db.schema.name}-db;create\u003dtrue","hive_ambari_database":"MySQL","oozie_jdbc_driver":"org.apache.derby.jdbc.EmbeddedDriver","zk_data_dir":"/grid/0/hadoop/zookeeper","hive_pid_dir":"/var/run/hive","mysql_connector_url":"${download_url}/mysql-connector-java-5.1.18.zip","hregion_blockmultiplier":"2","oozie_pid_dir":"/var/run/oozie","gpl_artifacts_download_url":"","gmetad_user":"nobody","oozie_metastore_user_name":"oozie","hive_metastore_user_passwd":"admin","hcat_log_dir":"/var/log/webhcat","hive_hostname":"HOST","syncLimit":"5","mapred_user":"mapred","fs_checkpoint_size":"0.5","initLimit":"10","hive_database":"New MySQL Database","hive_jdbc_driver":"com.mysql.jdbc.Driver","hive_conf_dir":"/etc/hive/conf","hdfs_log_dir_prefix":"/var/log/hadoop","keytab_path":"/etc/security/keytabs","proxyuser_group":"users","hive_database_name":"hive","client_scannercaching":"100","hcat_pid_dir":"/var/run/webhcat","hdfs_enable_shortcircuit_read":"true","kerberos_domain":"EXAMPLE.COM","nagios_group":"nagios","hdfs_support_append":"true","nagios_web_login":"nagiosadmin","oozie_database_type":"derby","namenode_formatted_mark_dir":"/var/run/hadoop/hdfs/namenode/formatted/","dfs_exclude":"dfs.exclude","namenode_opt_maxnewsize":"640m","oozie_database_name":"oozie","regionserver_memstore_lab":"true","namenode_opt_newsize":"200m","smokeuser":"ambari-qa","nagios_user":"nagios","hcat_conf_dir":"","regionserver_memstore_lowerlimit":"0.35","apache_artifacts_download_url":"","hive_metastore_user_name":"hive","hstore_blockingstorefiles":"7","hadoop_conf_dir":"/etc/hadoop","oozie_metastore_user_passwd":"admin","hbase_user":"hbase","ganglia_runtime_dir":"/var/run/ganglia/hdp","fs_checkpoint_dir":"/grid/0/hadoop/hdfs/namesecondary","zk_pid_dir":"/var/run/zookeeper","hfile_max_keyvalue_size":"10485760","hive_aux_jars_path":"/usr/lib/hcatalog/share/hcatalog/hcatalog-core.jar","hstore_compactionthreshold":"3","hregion_memstoreflushsize":"134217728","hadoop_pid_dir_prefix":"/var/run/hadoop","hbase_log_dir":"/var/log/hbase","webhcat_user":"hcat","regionserver_handlers":"30","hbase_regionserver_heapsize":"1024m","dfs_include":"dfs.include","dfs_webhdfs_enabled":"true","rrdcached_base_dir":"/var/lib/ganglia/rrds","hstorefile_maxsize":"1073741824","hbase_master_heapsize":"1024m"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------Global configs-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"core-site","tag":"version1","properties":{"io.file.buffer.size":"131072","io.serializations":"org.apache.hadoop.io.serializer.WritableSerialization","io.compression.codecs":"","io.compression.codec.lzo.class":"com.hadoop.compression.lzo.LzoCodec","fs.default.name":"hdfs://HOST:8020","fs.trash.interval":"360","fs.checkpoint.dir":"","fs.checkpoint.edits.dir":"${fs.checkpoint.dir}","fs.checkpoint.period":"21600","fs.checkpoint.size":"536870912","ipc.client.idlethreshold":"8000","ipc.client.connection.maxidletime":"30000","ipc.client.connect.max.retries":"50","webinterface.private.actions":"false","hadoop.security.authentication":"","hadoop.security.authorization":"","hadoop.security.auth_to_local":""}}}}' | sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------core-site-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"hdfs-site","tag":"version1","properties":{"dfs.name.dir":"","dfs.support.append":"true","dfs.webhdfs.enabled":"true","dfs.datanode.failed.volumes.tolerated":"0","dfs.block.local-path-access.user":"hbase","dfs.data.dir":"","dfs.hosts.exclude":"","dfs.checksum.type":"CRC32","dfs.replication.max":"50","dfs.replication":"3","dfs.heartbeat.interval":"3","dfs.heartbeat.interval":"3","dfs.safemode.threshold.pct":"1.0f","dfs.balance.bandwidthPerSec":"6250000","dfs.datanode.address":"0.0.0.0:50010","dfs.datanode.http.address":"0.0.0.0:50075","dfs.block.size":"134217728","dfs.http.address":"","dfs.datanode.du.reserved":"1073741824","dfs.datanode.ipc.address":"0.0.0.0:8010","dfs.blockreport.initialDelay":"120","dfs.namenode.handler.count":"40","dfs.datanode.max.xcievers":"1024","dfs.umaskmode":"022","dfs.web.ugi":"gopher,gopher","dfs.permissions":"true","dfs.permissions.supergroup":"hdfs","dfs.namenode.handler.count":"100","ipc.server.max.response.size":"5242880","dfs.block.access.token.enable":"true","dfs.namenode.kerberos.principal":"","dfs.secondary.namenode.kerberos.principal":"","dfs.namenode.kerberos.https.principal":"","dfs.secondary.namenode.kerberos.https.principal":"","dfs.secondary.http.address":"","dfs.secondary.https.port":"50490","dfs.web.authentication.kerberos.principal":"","dfs.web.authentication.kerberos.keytab":"","dfs.datanode.kerberos.principal":"","dfs.namenode.keytab.file":"","dfs.secondary.namenode.keytab.file":"","dfs.datanode.keytab.file":"","dfs.https.port":"50470","dfs.https.address":"","dfs.datanode.data.dir.perm":"750","dfs.access.time.precision":"0","dfs.cluster.administrators":"hdfs","ipc.server.read.threadpool.size":"5"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------hdfs-site-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"capacity-scheduler","tag":"version1","properties":{"yarn.scheduler.capacity.maximum-applications":"10000","yarn.scheduler.capacity.maximum-am-resource-percent":"0.1","yarn.scheduler.capacity.root.queues":"default","yarn.scheduler.capacity.root.capacity":"100","yarn.scheduler.capacity.root.default.capacity":"100","yarn.scheduler.capacity.root.default.user-limit-factor":"1","yarn.scheduler.capacity.root.default.maximum-capacity":"100","yarn.scheduler.capacity.root.default.state":"RUNNING","yarn.scheduler.capacity.root.default.acl_submit_jobs":"*","yarn.scheduler.capacity.root.default.acl_administer_jobs":"*","yarn.scheduler.capacity.root.acl_administer_queues":"*"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------capacity-scheduler-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"mapred-queue-acls","tag":"version1","properties":{"mapred.queue.default.acl-submit-job":"*","mapred.queue.default.acl-administer-jobs":"*"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------mapred-queue-acls-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"mapred-site","tag":"version1","properties":{"io.sort.mb":"","io.sort.record.percent":".2","io.sort.spill.percent":"","io.sort.factor":"100","mapred.tasktracker.tasks.sleeptime-before-sigkill":"250","mapred.job.tracker.handler.count":"50","mapred.system.dir":"/mapred/system","mapred.job.tracker":"","mapred.job.tracker.http.address":"","mapred.local.dir":"","mapreduce.cluster.administrators":"hadoop","mapred.reduce.parallel.copies":"30","mapred.tasktracker.map.tasks.maximum":"","mapred.tasktracker.reduce.tasks.maximum":"","tasktracker.http.threads":"50","mapred.map.tasks.speculative.execution":"false","mapred.reduce.tasks.speculative.execution":"false","mapred.reduce.slowstart.completed.maps":"0.05","mapred.inmem.merge.threshold":"1000","mapred.job.shuffle.merge.percent":"0.66","mapred.job.shuffle.input.buffer.percent":"0.7","mapred.map.output.compression.codec":"","mapred.output.compression.type":"BLOCK","mapred.jobtracker.completeuserjobs.maximum":"0","mapred.jobtracker.taskScheduler":"","mapred.jobtracker.restart.recover":"false","mapred.job.reduce.input.buffer.percent":"0.0","mapreduce.reduce.input.limit":"10737418240","mapred.compress.map.output":"","mapred.task.timeout":"600000","jetty.connector":"org.mortbay.jetty.nio.SelectChannelConnector","mapred.task.tracker.task-controller":"","mapred.child.root.logger":"INFO,TLA","mapred.child.java.opts":"","mapred.cluster.map.memory.mb":"","mapred.cluster.reduce.memory.mb":"","mapred.job.map.memory.mb":"","mapred.job.reduce.memory.mb":"","mapred.cluster.max.map.memory.mb":"","mapred.cluster.max.reduce.memory.mb":"","mapred.hosts":"","mapred.hosts.exclude":"","mapred.max.tracker.blacklists":"16","mapred.healthChecker.script.path":"","mapred.healthChecker.interval":"135000","mapred.healthChecker.script.timeout":"60000","mapred.job.tracker.persist.jobstatus.active":"false","mapred.job.tracker.persist.jobstatus.hours":"1","mapred.job.tracker.persist.jobstatus.dir":"","mapred.jobtracker.retirejob.check":"10000","mapred.jobtracker.retirejob.interval":"0","mapred.job.tracker.history.completed.location":"/mapred/history/done","mapred.task.maxvmem":"","mapred.jobtracker.maxtasks.per.job":"","mapreduce.fileoutputcommitter.marksuccessfuljobs":"false","mapred.userlog.retain.hours":"","mapred.job.reuse.jvm.num.tasks":"1","mapreduce.jobtracker.kerberos.principal":"","mapreduce.tasktracker.kerberos.principal":"","hadoop.job.history.user.location":"none","mapreduce.jobtracker.keytab.file":"","mapreduce.tasktracker.keytab.file":"","mapreduce.jobtracker.staging.root.dir":"/user","mapreduce.tasktracker.group":"hadoop","mapreduce.jobtracker.split.metainfo.maxsize":"50000000","mapreduce.history.server.embedded":"false","mapreduce.history.server.http.address":"","mapreduce.jobhistory.kerberos.principal":"","mapreduce.jobhistory.keytab.file":"","mapred.jobtracker.blacklist.fault-timeout-window":"180","mapred.jobtracker.blacklist.fault-bucket-width":"15","mapred.queue.names":"default","mapreduce.shuffle.port":"8081","mapreduce.jobhistory.intermediate-done-dir" : "/mr-history/tmp","mapreduce.jobhistory.done-dir" : "/mr-history/done"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------mapred-site-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"yarn-site","tag":"version1","properties":{"yarn.resourcemanager.resource-tracker.address":"HOST:8025","yarn.resourcemanager.scheduler.address":"HOST:8030","yarn.resourcemanager.address":"HOST:8050","yarn.resourcemanager.admin.address":"HOST:8141","yarn.resourcemanager.scheduler.class":"org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler","yarn.scheduler.minimum-allocation-mb":"1024","yarn.scheduler.maximum-allocation-mb":"8192","yarn.nodemanager.address":"0.0.0.0:45454","yarn.nodemanager.local-dirs":"/yarn/loc/dir","yarn.nodemanager.resource.memory-mb":"8192","yarn.application.classpath":"/etc/hadoop/conf,/usr/lib/hadoop/*,/usr/lib/hadoop/lib/*,/usr/lib/hadoop-hdfs/*,/usr/lib/hadoop-hdfs/lib/*,/usr/lib/hadoop-yarn/*,/usr/lib/hadoop-yarn/lib/*,/usr/lib/hadoop-mapreduce/*,/usr/lib/hadoop-mapreduce/lib/*,/usr/lib/ambari-server/*","yarn.nodemanager.vmem-pmem-ratio":"2.1","yarn.nodemanager.container-executor.class":"org.apache.hadoop.yarn.server.nodemanager.DefaultContainerExecutor","yarn.nodemanager.aux-services":"mapreduce.shuffle","yarn.nodemanager.aux-services.class":"org.apache.hadoop.mapred.ShuffleHandler","yarn.nodemanager.log-dirs":"/var/log/hadoop-yarn/yarn","yarn.nodemanager.container-monitor.interval-ms":"3000","yarn.nodemanager.health-checker.script.path":"/etc/hadoop/conf/health_check","yarn.nodemanager.health-checker.interval-ms":"135000","yarn.nodemanager.health-checker.script.timeout-ms":"60000","yarn.nodemanager.log.retain-second":"604800","yarn.log-aggregation-enable":"true","yarn.nodemanager.remote-app-log-dir":"/app-logs","yarn.nodemanager.remote-app-log-dir-suffix":"logs","yarn.nodemanager.log-aggregation.compression-type":"gz","yarn.nodemanager.delete.debug-delay-sec":"36000"}}}}'| sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------yarn-site-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"hive-site","tag":"version1","properties":{"hive.security.authorization.manager":"org.apache.hcatalog.security.HdfsAuthorizationProvider","hive.metastore.warehouse.dir":"/apps/hive/warehouse","hive.metastore.execute.setugi":"true","javax.jdo.option.ConnectionDriverName":"com.mysql.jdbc.Driver","hive.security.authorization.enabled":"true","hadoop.clientside.fs.operations":"true","fs.hdfs.impl.disable.cache":"true","hive.server2.enable.doAs":"true","hive.metastore.client.socket.timeout":"60","hive.metastore.cache.pinobjtypes":"Table,Database,Type,FieldSchema,Order","hive.metastore.local":"false","javax.jdo.option.ConnectionUserName":"hive","javax.jdo.option.ConnectionPassword":"admin","hive.metastore.uris":"thrift://HOST:9083","javax.jdo.option.ConnectionURL":"jdbc:mysql://HOST/hive?createDatabaseIfNotExist=true"}}}}'| sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------hive-site-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"webhcat-site","tag":"version1","properties":{"templeton.hcat":"/usr/bin/hcat","templeton.storage.class":"org.apache.hcatalog.templeton.tool.ZooKeeperStorage","templeton.jar":"/usr/lib/hcatalog/share/webhcat/svr/webhcat.jar","templeton.streaming.jar":"hdfs:///apps/webhcat/hadoop-streaming.jar","templeton.exec.timeout":"60000","templeton.hive.properties":"hive.metastore.local\u003dfalse,hive.metastore.uris\u003dthrift://HOST:9083,hive.metastore.sasl.enabled\u003dyes,hive.metastore.execute.setugi\u003dtrue","templeton.override.enabled":"false","templeton.pig.path":"pig.tar.gz/pig/bin/pig","templeton.hive.archive":"hdfs:///apps/webhcat/hive.tar.gz","templeton.port":"50111","templeton.libjars":"/usr/lib/zookeeper/zookeeper.jar","templeton.hadoop":"/usr/bin/hadoop","templeton.pig.archive":"hdfs:///apps/webhcat/pig.tar.gz","templeton.zookeeper.hosts":"HOST:2181","templeton.hive.path":"hive.tar.gz/hive/bin/hive","templeton.hadoop.conf.dir":"/etc/hadoop/conf"}}}}'| sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------webhcat-site-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"oozie-site","tag":"version1","properties":{"oozie.service.AuthorizationService.security.enabled":"true","oozie.service.PurgeService.purge.interval":"3600","oozie.service.PurgeService.older.than":"30","oozie.system.id":"oozie-${user.name}","oozie.service.coord.normal.default.timeout":"120","oozie.service.JPAService.pool.max.active.conn":"10","oozie.authentication.type":"simple","use.system.libpath.for.mapreduce.and.pig.jobs":"false","oozie.service.CallableQueueService.callable.concurrency":"3","oozie.service.CallableQueueService.threads":"10","oozie.base.url":"http://HOST:11000/oozie","oozie.service.CallableQueueService.queue.size":"1000","oozie.service.JPAService.jdbc.username":"oozie","oozie.authentication.kerberos.name.rules":"\n        RULE:[2:$1@$0]([jt]t@.*TODO-KERBEROS-DOMAIN)s/.*/TODO-MAPREDUSER/\n        RULE:[2:$1@$0]([nd]n@.*TODO-KERBEROS-DOMAIN)s/.*/TODO-HDFSUSER/\n        RULE:[2:$1@$0](hm@.*TODO-KERBEROS-DOMAIN)s/.*/TODO-HBASE-USER/\n        RULE:[2:$1@$0](rs@.*TODO-KERBEROS-DOMAIN)s/.*/TODO-HBASE-USER/\n        DEFAULT\n        ","oozie.service.SchemaService.wf.ext.schemas":"shell-action-0.1.xsd,email-action-0.1.xsd,hive-action-0.2.xsd,sqoop-action-0.2.xsd,ssh-action-0.1.xsd,distcp-action-0.1.xsd,hive-action-0.3.xsd","oozie.service.HadoopAccessorService.nameNode.whitelist":" ","oozie.service.WorkflowAppService.system.libpath":"/user/${user.name}/share/lib","oozie.systemmode":"NORMAL","oozie.service.JPAService.create.db.schema":"false","oozie.service.JPAService.jdbc.password":"admin","oozie.service.HadoopAccessorService.jobTracker.whitelist":" ","oozie.db.schema.name":"oozie","oozie.service.JPAService.jdbc.url":"jdbc:derby:${oozie.data.dir}/${oozie.db.schema.name}-db;create\u003dtrue","oozie.service.JPAService.jdbc.driver":"org.apache.derby.jdbc.EmbeddedDriver","oozie.service.HadoopAccessorService.hadoop.configurations":"*\u003d/etc/hadoop/conf","oozie.service.ActionService.executor.ext.classes":"\n            org.apache.oozie.action.email.EmailActionExecutor,\n            org.apache.oozie.action.hadoop.HiveActionExecutor,\n            org.apache.oozie.action.hadoop.ShellActionExecutor,\n            org.apache.oozie.action.hadoop.SqoopActionExecutor,\n            org.apache.oozie.action.hadoop.DistcpActionExecutor\n        "}}}}'| sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------oozie-site-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"capacity-scheduler","tag":"version1", "properties":{"yarn.scheduler.capacity.maximum-applications":"10000","yarn.scheduler.capacity.maximum-am-resource-percent":"0.1", "yarn.scheduler.capacity.root.queues":"default","yarn.scheduler.capacity.root.capacity":"100", "yarn.scheduler.capacity.root.default.capacity":"100","yarn.scheduler.capacity.root.default.user-limit-factor":"1", "yarn.scheduler.capacity.root.default.maximum-capacity":"100": "yarn.scheduler.capacity.root.default.state":"RUNNING","yarn.scheduler.capacity.root.default.acl_submit_jobs":"*", "yarn.scheduler.capacity.root.default.acl_administer_jobs":"*", "yarn.scheduler.capacity.root.acl_administer_queues":"*"}}}}'| sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------capacity-sscheduler-----------------------"
curl -i -X POST -d '[{"ServiceInfo":{"service_name":"HIVE"}},{"ServiceInfo":{"service_name":"HCATALOG"}},{"ServiceInfo":{"service_name":"WEBHCAT"}}]' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services



curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"NAMENODE"}},{"ServiceComponentInfo":{"component_name":"SECONDARY_NAMENODE"}},{"ServiceComponentInfo":{"component_name":"DATANODE"}},{"ServiceComponentInfo":{"component_name":"HDFS_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=HDFS
echo "-----------------------HDFS components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"RESOURCEMANAGER"}},{"ServiceComponentInfo":{"component_name":"NODEMANAGER"}},{"ServiceComponentInfo":{"component_name":"YARN_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=YARN
echo "-----------------------YARN components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"HISTORYSERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=MAPREDUCEv2
echo "-----------------------MAPREDUCEv2 components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"TEZ_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=TEZ
echo "-----------------------TEZ components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"HIVE_CLIENT"}},{"ServiceComponentInfo":{"component_name":"MYSQL_SERVER"}},{"ServiceComponentInfo":{"component_name":"HIVE_SERVER"}},{"ServiceComponentInfo":{"component_name":"HIVE_METASTORE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=HIVE
echo "-----------------------HIVE components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"HCAT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=HCATALOG
echo "-----------------------HCATALOG components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"WEBHCAT_SERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=WEBHCAT
echo "-----------------------HCATALOG components-----------------------"

curl -i -X POST -d `echo '[{"Hosts":{"host_name":"HOST"}}]' | sed s/HOST/$HOST/` -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts
echo "-----------------------Hosts-----------------------"
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"NAMENODE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"SECONDARY_NAMENODE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"DATANODE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HDFS_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"RESOURCEMANAGER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"NODEMANAGER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"YARN_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HISTORYSERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"TEZ_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HIVE_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"MYSQL_SERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HIVE_SERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HIVE_METASTORE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HCAT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"WEBHCAT_SERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
echo "-----------------------Components to hosts-----------------------"

curl -i -X PUT -d  '{"RequestInfo": {"context" :"Installing Services"}, "Body": {"ServiceInfo": {"state": "INSTALLED"}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/state=INIT
echo "-----------------------Installation requested-----------------------"

#curl -i -X PUT -d  '{"RequestInfo": {"context" :"Starting Services"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/state=INSTALLED
