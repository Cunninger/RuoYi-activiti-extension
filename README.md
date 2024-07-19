# RuoYi-activiti（VUE版）


#### 软件架构
[若依](http://doc.ruoyi.vip/ruoyi/)是有名的开源权限管理系统，集权限管理和代码快速生成于一体，将其作为基础开发平台集成activiti框架完成工作流引擎开发，打造集流程设计、流程部署、流程执行、任务办理、流程监控于一体的强大工作流平台。
- 在线演示地址http://ryactiviti.ccbpm.cn/

- 加QQ群：824513446

#### 赞助商

- [![驰骋工作流引擎](pic/image.png)](http://ccflow.org/?frm=RY_AC)


#### 安装教程

1. 新建mysql数据库ry-activiti，导入SQL脚本ry-activiti.sql。Mysql版本为5.7，字符集选择utf8mb4，排序规则选择utf8mb4_general_ci。
2. 编译打包后端工程，运行java -jar ruoyi-admin.jar。
3. 前端代码运行 npm run dev。
3. 打开http://localhost/login 访问登录页面,账号admin密码是admin123。

#### 使用说明

1.  为保持平台的通用性，所有的用户任务办理的接口可以复用/task/manage/completeTask/{taskId}。
2.  对于表单的处理，一律使用外置表单，将业务表单数据保存在业务表中，不保存在activiti流程的变量表中。
3.  前端页面与用户任务通过formkey进行关联，办理任务时，通过获取formkey值展示对应的前端页面。
4.  整合流程图在线设计器，设计后需要发布，完成流程的部署。
5.  如需添加新的流程，设计好后还需编写前后端代码完成业务逻辑的开发。
6.  增删改查、权限管理、代码生成、页面交互的基础设施由若依平台提供。
7.  流程实例管理用于管理正在运行的流程实例列表，你可以挂起或唤醒一个流程实例。
8.  流程运行历史用于查看流程的历史记录（包含运行中和已结束），还可以查看所有流程的变量。
9.  支持动态流程，可对流程实例进行撤销、驳回、跳转等操作。 
#### 效果图
- 模型管理和流程设计：

![输入图片说明](pic/%E8%AE%BE%E8%AE%A1%E5%99%A8.gif)


- 请假流程

![输入图片说明](pic/%E8%AF%B7%E5%81%87%E6%B5%81%E7%A8%8B.gif)

- 流程监控

![输入图片说明](pic/%E6%B5%81%E7%A8%8B%E7%9B%91%E6%8E%A7.gif)

- 登录页

![输入图片说明](pic/%E7%99%BB%E5%BD%95.png)

- 流程图在线设计

![输入图片说明](pic/%E6%B5%81%E7%A8%8B%E5%9B%BE%E8%AE%BE%E8%AE%A1%E5%99%A8.png)


- 部署管理

![输入图片说明](pic/%E9%83%A8%E7%BD%B2%E7%AE%A1%E7%90%86.png)


- 功能表

![输入图片说明](pic/%E5%8A%9F%E8%83%BD%E8%A1%A8.png)

- 所有待办任务

![输入图片说明](pic/%E5%85%A8%E9%83%A8%E5%BE%85%E5%8A%9E.png)

- 流程变量监控
![输入图片说明](pic/%E6%B5%81%E7%A8%8B%E5%8F%98%E9%87%8F.png)

- 作业管理
![输入图片说明](pic/%E4%BD%9C%E4%B8%9A%E7%AE%A1%E7%90%86.png)

- 荣誉

![输入图片说明](pic/%E8%8D%A3%E8%AA%89.jpg)
- 技术交流

![输入图片说明](pic/wx.jpg)

### 好书推荐
#### 系统全面学习Elasticsearch
<a href="https://item.m.jd.com/product/13872844.html?gx=RnAomTM2bmHZw5sSrtV0X1UR8iqxJMU&gxd=RnAoy2Fdaj3fy5wdr4V0VNgSE8OMXuDPgPv0y0mTsfJiDQg&ad_od=share&utm_source=androidapp&utm_medium=appshare&utm_campaign=t_335139774&utm_term=CopyURL" target="_blank"><img src="https://gitee.com/shenzhanwang/Spring-elastic_search/raw/master/pic/mmexport1680185330486.jpg" alt="点击购买"></a>

|购买地址|
|--|
|![输入图片说明](https://gitee.com/shenzhanwang/RuoYi-activiti/raw/ruoyi-activiti/pic/%E8%B4%AD%E4%B9%B0.jpg)|

#### 系统学习和深入掌握Activiti/Flowable
<a href="https://item.m.jd.com/product/13928958.html?gx=RnAomTM2bmCImZxDqYAkVCoIHuIYVqc" target="_blank"><img src="https://gitee.com/shenzhanwang/RuoYi-activiti/raw/ruoyi-activiti/pic/ACTIVITI-%E8%B0%83%E6%95%B4.png" alt="点击购买"></a>




### 专利文章
|   | 标题 | 技术领域 |
|---|----|------|
| 1 |  [一种基于微服务架构的车联网大数据分析系统](https://mp.weixin.qq.com/s?__biz=Mzg5MjY3OTk0OQ==&mid=2247484096&idx=1&sn=11677bc50cd18e448135319394238e80&chksm=c03b20a2f74ca9b41c7d1c1e60e1407e1530a98b86498822f387da26e551826f8136663b45a0#rd)  |  微服务|
| 2 |  [一种流式数据场景下Elasticsearch索引的自动化扩容方法](https://mp.weixin.qq.com/s?__biz=Mzg5MjY3OTk0OQ==&mid=2247484167&idx=1&sn=94587b5e196bbda2d6cc4b976b03d0c7&chksm=c03b2165f74ca873b77380a23c4e06b71adf6ffc40634440f467fb71c20aa4cc2fe72a5d65a9#rd)  |  搜索引擎    |
| 3 |  [大数据钻取分析方法、装置、设备及存储介质](https://mp.weixin.qq.com/s?__biz=Mzg5MjY3OTk0OQ==&mid=2247484385&idx=1&sn=6fe4a4ac34badd91db39b4cc042a3f18&chksm=c03b2183f74ca89508333f3d5c8330aa32248eda86e4cf7657a5a293e1bf9d49888fe78b1072#rd)  |  大数据分析    |
| 4 |  [一种基于工作流引擎的自动化办公方法和系统](https://mp.weixin.qq.com/s?__biz=Mzg5MjY3OTk0OQ==&mid=2247484895&idx=1&sn=1094f0b9abef603e8126dea68db75cca&chksm=c03b27bdf74caeab50d56ac110b9ab0d36bc9b9069e311083a5c4295ab03ee4b0595a00a3ba2#rd)  |  工作流引擎    |
| 5 |  [一种低延迟高性能实时数据仓库搭建的方法和系统](https://mp.weixin.qq.com/s?__biz=Mzg5MjY3OTk0OQ==&mid=2247485672&idx=1&sn=ef9b05e32790091f6e984d14624d9560&chksm=c03b2a8af74ca39c24c9354279036148cd72315f22d06ab63649808d70161d8b4f53d38cc5fb&scene=178&cur_album_id=3268880015212085251#rd)  |  实时数仓    |
| 6 |  [一种基于数据治理的大数据中台架构系统](https://mp.weixin.qq.com/s?__biz=Mzg5MjY3OTk0OQ==&mid=2247485875&idx=1&sn=db58f023c92ca01cc1902e7bea806a48&chksm=c03b2bd1f74ca2c7b45f993386f443718a99a378a51d9be827c2e45b326c549a868089fbdd31&scene=178&cur_album_id=3268880015212085251#rd)  |  数据中台    |


### 视频教程

|<div align=left><a href="https://mp.weixin.qq.com/mp/appmsgalbum?__biz=Mzg5MjY3OTk0OQ==&action=getalbum&album_id=3242941519414886404#wechat_redirect" target="_blank">Elasticsearch数据搜索与分析实战（精讲版）</a></div> |
|--|
|<div align=left><a href="https://mp.weixin.qq.com/mp/appmsgalbum?__biz=Mzg5MjY3OTk0OQ==&action=getalbum&album_id=2790222720155451398#wechat_redirect" target="_blank">RuoYi-activiti开发指南</a></div> |


### 附录：中央技术储备仓库（Central Technique Reserve Repository）
1. [Spring boot整合Mybatis实现增删改查（支持多数据源）](https://gitee.com/shenzhanwang/SSM)![输入图片说明](https://img.shields.io/badge/-%E7%B2%BE%E5%93%81-orange.svg "在这里输入图片标题")
2. [Spring,SpringMVC和Hibernate的整合实现增删改查](https://gitee.com/shenzhanwang/SSH)
3. [RuoYi-boot整合activiti工作流引擎实现OA开发](https://gitee.com/shenzhanwang/Spring-activiti)![输入图片说明](https://img.shields.io/badge/-%E6%8B%9B%E7%89%8C-yellow.svg)   
4. [RuoYi-boot集成工作流引擎Flowable实例](https://gitee.com/shenzhanwang/Ruoyi-flowable)![输入图片说明](https://img.shields.io/badge/-%E6%8B%9B%E7%89%8C-yellow.svg) 
5. [Spring发布与调用REST风格的WebService](https://gitee.com/shenzhanwang/Spring-REST)
6. [Spring boot整合Axis调用SOAP风格的web服务](https://gitee.com/shenzhanwang/Spring-axis)
7. [Spring boot整合Apache Shiro实现RBAC权限控制](https://gitee.com/shenzhanwang/Spring-shiro)
8. [使用Spring security实现RBAC权限控制](https://gitee.com/shenzhanwang/spring-security-demo)
9. [Spring boot整合mongoDB文档数据库实现增删改查](https://gitee.com/shenzhanwang/Spring-mongoDB)
10. [Spring连接Redis实现缓存](https://gitee.com/shenzhanwang/Spring-redis)
11. [Spring连接图存数据库Neo4j实现增删改查](https://gitee.com/shenzhanwang/Spring-neo4j)
12. Spring boot整合列存数据库hbase实现增删改查
13. [Spring平台整合消息队列ActiveMQ实现发布订阅、生产者消费者模型（JMS）](https://gitee.com/shenzhanwang/Spring-activeMQ)
14. [Spring boot整合消息队列RabbitMQ实现四种消息模式（AMQP）](https://gitee.com/shenzhanwang/Spring-rabbitMQ)
15. Spring boot整合kafka 2.1.0实现大数据消息管道
16. [Spring boot整合websocket实现即时通讯](https://gitee.com/shenzhanwang/Spring-websocket)![输入图片说明](https://img.shields.io/badge/-%E7%B2%BE%E5%93%81-orange.svg "在这里输入图片标题")
17. [Spring security整合oauth2实现token认证](https://gitee.com/shenzhanwang/Spring-security-oauth2)
18. [Spring boot整合MinIO客户端实现文件管理](https://gitee.com/shenzhanwang/Spring-minio)
19. 23种设计模式，源码、注释、使用场景 
20. [使用ETL工具Kettle的实例](https://gitee.com/shenzhanwang/Kettle-demo)
21. Git指南和分支管理策略 
22. 使用Apache Doris搭建实时数仓
23. [zookeeper原理、架构、使用场景和可视化](https://gitee.com/shenzhanwang/zookeeper-practice)
24. Spring boot整合Apache dubbo v2.7.5实现分布式服务治理（SOA架构） ![输入图片说明](https://img.shields.io/badge/-%E7%B2%BE%E5%93%81-orange.svg "在这里输入图片标题") 
25. 使用Spring Cloud Alibaba v2.2.7实现微服务架构（MSA架构）![输入图片说明](https://img.shields.io/badge/-%E6%8B%9B%E7%89%8C-yellow.svg)   
26. 使用Apache Paimon搭建流式数据湖
27. 使用kubernetes+docker+gitlab+spring cloud实现云服务的持续集成和动态扩容
28. 使用Spark进行分布式计算
29. 使用Flink实现流批一体化的分布式计算
30. 搭建高可用nginx集群和Tomcat负载均衡 
31. 使用mycat实现Mysql数据库的主从复制、读写分离、分表分库、负载均衡和高可用 
32. [《Elasticsearch数据搜索与分析实战》源码](https://gitee.com/shenzhanwang/Spring-elastic_search) ![输入图片说明](https://img.shields.io/badge/-%E6%8B%9B%E7%89%8C-yellow.svg "在这里输入图片标题")
33. 基于可靠消息最终一致性实现分布式事务（activeMQ）
34. Spring boot dubbo整合seata实现分布式事务![输入图片说明](https://img.shields.io/badge/-%E7%B2%BE%E5%93%81-orange.svg "在这里输入图片标题")
35. Spring cloud alibaba 整合seata实现分布式事务 ![输入图片说明](https://img.shields.io/badge/-%E7%B2%BE%E5%93%81-orange.svg "在这里输入图片标题")
36. 并发控制：数据库锁机制和事务隔离级别的实现![输入图片说明](https://img.shields.io/badge/-%E7%B2%BE%E5%93%81-orange.svg "在这里输入图片标题") 
37. 并发控制：使用redission实现分布式锁 
38. 并发控制：使用zookeeper实现分布式锁 
39. 并发控制：Java多线程编程实例
40. 并发控制：使用netty实现高性能NIO通信 


### 关注微信公众号获取更多技术文章和源码

![输入图片说明](https://gitee.com/shenzhanwang/Spring-elastic_search/raw/master/pic/qrcode_for_gh_4c2318bb0f7f_258.jpg)
