# 实验室集训项目：红色课程网站

## 项目概述

原生开发，宣传红色主题的课程网站，可以查看、发布文章，上传视频、图片。用户可以注册登录，修改个人信息，有评论功能，可以用搜索栏搜索文章。管理员可以登录后台页面，管理用户信息，管理上传的资源。

## 源码



管理员账号：admin 密码：admin

## 技术栈

Tomcat+Maven+Mysql+Jsp

## 项目核心业务

分析项目的功能需求，画出核心业务图

![image-20220831194224519](D:\AppData\Typora\typora-user-images\image-20220831194224519.png)

## 数据库设计

分析项目用到的实体，我设计了以下6个表

用户user表

![image-20220831193121899](D:\AppData\Typora\typora-user-images\image-20220831193121899.png)

文章article表

![image-20220831193154213](D:\AppData\Typora\typora-user-images\image-20220831193154213.png)

文章信息articlemsg表(功能未完成)

![image-20220831194346201](D:\AppData\Typora\typora-user-images\image-20220831194346201.png)

课程course表

![image-20220831194433213](D:\AppData\Typora\typora-user-images\image-20220831194433213.png)

图片picture表

![image-20220831194448358](D:\AppData\Typora\typora-user-images\image-20220831194448358.png)

评论comment表

![image-20220831194407077](D:\AppData\Typora\typora-user-images\image-20220831194407077.png)

为了保证数据的完整性，我在几个表之间设置了外键约束，约束方式为CASCADE级联，当父表执行更新和删除操作时，其子表也执行相应的操作（从父表中进行的操作），如下：

![image-20220831194909783](D:\AppData\Typora\typora-user-images\image-20220831194909783.png)

![image-20220831194925977](D:\AppData\Typora\typora-user-images\image-20220831194925977.png)

## 项目结构

项目采用了mvc设计模式分层设计

![image-20220831195152891](D:\AppData\Typora\typora-user-images\image-20220831195152891.png)![image-20220831195207478](D:\AppData\Typora\typora-user-images\image-20220831195207478.png)

## 设计思路

### 前端页面编写

参考了网上部分开源项目的前端布局方式，大部分用到了flex布局。下拉选项部分功能和后台页面布局套用了layui框架，其他均为原生开发

![image-20220901143333105](D:\AppData\Typora\typora-user-images\image-20220901143333105.png)

### 轮播图

轮播图用到了JQuery，使用classList向每一个类中添加类名，如下图a-img-ban类下的对象透明度样式为0，不可见，添加img-ban-curr样式的透明度为1，可见。再加上点击切换、定时切换等功能，轮播图的效果就实现了

![image-20220901143514273](D:\AppData\Typora\typora-user-images\image-20220901143514273.png)

### 用户登录

我使用session+Filter的方法设计登录功能

jsp页面通过表单访问到loginServlet，获取request域中的用户名和密码，调用用户service进行登录，查找数据库验证成功则在session加入对象，否则返回错误提示消息

![image-20220831200656485](D:\AppData\Typora\typora-user-images\image-20220831200656485.png)

![image-20220831200120128](D:\AppData\Typora\typora-user-images\image-20220831200120128.png)

![image-20220831200626465](D:\AppData\Typora\typora-user-images\image-20220831200626465.png)

Filter对用户操作进行拦截，如果请求的session中没有user对象，则拦截并将其重定向到登录页面（同时放行登陆页面和相关的资源如css、js）。如果session存在该user对象，则放行。

![image-20220831200528857](D:\AppData\Typora\typora-user-images\image-20220831200528857.png)

### 用户注册

servlet获取参数调用用户service

![image-20220831203740663](D:\AppData\Typora\typora-user-images\image-20220831203740663.png)

service判断用户名密码是否有效，再发送给dao，更新数据库

![image-20220831203915025](D:\AppData\Typora\typora-user-images\image-20220831203915025.png)

### 查看/修改个人信息

进入个人中心页面时向servlet发送请求，servlet获取session的用户，查询数据库，传值转发回jsp再用el表达式和jstl标签展示数据

![image-20220831201445813](D:\AppData\Typora\typora-user-images\image-20220831201445813.png)

![image-20220831201540980](D:\AppData\Typora\typora-user-images\image-20220831201540980.png)

修改个人信息将新内容填入表单，servlet根据name属性获取相应信息，调用用户service，用update语句更新数据库

![image-20220831201819533](D:\AppData\Typora\typora-user-images\image-20220831201819533.png)

![image-20220831201829225](D:\AppData\Typora\typora-user-images\image-20220831201829225.png)

### 上传文章

方法和之前大同小异，jsp页面将文章的标题和内容放在form表单中，servlet通过session获取作者姓名（访问发布文章页要经过fliter登陆检查，所以此时session一定有值），用JavaScript获取当前时间

![image-20220831202517647](D:\AppData\Typora\typora-user-images\image-20220831202517647.png)

