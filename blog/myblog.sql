/*
Navicat MySQL Data Transfer

Source Server         : feige
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-02-25 15:24:37
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(15) NOT NULL,
  `password` varchar(18) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_name` (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '123456');

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `change_time` datetime NOT NULL,
  `author` varchar(15) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `typeName` (`type_name`),
  KEY `author` (`author`),
  CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `admin` (`admin_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `typeName` FOREIGN KEY (`type_name`) REFERENCES `type` (`type_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'springboot', 'springboot入门', 'springb自动装配', '2020-02-23 13:43:36', '2020-02-23 19:06:48', 'admin', '0');
INSERT INTO `blog` VALUES ('2', 'mybatis', '等待', '得到的', '2020-02-23 18:05:36', '2020-02-23 18:05:36', 'admin', '3');
INSERT INTO `blog` VALUES ('4', 'springMVC', '啊', '##飞哥', '2020-02-23 18:10:09', '2020-02-25 14:42:23', 'admin', '111');
INSERT INTO `blog` VALUES ('5', 'springboot', '人', '嗯嗯', '2020-02-23 19:07:20', '2020-02-23 19:07:20', 'admin', '2');
INSERT INTO `blog` VALUES ('6', 'mybatis', 'mybatis入门', '<h2>1、Mybatis简介</h2>\r\n<p><img src=\"https://blog.kuangstudy.com/usr/uploads/2019/10/1296229149.png\" referrerpolicy=\"no-referrer\" alt=\"1567007421329.png\"></p>\r\n<h3>什么是MyBatis</h3>\r\n<ul>\r\n<li>MyBatis 是一款优秀的<strong>持久层框架</strong></li>\r\n<li>MyBatis 避免了几乎所有的 JDBC 代码和手动设置参数以及获取结果集的过程</li>\r\n<li>MyBatis 可以使用简单的 XML 或注解来配置和映射原生信息，将接口和 Java 的 实体类 【Plain Old Java Objects,普通的 Java对象】映射成数据库中的记录。</li>\r\n<li>MyBatis 本是apache的一个开源项目ibatis, 2010年这个项目由apache 迁移到了google code，并且改名为MyBatis 。</li>\r\n<li>2013年11月迁移到<strong>Github</strong> .</li>\r\n<li>Mybatis官方文档 : <a href=\'http://www.mybatis.org/mybatis-3/zh/index.html\' target=\'_blank\' class=\'url\'>http://www.mybatis.org/mybatis-3/zh/index.html</a></li>\r\n<li>GitHub : <a href=\'https://github.com/mybatis/mybatis-3\' target=\'_blank\' class=\'url\'>https://github.com/mybatis/mybatis-3</a></li>\r\n\r\n</ul>\r\n<h3>持久化</h3>\r\n<ul>\r\n<li><p><strong>持久化是将程序数据在持久状态和瞬时状态间转换的机制。</strong></p>\r\n<ul>\r\n<li>即把数据（如内存中的对象）保存到可永久保存的存储设备中（如磁盘）。持久化的主要应用是将内存中的对象存储在数据库中，或者存储在磁盘文件中、XML数据文件中等等。</li>\r\n<li>JDBC就是一种持久化机制。文件IO也是一种持久化机制。</li>\r\n<li>在生活中 : 将鲜肉冷藏，吃的时候再解冻的方法也是。将水果做成罐头的方法也是。</li>\r\n\r\n</ul>\r\n</li>\r\n<li><p><strong>为什么需要持久化服务呢？那是由于内存本身的缺陷引起的</strong></p>\r\n<ul>\r\n<li>内存断电后数据会丢失，但有一些对象是无论如何都不能丢失的，比如银行账号等，遗憾的是，人们还无法保证内存永不掉电。</li>\r\n<li>内存过于昂贵，与硬盘、光盘等外存相比，内存的价格要高2~3个数量级，而且维持成本也高，至少需要一直供电吧。所以即使对象不需要永久保存，也会因为内存的容量限制不能一直呆在内存中，需要持久化来缓存到外存。</li>\r\n\r\n</ul>\r\n</li>\r\n\r\n</ul>\r\n<h3>持久层</h3>\r\n<ul>\r\n<li><p>什么是持久层？</p>\r\n<ul>\r\n<li>完成持久化工作的代码块 . ----&gt; dao层 【DAO (Data Access Object) 数据访问对象】</li>\r\n<li>大多数情况下特别是企业级应用，数据持久化往往也就意味着将内存中的数据保存到磁盘上加以固化，而持久化的实现过程则大多通过各种<strong>关系数据库</strong>来完成。</li>\r\n<li>不过这里有一个字需要特别强调，也就是所谓的“层”。对于应用系统而言，数据持久功能大多是必不可少的组成部分。也就是说，我们的系统中，已经天然的具备了“持久层”概念？也许是，但也许实际情况并非如此。之所以要独立出一个“持久层”的概念,而不是“持久模块”，“持久单元”，也就意味着，我们的系统架构中，应该有一个相对独立的逻辑层面，专著于数据持久化逻辑的实现.</li>\r\n<li>与系统其他部分相对而言，这个层面应该具有一个较为清晰和严格的逻辑边界。 【说白了就是用来操作数据库存在的！】</li>\r\n\r\n</ul>\r\n</li>\r\n\r\n</ul>\r\n<h3>为什么需要Mybatis</h3>\r\n<ul>\r\n<li><p>Mybatis就是帮助程序猿将数据存入数据库中 , 和从数据库中取数据 .</p>\r\n</li>\r\n<li><p>传统的jdbc操作 , 有很多重复代码块 .比如 : 数据取出时的封装 , 数据库的建立连接等等... , 通过框架可以减少重复代码,提高开发效率 .</p>\r\n</li>\r\n<li><p>MyBatis 是一个半自动化的<strong>ORM框架 (Object Relationship Mapping) --&gt;对象关系映射</strong></p>\r\n</li>\r\n<li><p>所有的事情，不用Mybatis依旧可以做到，只是用了它，所有实现会更加简单！<strong>技术没有高低之分，只有使用这个技术的人有高低之别</strong></p>\r\n</li>\r\n<li><p>MyBatis的优点</p>\r\n<ul>\r\n<li>简单易学：本身就很小且简单。没有任何第三方依赖，最简单安装只要两个jar文件+配置几个sql映射文件就可以了，易于学习，易于使用，通过文档和源代码，可以比较完全的掌握它的设计思路和实现。</li>\r\n<li>灵活：mybatis不会对应用程序或者数据库的现有设计强加任何影响。 sql写在xml里，便于统一管理和优化。通过sql语句可以满足操作数据库的所有需求。</li>\r\n<li>解除sql与程序代码的耦合：通过提供DAO层，将业务逻辑和数据访问逻辑分离，使系统的设计更清晰，更易维护，更易单元测试。sql和代码的分离，提高了可维护性。</li>\r\n<li>提供xml标签，支持编写动态sql。</li>\r\n<li>.......</li>\r\n\r\n</ul>\r\n</li>\r\n<li><p>最重要的一点，使用的人多！公司需要！</p>\r\n</li>\r\n<li><p>环境说明：</p>\r\n<ul>\r\n<li>jdk 8 +</li>\r\n<li>MySQL 5.7.19</li>\r\n<li>maven-3.6.0</li>\r\n<li>IDEA</li>\r\n\r\n</ul>\r\n<p>学习前需要掌握：</p>\r\n<ul>\r\n<li>JDBC</li>\r\n<li>MySQL</li>\r\n<li>Java 基础</li>\r\n<li>Maven</li>\r\n<li>Junit</li>\r\n\r\n</ul>\r\n</li>\r\n\r\n</ul>\r\n<h2>2、mybatis crud（实现增删改查）</h2>\r\n<h4>1.1、创建一个maven项目</h4>\r\n<p>		导入依赖</p>\r\n<pre><code class=\'language-xml\' lang=\'xml\'>&lt;dependencies&gt;\r\n    &lt;!--mysql驱动--&gt;\r\n    &lt;dependency&gt;\r\n        &lt;groupId&gt;mysql&lt;/groupId&gt;\r\n        &lt;artifactId&gt;mysql-connector-java&lt;/artifactId&gt;\r\n        &lt;version&gt;5.1.47&lt;/version&gt;\r\n    &lt;/dependency&gt;\r\n    &lt;!--mybatis支持--&gt;\r\n    &lt;dependency&gt;\r\n        &lt;groupId&gt;org.mybatis&lt;/groupId&gt;\r\n        &lt;artifactId&gt;mybatis&lt;/artifactId&gt;\r\n        &lt;version&gt;3.5.2&lt;/version&gt;\r\n    &lt;/dependency&gt;\r\n    &lt;!--junit支持--&gt;\r\n    &lt;dependency&gt;\r\n        &lt;groupId&gt;junit&lt;/groupId&gt;\r\n        &lt;artifactId&gt;junit&lt;/artifactId&gt;\r\n        &lt;version&gt;4.12&lt;/version&gt;\r\n    &lt;/dependency&gt;\r\n&lt;/dependencies&gt;\r\n</code></pre>\r\n<p>注意点 : pom文件的设置中需要设置资源过滤 , 否则会有资源文件打包不成功问题，导致项目无法运行；</p>\r\n<pre><code class=\'language-xml\' lang=\'xml\'>&lt;build&gt;\r\n    &lt;resources&gt;\r\n        &lt;resource&gt;\r\n            &lt;directory&gt;src/main/java&lt;/directory&gt;\r\n            &lt;includes&gt;\r\n                &lt;include&gt;**/*.properties&lt;/include&gt;\r\n                &lt;include&gt;**/*.xml&lt;/include&gt;\r\n            &lt;/includes&gt;\r\n            &lt;filtering&gt;true&lt;/filtering&gt;\r\n        &lt;/resource&gt;\r\n    &lt;/resources&gt;\r\n&lt;/build&gt;\r\n</code></pre>\r\n<p>&nbsp;</p>\r\n<h4>1.2、创建数据库和表</h4>\r\n<pre><code class=\'language-sql\' lang=\'sql\'>CREATE DATABASE mybatis CHARACTER SET utf8;\r\nCREATE TABLE USER(\r\n	id INT PRIMARY KEY,\r\n	username VARCHAR(15) NOT NULL,\r\n	pwd VARCHAR(20) NOT NULL\r\n)\r\nINSERT INTO USER VALUES(2018143114,&#39;张三&#39;,&#39;123456&#39;),(2018143115,&#39;李四&#39;,&#39;1234567&#39;),(2018143116,&#39;王五&#39;,&#39;147258&#39;);\r\nSELECT * FROM USER;\r\n</code></pre>\r\n<h4>1.3、编写mybatis配置文件</h4>\r\n<p>在resource里新建一个mybatis-config.xml文件</p>\r\n<pre><code class=\'language-xml\' lang=\'xml\'>&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot; ?&gt;\r\n&lt;!DOCTYPE configuration\r\n        PUBLIC &quot;-//mybatis.org//DTD Config 3.0//EN&quot;\r\n        &quot;http://mybatis.org/dtd/mybatis-3-config.dtd&quot;&gt;\r\n&lt;configuration&gt;\r\n    &lt;environments default=&quot;development&quot;&gt;\r\n        &lt;environment id=&quot;development&quot;&gt;\r\n            &lt;transactionManager type=&quot;JDBC&quot;/&gt;\r\n            &lt;dataSource type=&quot;POOLED&quot;&gt;\r\n                &lt;property name=&quot;driver&quot; value=&quot;com.mysql.jdbc.Driver&quot;/&gt;\r\n                &lt;property name=&quot;url&quot; value=&quot;jdbc:mysql://localhost:3306/mybatis?useSSL=true&amp;amp;useUnicode=true&amp;amp;characterEncoding=utf8&quot;/&gt;\r\n                &lt;property name=&quot;username&quot; value=&quot;root&quot;/&gt;\r\n                &lt;property name=&quot;password&quot; value=&quot;hufei169357&quot;/&gt;\r\n            &lt;/dataSource&gt;\r\n        &lt;/environment&gt;\r\n    &lt;/environments&gt;\r\n    &lt;mappers&gt;\r\n        &lt;mapper resource=&quot;com/feige/dao/userMapper.xml&quot;/&gt;\r\n    &lt;/mappers&gt;\r\n&lt;/configuration&gt;\r\n</code></pre>\r\n<h4>1.4、新建一个工具类用来获取SqlSession对象</h4>\r\n<pre><code class=\'language-java\' lang=\'java\'>package com.feige.utils;\r\n\r\nimport org.apache.ibatis.io.Resources;\r\nimport org.apache.ibatis.session.SqlSession;\r\nimport org.apache.ibatis.session.SqlSessionFactory;\r\nimport org.apache.ibatis.session.SqlSessionFactoryBuilder;\r\n\r\nimport java.io.IOException;\r\nimport java.io.InputStream;\r\n//sqlSessionFactory-sqlSession\r\npublic class MybatisUtils {\r\n    private static SqlSessionFactory sqlSessionFactory;\r\n    static {\r\n        try {\r\n            //使用mybatis第一步：获取sqlSessionFactory对象\r\n            String resource = &quot;mybatis-config.xml&quot;;\r\n            InputStream inputStream = Resources.getResourceAsStream(resource);\r\n            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    //既然有了sqlSessionFactory，顾名思义，我们就可以从中获得sqlSession的实例\r\n    public static SqlSession getSqlSessioon(){\r\n        return sqlSessionFactory.openSession();\r\n    }\r\n}\r\n\r\n</code></pre>\r\n<p>&nbsp;</p>\r\n<h4>1.5、编写一个pojo（实体类）</h4>\r\n<pre><code class=\'language-java\' lang=\'java\'>package com.feige.pojo;\r\n\r\npublic class User {\r\n    private int id;\r\n    private String username;\r\n    private String pwd;\r\n\r\n    public User() {\r\n    }\r\n\r\n    public User(int id, String username, String pwd) {\r\n        this.id = id;\r\n        this.username = username;\r\n        this.pwd = pwd;\r\n    }\r\n\r\n    public int getId() {\r\n        return id;\r\n    }\r\n\r\n    public void setId(int id) {\r\n        this.id = id;\r\n    }\r\n\r\n    public String getUsername() {\r\n        return username;\r\n    }\r\n\r\n    public void setUsername(String username) {\r\n        this.username = username;\r\n    }\r\n\r\n    public String getPwd() {\r\n        return pwd;\r\n    }\r\n\r\n    public void setPwd(String pwd) {\r\n        this.pwd = pwd;\r\n    }\r\n    @Override\r\n    public String toString() {\r\n        return &quot;User{&quot; +\r\n                &quot;id=&quot; + id +\r\n                &quot;, username=&#39;&quot; + username + &#39;\\&#39;&#39; +\r\n                &quot;, pwd=&#39;&quot; + pwd + &#39;\\&#39;&#39; +\r\n                &#39;}&#39;;\r\n    }\r\n}\r\n\r\n</code></pre>\r\n<h4>1.6、新建一个userMapper接口</h4>\r\n<pre><code class=\'language-java\' lang=\'java\'>package com.feige.dao;\r\n\r\nimport com.feige.pojo.User;\r\n\r\nimport java.util.List;\r\nimport java.util.Map;\r\n\r\npublic interface UserMapper {\r\n    //查询全部用户\r\n    List&lt;User&gt; getAllUser();\r\n    //通过一个id查询一个用户\r\n    User getUserById(int id);\r\n    //通过id修改一个用户\r\n    int updateUserById(Map map);\r\n    //通过id删除一个用户\r\n    int deleteUserById(int id);\r\n    //插入一条数据\r\n    int insertUser(User user);\r\n}\r\n\r\n</code></pre>\r\n<h4>1.7、新建一个userMapper.xml文件</h4>\r\n<pre><code class=\'language-xml\' lang=\'xml\'>&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot; ?&gt;\r\n&lt;!DOCTYPE mapper\r\n        PUBLIC &quot;-//mybatis.org//DTD Mapper 3.0//EN&quot;\r\n        &quot;http://mybatis.org/dtd/mybatis-3-mapper.dtd&quot;&gt;\r\n&lt;mapper namespace=&quot;com.feige.dao.UserMapper&quot;&gt;\r\n    &lt;!--每个语句要对应相应的标签select对应&lt;select&gt; delete 对应&lt;delete&gt; update 对应&lt;update&gt; insert 对应&lt;insert&gt;--&gt;\r\n    &lt;select id=&quot;getAllUser&quot; resultType=&quot;com.feige.pojo.User&quot;&gt;\r\n        select * from user\r\n    &lt;/select&gt;\r\n    &lt;select id=&quot;getUserById&quot; resultType=&quot;com.feige.pojo.User&quot; parameterType=&quot;int&quot;&gt;\r\n        select * from user where id=#{id}\r\n    &lt;/select&gt;\r\n    &lt;update id=&quot;updateUserById&quot; parameterType=&quot;map&quot;&gt;\r\n        update user set pwd=#{pwd} where id=#{id}\r\n    &lt;/update&gt;\r\n    &lt;delete id=&quot;deleteUserById&quot; parameterType=&quot;int&quot;&gt;\r\n        delete from user where id=#{id}\r\n    &lt;/delete&gt;\r\n    &lt;insert id=&quot;insertUser&quot; parameterType=&quot;com.feige.pojo.User&quot;&gt;\r\n        insert into user values (#{id},#{username},#{pwd})\r\n    &lt;/insert&gt;\r\n&lt;/mapper&gt;\r\n</code></pre>\r\n<h4>1.8、测试代码</h4>\r\n<pre><code class=\'language-java\' lang=\'java\'>package com.feige.mybatisTest;\r\n\r\nimport com.feige.dao.UserMapper;\r\nimport com.feige.pojo.User;\r\nimport com.feige.utils.MybatisUtils;\r\nimport org.apache.ibatis.session.SqlSession;\r\nimport org.junit.Test;\r\n\r\nimport java.util.HashMap;\r\nimport java.util.List;\r\nimport java.util.Map;\r\n\r\npublic class MybatisTest {\r\n    @Test\r\n    public void mybatisTest1(){\r\n        SqlSession sqlSessioon = MybatisUtils.getSqlSessioon();\r\n        UserMapper mapper = sqlSessioon.getMapper(UserMapper.class);\r\n        List&lt;User&gt; allUser = mapper.getAllUser();\r\n        for (User user : allUser) {\r\n            System.out.println(user);\r\n        }\r\n        sqlSessioon.close();\r\n\r\n    }\r\n    @Test\r\n    public void mybatisTest2(){\r\n        SqlSession sqlSessioon = MybatisUtils.getSqlSessioon();\r\n        UserMapper mapper = sqlSessioon.getMapper(UserMapper.class);\r\n        User userById = mapper.getUserById(2018143114);\r\n        System.out.println(userById);\r\n        sqlSessioon.close();\r\n\r\n    }\r\n    @Test\r\n    public void mybatisTest3() {\r\n        SqlSession sqlSessioon = MybatisUtils.getSqlSessioon();\r\n        UserMapper mapper = sqlSessioon.getMapper(UserMapper.class);\r\n        //使用万能map传参\r\n        Map&lt;String,Object&gt; map = new HashMap&lt;String, Object&gt;();\r\n        map.put(&quot;pwd&quot;,2018143114);\r\n        map.put(&quot;id&quot;,2018143114);\r\n\r\n        int i = mapper.updateUserById(map);\r\n        if (i &gt; 0) {\r\n            System.out.println(&quot;修改成功！&quot;+i);\r\n        }\r\n        //增删改需要提交事务\r\n        sqlSessioon.commit();\r\n\r\n        sqlSessioon.close();\r\n\r\n    }\r\n    @Test\r\n    public void mybatisTest4(){\r\n        SqlSession sqlSessioon = MybatisUtils.getSqlSessioon();\r\n        UserMapper mapper = sqlSessioon.getMapper(UserMapper.class);\r\n        int i = mapper.deleteUserById(2018143117);\r\n        if (i &gt; 0) {\r\n            System.out.println(&quot;删除成功！&quot;+i);\r\n        }\r\n        sqlSessioon.commit();\r\n        sqlSessioon.close();\r\n\r\n    }\r\n    @Test\r\n    public void mybatisTest5(){\r\n        SqlSession sqlSessioon = MybatisUtils.getSqlSessioon();\r\n        UserMapper mapper = sqlSessioon.getMapper(UserMapper.class);\r\n        User user = new User(2018143117, &quot;杨帆东&quot;, &quot;2018143117&quot;);\r\n        int i = mapper.insertUser(user);\r\n        if (i &gt; 0) {\r\n            System.out.println(&quot;插入成功！&quot;+i);\r\n        }\r\n        sqlSessioon.commit();\r\n        sqlSessioon.close();\r\n\r\n    }\r\n}\r\n\r\n</code></pre>\r\n<p>&nbsp;</p>\r\n<p>		</p>', '2020-02-23 19:15:45', '2020-02-23 19:15:50', 'admin', '0');
INSERT INTO `blog` VALUES ('7', 'mybatis', 'mybatis啊', '作者', '2020-02-23 19:27:18', '2020-02-23 19:27:18', 'admin', '1');
INSERT INTO `blog` VALUES ('8', 'springboot', 'aaa', '[TOC]\r\n                            #### Disabled options\r\n\r\n                            - TeX (Based on KaTeX);\r\n                            - Emoji;\r\n                            - Task lists;\r\n                            - HTML tags decode;\r\n                            - Flowchart and Sequence Diagram;\r\n                            #### Editor.md directory\r\n\r\n                                editor.md/\r\n                                        lib/\r\n                                        css/\r\n                                        scss/\r\n                                        tests/\r\n                                        fonts/\r\n                                        images/\r\n                                        plugins/\r\n                                        examples/\r\n                                        languages/\r\n                                        editormd.js\r\n                                        ...\r\n\r\n                            ```html\r\n                            <!-- English -->\r\n                            <script src=\"../dist/js/languages/en.js\"></script>\r\n\r\n                            <!-- 繁體中文 -->\r\n                            <script src=\"../dist/js/languages/zh-tw.js\"></script>\r\n                            ```\r\n                        ', '2020-02-24 19:39:36', '2020-02-25 14:38:07', 'admin', '1');
INSERT INTO `blog` VALUES ('9', 'mybatis', 'bbb', '[TOC]\r\n\r\n                            #### Disabled options\r\n\r\n                            - TeX (Based on KaTeX);\r\n                            - Emoji;\r\n                            - Task lists;\r\n                            - HTML tags decode;\r\n                            - Flowchart and Sequence Diagram;\r\n\r\n                            #### Editor.md directory\r\n\r\n                                editor.md/\r\n                                        lib/\r\n                                        css/\r\n                                        scss/\r\n                                        tests/\r\n                                        fonts/\r\n                                        images/\r\n                                        plugins/\r\n                                        examples/\r\n                                        languages/\r\n                                        editormd.js\r\n                                        ...\r\n\r\n                            ```html\r\n                            <!-- English -->\r\n                            <script src=\"../dist/js/languages/en.js\"></script>\r\n\r\n                            <!-- 繁體中文 -->\r\n                            <script src=\"../dist/js/languages/zh-tw.js\"></script>\r\n                            ```\r\n                        ', '2020-02-24 19:44:09', '2020-02-24 19:44:09', 'admin', '1');
INSERT INTO `blog` VALUES ('10', 'springboot', '飞哥', '#大哥的Markdown', '2020-02-25 14:43:28', '2020-02-25 14:43:28', 'admin', '1');
INSERT INTO `blog` VALUES ('11', 'mybatis', '大哥', '#飞哥的博客后台管理系统', '2020-02-25 14:49:26', '2020-02-25 14:49:26', 'admin', '1');
INSERT INTO `blog` VALUES ('12', 'mybatis', '56', '##等待', '2020-02-25 14:50:53', '2020-02-25 14:50:53', 'admin', '5');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `replier` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog` (`blog_id`),
  KEY `user` (`user_id`),
  KEY `parent` (`parent_id`),
  KEY `root` (`root_id`),
  CONSTRAINT `blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `parent` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `root` FOREIGN KEY (`root_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', 'aaaaa', null, null, '2020-02-23 20:04:34', '1', null);
INSERT INTO `comments` VALUES ('2', '1', 'hhh', '1', '1', '2020-02-23 20:05:59', '2', 'feige');
INSERT INTO `comments` VALUES ('3', '1', 'xx', '2', '1', '2020-02-23 20:06:56', '3', 'dage');
INSERT INTO `comments` VALUES ('4', '1', 'cc', '1', '1', '2020-02-23 20:17:34', '1', 'feige');
INSERT INTO `comments` VALUES ('5', '1', 'vv', '2', '1', '2020-02-23 20:18:31', '3', 'dage');
INSERT INTO `comments` VALUES ('6', '1', 'aa', null, null, '2020-02-23 22:22:08', '1', null);
INSERT INTO `comments` VALUES ('7', '1', 'feige', '3', '6', '2020-02-23 22:22:57', '3', 'dd');
INSERT INTO `comments` VALUES ('8', '1', 'dage', '2', '6', '2020-02-23 22:23:39', '1', 'dage');
INSERT INTO `comments` VALUES ('9', '1', '打啊', '6', '6', '2020-02-24 13:44:28', '4', 'feige');
INSERT INTO `comments` VALUES ('10', '1', '飞哥', '9', '6', '2020-02-24 13:45:42', '12', '1');

-- ----------------------------
-- Table structure for `informations`
-- ----------------------------
DROP TABLE IF EXISTS `informations`;
CREATE TABLE `informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of informations
-- ----------------------------

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `aid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`aid`,`rid`),
  KEY `r_rid` (`rid`),
  CONSTRAINT `a_aid` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `r_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '1');
INSERT INTO `permission` VALUES ('1', '2');
INSERT INTO `permission` VALUES ('1', '3');

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for `replys`
-- ----------------------------
DROP TABLE IF EXISTS `replys`;
CREATE TABLE `replys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `reply_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replys
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(15) NOT NULL,
  `permission` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'user', 'user:index');
INSERT INTO `role` VALUES ('2', 'admin', 'admin:add');
INSERT INTO `role` VALUES ('3', 'update', 'admin:update');
INSERT INTO `role` VALUES ('4', 'a', 'a');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('3', 'mybatis');
INSERT INTO `type` VALUES ('2', 'spring');
INSERT INTO `type` VALUES ('1', 'springboot');
INSERT INTO `type` VALUES ('4', 'springMVC');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_photo` varchar(30) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(18) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `register_time` datetime NOT NULL,
  `hobby` varchar(40) DEFAULT NULL,
  `self_introduce` varchar(100) DEFAULT NULL,
  `other` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '搜索', 'feige', '111', '123456', '1', '2020-02-22 15:51:01', '等待', '得到的', '语言');
INSERT INTO `user` VALUES ('2', 'q', 'dage', '345', '123456784', '0', '2020-02-22 15:58:01', 'f', 'd', 'a');
INSERT INTO `user` VALUES ('3', 'v', 'dd', '方法', '方法', '1', '2020-02-22 15:59:39', '分', '分', '分');
INSERT INTO `user` VALUES ('4', '1', '1', '1', '1', '1', '2020-02-22 16:58:06', 'a', 'a', 'a');
INSERT INTO `user` VALUES ('5', 'ss', 'sss', 'ss', 'ss', '1', '2020-02-22 16:02:48', 'ss', 'sss', 'sss');
INSERT INTO `user` VALUES ('6', 'dd', 'a', 'dd', 'dd', '1', '2020-02-22 16:04:14', 'd', 'd', 'd');
INSERT INTO `user` VALUES ('7', 't', 't', 't', 't', '1', '2020-02-22 16:05:35', 't', 't', 't');
INSERT INTO `user` VALUES ('8', 'b', 'b', 'b', 'b', '0', '2020-02-22 16:06:27', 'b', 'b', 'b');
INSERT INTO `user` VALUES ('9', 'f', 'f', 'f', 'f', '0', '2020-02-22 16:07:25', 'f', 'f', 'f');
INSERT INTO `user` VALUES ('10', 'g', 'g', 'gg', 'g', '1', '2020-02-22 16:09:48', 'g', 'g', 'g');
INSERT INTO `user` VALUES ('11', 'i', 'i', 'i', 'i', '1', '2020-02-22 16:10:50', 'i', 'i', 'i');
INSERT INTO `user` VALUES ('12', 's', 's', 's', 's', '1', '2020-02-22 16:12:51', 's', 's', 's');
INSERT INTO `user` VALUES ('13', 'm', 'm', 'm', 'm', '1', '2020-02-22 16:13:51', 'm', 'm', 'm');
INSERT INTO `user` VALUES ('14', 'p', 'p', 'p', 'p', '1', '2020-02-22 16:15:18', 'p', 'p', 'p');
INSERT INTO `user` VALUES ('15', 'c', 'cc', 'c', 'c', '0', '2020-02-22 16:23:25', 'c', 'c', 'c');
INSERT INTO `user` VALUES ('16', 'z', 'z', 'z', 'z', '1', '2020-02-22 16:24:10', '', '', '');
INSERT INTO `user` VALUES ('17', 'v', 'v', 'v', 'v', '1', '2020-02-22 16:25:25', '', '', '');
INSERT INTO `user` VALUES ('18', 'c', 'c', 'c', 'c', '1', '2020-02-22 16:26:13', '', '', '');