![image-20220831202656324](D:\AppData\Typora\typora-user-images\image-20220831202656324.png)

### 评论功能

为了评论分级的考虑，设计数据库时我把评论comment表设计了文章id、评论用户id、被评论用户id等几个字段，访问一篇文章时对应的评论也会被获取到，被评论用户id用于分级，如果该字段为空就是一级评论，否则就从一级评论依次递增

![image-20220831205129196](D:\AppData\Typora\typora-user-images\image-20220831205129196.png)

![image-20220831205228558](D:\AppData\Typora\typora-user-images\image-20220831205228558.png)

### 查看文章

这里使用了url传值的方式，点击文章跳转的href带有参数文章id，jsp在request域获取文章id，查找成功后转发到文章详情页，若不成功，返回错误提示信息

![image-20220831203105599](D:\AppData\Typora\typora-user-images\image-20220831203105599.png)

### 搜索功能

![image-20220831203213394](D:\AppData\Typora\typora-user-images\image-20220831203213394.png)

用到了sql语句的模糊查询语句

"%" 百分号通配符: 表示任何字符出现任意次数 (可以是0次)

like操作符:LIKE作用是指示mysql后面的搜索模式是利用通配符而不是直接相等匹配进行比较；但如果like后面没出现通配符，则在SQL执行优化时将 like 默认为 “=”执行

![image-20220831203354741](D:\AppData\Typora\typora-user-images\image-20220831203354741.png)

### 上传图片/视频

上传文件jsp需要设置input的type属性为file，后台需要用到fileupload库

![image-20220831204315391](D:\AppData\Typora\typora-user-images\image-20220831204315391.png)

![image-20220831204322729](D:\AppData\Typora\typora-user-images\image-20220831204322729.png)

### 后台管理

进入后台管理界面之前需要验证当前用户权限，权限不够则会被拦截

管理员可以对用户、文章、图片、视频进行管理

如删除：通过url传值带相应的id参数，发送到servlet，sql中用delete语句删除数据

![image-20220831205709997](D:\AppData\Typora\typora-user-images\image-20220831205709997.png)

步骤如下：

1. 创建文件上传处理器
2. 解析请求信息
3. 对请求信息（格式）进行判断
4. 获取路径和文件名
5. 存储文件

![image-20220831204135584](D:\AppData\Typora\typora-user-images\image-20220831204135584.png)

## 部署上线

详情见我的博客：[JavaWeb项目部署上线操作过程（云服务器+宝塔面板+Tomcat）](https://blog.csdn.net/m0_61570551/article/details/126632535?spm=1001.2014.3001.5501)

## 遇到的问题和难点

- 页面404问题，找不到资源，检查自己的资源访问路径有没有问题，检查tomcat设置，我这里application context一栏设置为空，就默认访问根目录

![image-20220901135159038](D:\AppData\Typora\typora-user-images\image-20220901135159038.png)

- servlet中doGet和doPost的差异，一开始我只给servlet编写了doPost的方法，因为表单默认方法为post，但是如果通过href的方式访问servlet，由于href默认方法为get，就要重新编写servlet的doGet方法。为了屏蔽doGet和doPost的差异，我在doGet方法下调用doPost即可解决
- jsp页面接收并展示后台传值要写很多java代码，造成不美观，编写复杂，所以使用了el表达式+jstl的方式简化了jsp页面（虽然是很基础的方法，但我之前并不知道这个技术，给我造成了很多麻烦……），详情见我的博客：[EL表达式和JSTL标签：简化JSP的Java代码](https://blog.csdn.net/m0_61570551/article/details/126632403)
- servlet和jsp之间传值的问题，为什么有时候传值为null，有时候为空字符串，什么时候需要强转，详情见我的博客：[Jsp和Servlet之间的交互传值](https://blog.csdn.net/m0_61570551/article/details/126632458?spm=1001.2014.3001.5501)
- mysql有默认值的字段在代码中值仍为null，发现是因为实体类中没有初始值，所以新建实体的时候默认值为null，所以要在实体类中赋值对应的初始值

## 总结和收获

做项目是学习技术、巩固知识效率最高的方式，很多问题只有通过编写代码亲身经历才能理解。虽然这个项目不完美，存在着很多问题，部分功能还不完善，但是是即将大二的我学习计算机以来做出的第一个项目，也是对暑期实验室集训的总结和拓展。通过这个项目，我对暑假集训的Tomcat、Maven、Mysql、Jsp等技术有了更深的理解，代码能力也得到了提高，对如何做出一个Java项目也有了一定的了解，能够以更加全局的眼光来看待一个项目。

通过这个暑假的学习，对我来说最大的收获就是自学能力的养成，遇到复杂的问题去寻找更佳的解决方法，面对不了解的技术看文档、看教程学习。持续学习，提高自己，希望能在这条路上走得更远。
