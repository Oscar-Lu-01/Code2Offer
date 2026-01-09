USE Code2Offer;

-- =========================================================================
-- 1. 用户表 (保持不变)
-- =========================================================================
INSERT INTO user (id, userAccount, userPassword, unionId, mpOpenId, userName, userAvatar, userProfile, userRole)
VALUES (1, 'user1', 'b0dd3697a192885d7c055db46155b26a', 'unionId1', 'mpOpenId1', 'user1',
        'https://www.codefather.cn/logo.png', '喜欢编程的小白', 'user'),
       (2, 'user2', 'b0dd3697a192885d7c055db46155b26a', 'unionId2', 'mpOpenId2', 'user2',
        'https://www.codefather.cn/logo.png', '全栈开发工程师', 'user'),
       (3, 'user3', 'b0dd3697a192885d7c055db46155b26a', 'unionId3', 'mpOpenId3', 'user3',
        'https://www.codefather.cn/logo.png', '前端爱好者', 'user'),
       (4, 'user4', 'b0dd3697a192885d7c055db46155b26a', 'unionId4', 'mpOpenId4', 'user4',
        'https://www.codefather.cn/logo.png', '后端开发工程师', 'user'),
       (5, 'oscarlu', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, 'oscarlu', 'https://www.codefather.cn/logo.png',
        '系统管理员', 'admin');

-- =========================================================================
-- 2. 题库表 (优化了图标，使用技术栈对应颜色)
-- =========================================================================
INSERT INTO question_bank (id, title, description, picture, userId)
VALUES
    (1, 'JavaScript 基础', '包含 JavaScript 的基础知识题目', 'https://ui-avatars.com/api/?name=JS&background=F7DF1E&color=000&bold=true&length=2', 1),
    (2, 'CSS 样式', '包含 CSS 相关的样式问题', 'https://ui-avatars.com/api/?name=CSS&background=2965f1&color=fff&bold=true&length=3', 2),
    (3, 'HTML 基础', 'HTML 标记语言的基本知识', 'https://ui-avatars.com/api/?name=HTML&background=e34c26&color=fff&bold=true&length=4', 3),
    (4, '前端框架', 'React, Vue, Angular 等框架相关的题目', 'https://ui-avatars.com/api/?name=FW&background=61dbfb&color=000&bold=true', 1),
    (5, '算法与数据结构', '数据结构和算法题目', 'https://ui-avatars.com/api/?name=Algo&background=172b4d&color=fff&bold=true', 2),
    (6, '数据库原理', 'SQL 语句和数据库设计', 'https://ui-avatars.com/api/?name=DB&background=00758f&color=fff&bold=true', 3),
    (7, '操作系统', '操作系统的基本概念', 'https://ui-avatars.com/api/?name=OS&background=333333&color=fff&bold=true', 1),
    (8, '网络协议', 'HTTP, TCP/IP 等网络协议题目', 'https://ui-avatars.com/api/?name=Net&background=28a745&color=fff&bold=true', 2),
    (9, '设计模式', '常见设计模式及其应用', 'https://ui-avatars.com/api/?name=Design&background=6610f2&color=fff&bold=true', 3),
    (10, '编程语言概述', '多种编程语言的基础知识', 'https://ui-avatars.com/api/?name=Lang&background=fd7e14&color=fff&bold=true', 1),
    (11, '版本控制', 'Git 和 SVN 的使用', 'https://ui-avatars.com/api/?name=Git&background=f05032&color=fff&bold=true', 2),
    (12, '安全与加密', '网络安全和加密技术', 'https://ui-avatars.com/api/?name=Sec&background=dc3545&color=fff&bold=true', 3),
    (13, '云计算', '云服务和架构', 'https://ui-avatars.com/api/?name=Cloud&background=17a2b8&color=fff&bold=true', 1),
    (14, '微服务架构', '微服务的设计与实现', 'https://ui-avatars.com/api/?name=Micro&background=007bff&color=fff&bold=true', 2),
    (15, '容器技术', 'Docker 和 Kubernetes 相关知识', 'https://ui-avatars.com/api/?name=Docker&background=2496ed&color=fff&bold=true', 3),
    (16, 'DevOps 实践', '持续集成与持续交付', 'https://ui-avatars.com/api/?name=DevOps&background=20c997&color=fff&bold=true', 1),
    (17, '数据分析', '数据分析和可视化', 'https://ui-avatars.com/api/?name=Data&background=ffc107&color=000&bold=true', 2),
    (18, '人工智能', '机器学习与深度学习基础', 'https://ui-avatars.com/api/?name=AI&background=e83e8c&color=fff&bold=true', 3),
    (19, '区块链技术', '区块链的基本原理和应用', 'https://ui-avatars.com/api/?name=Block&background=6c757d&color=fff&bold=true', 1),
    (20, '项目管理', '软件开发项目的管理和执行', 'https://ui-avatars.com/api/?name=PM&background=343a40&color=fff&bold=true', 2);

-- =========================================================================
-- 3. 题目表 (ID 1-20 为原数据，21-60 为新增真实面试题)
-- =========================================================================
INSERT INTO question (id, title, content, tags, answer, userId) VALUES
-- 原有数据 (1-20)
(1, 'JavaScript 变量提升', '请解释 JavaScript 中的变量提升现象。', '["JavaScript", "基础"]', '变量提升是指在 JavaScript 中，变量声明会被提升到作用域的顶部。', 1),
(2, 'CSS Flexbox 布局', '如何使用 CSS 实现一个水平居中的盒子？', '["CSS", "布局"]', '可以使用 Flexbox 布局，通过设置父容器 display 为 flex，并使用 justify-content: center; 对齐子元素。', 2),
(3, 'HTML 中的语义化', '什么是 HTML 的语义化？为什么重要？', '["HTML", "语义化"]', 'HTML 语义化是使用正确的标签来描述内容的意义，能够提高可访问性和 SEO 效果。', 3),
(4, 'React 中的状态管理', '如何在 React 中管理组件状态？', '["React", "状态管理"]', '可以使用 React 的 useState 或 useReducer 钩子来管理组件状态，或使用 Redux 进行全局状态管理。', 1),
(5, '算法：二分查找', '请实现一个二分查找算法。', '["算法", "数据结构"]', '二分查找是一种在有序数组中查找特定元素的算法，通过不断折半的方式缩小查找范围。', 2),
(6, '数据库索引的作用', '什么是数据库索引？它的作用是什么？', '["数据库", "索引"]', '数据库索引是用于加快查询速度的数据结构，它通过优化查找路径减少查询时间。', 3),
(7, 'HTTP 与 HTTPS 的区别', '请解释 HTTP 和 HTTPS 之间的主要区别。', '["网络", "协议"]', 'HTTPS 是加密的 HTTP，通过 SSL/TLS 提供更安全的数据传输。', 1),
(8, '设计模式：单例模式', '请解释单例模式的实现及应用场景。', '["设计模式", "单例"]', '单例模式确保一个类只有一个实例，并提供全局访问点。常用于配置类等只需一个实例的场景。', 2),
(9, 'Git 中的分支管理', '如何在 Git 中管理分支？', '["版本控制", "Git"]', 'Git 中通过 branch 命令创建分支，使用 checkout 切换分支，使用 merge 合并分支。', 3),
(10, 'Docker 的基本命令', '列举并解释几个常用的 Docker 命令。', '["容器技术", "Docker"]', '常用命令包括 docker run, docker build, docker ps, docker stop 等。', 1),
(11, '前端性能优化', '列举几个前端性能优化的手段。', '["前端", "性能优化"]', '包括代码分割、资源压缩、缓存策略、懒加载等。', 2),
(12, 'JavaScript 闭包的应用', '什么是闭包？举例说明闭包的实际应用。', '["JavaScript", "高级"]', '闭包是指函数能够记住创建时的上下文环境，常用于数据隐藏和模块化编程。', 3),
(13, '数据库事务的特性', '请解释数据库事务的 ACID 特性。', '["数据库", "事务"]', 'ACID 代表原子性、一致性、隔离性和持久性，是事务处理的四大特性。', 1),
(14, 'CSS 的 BEM 命名规范', '什么是 BEM？如何使用 BEM 进行 CSS 命名？', '["CSS", "命名规范"]', 'BEM 代表块（Block）、元素（Element）和修饰符（Modifier），是一种 CSS 命名规范。', 2),
(15, 'JavaScript 原型链', '请解释 JavaScript 中的原型链机制。', '["JavaScript", "原型链"]', '原型链是 JavaScript 实现继承的机制，对象通过原型链可以继承其他对象的属性和方法。', 3),
(16, 'React 生命周期', '请说明 React 组件的生命周期方法。', '["React", "生命周期"]', 'React 组件的生命周期包括初始化、更新和卸载三个阶段，各阶段有不同的生命周期方法。', 1),
(17, 'HTTP 状态码 404 与 500 的区别', '请解释 HTTP 状态码 404 和 500 的含义。', '["网络", "HTTP"]', '404 表示未找到资源，500 表示服务器内部错误。', 2),
(18, 'Python 与 Java 的区别', '比较 Python 和 Java 的主要区别。', '["编程语言", "Python", "Java"]', 'Python 是动态类型语言，语法简洁，而 Java 是静态类型语言，注重严谨性和性能。', 3),
(19, 'Vue 的双向数据绑定', '请解释 Vue.js 是如何实现双向数据绑定的。', '["Vue", "数据绑定"]', 'Vue.js 通过数据劫持和发布-订阅模式实现了双向数据绑定。', 1),
(20, '前端工程化的意义', '为什么需要前端工程化？', '["前端", "工程化"]', '前端工程化能够提高开发效率、代码质量和可维护性，规范开发流程。', 2),

-- 新增真实题目 (21-60)
(21, 'Git Rebase 与 Merge 的区别', '请详细说明 Git 中 rebase 和 merge 命令的区别及使用场景。', '["版本控制", "Git"]', 'Merge 会保留完整的历史记录和分支结构，适合公共分支合并；Rebase 会将提交历史线性化，适合个人分支整理，保持历史整洁。', 2),
(22, 'XSS 攻击原理与防御', '什么是 XSS 攻击？如何防御？', '["安全", "Web安全"]', 'XSS（跨站脚本攻击）指攻击者在网页中注入恶意脚本。防御措施包括：对输入进行过滤、对输出进行转义、使用 HttpOnly Cookie、开启 CSP 策略。', 3),
(23, 'CSRF 攻击与防护', '解释 CSRF 攻击并说明常见的防护手段。', '["安全", "Web安全"]', 'CSRF（跨站请求伪造）利用用户已登录的身份执行非本意的操作。防护手段：使用 CSRF Token、验证 Referer/Origin 头、使用 SameSite Cookie。', 1),
(24, 'IaaS、PaaS、SaaS 的区别', '请解释云计算中 IaaS, PaaS, SaaS 的区别。', '["云计算", "基础"]', 'IaaS 提供基础设施（如 AWS EC2）；PaaS 提供开发平台（如 Heroku）；SaaS 提供软件服务（如 Gmail）。', 1),
(25, '微服务服务发现机制', '微服务架构中，服务发现是如何工作的？', '["微服务", "架构"]', '服务发现解决了动态变化的 IP 地址问题。分为客户端发现和服务端发现，通常配合注册中心（如 Eureka, Consul, Nacos）使用。', 2),
(26, 'Kubernetes Pod 概念', '什么是 K8s 中的 Pod？', '["容器技术", "K8s"]', 'Pod 是 Kubernetes 中最小的部署单元，一个 Pod 可以包含一个或多个容器，这些容器共享网络 IP 和存储卷。', 3),
(27, 'CI/CD 流水线', '解释 CI/CD 的概念及其价值。', '["DevOps", "流程"]', 'CI（持续集成）指频繁合并代码并自动测试；CD（持续交付/部署）指自动将代码部署到生产环境。价值在于快速反馈、降低风险、提高交付速度。', 1),
(28, 'SQL 分组与聚合', 'SQL 中 GROUP BY 和 HAVING 的区别是什么？', '["数据分析", "SQL"]', 'WHERE 过滤行，GROUP BY 对结果进行分组，HAVING 过滤分组后的数据（通常与聚合函数一起使用）。', 2),
(29, '机器学习中的过拟合', '什么是过拟合（Overfitting）？如何解决？', '["人工智能", "机器学习"]', '过拟合指模型在训练集表现很好但在测试集表现差。解决方法：增加数据量、正则化（L1/L2）、Dropout、简化模型、早停法。', 3),
(30, '区块链共识机制', '请解释 PoW（工作量证明）和 PoS（权益证明）。', '["区块链", "基础"]', 'PoW 通过算力竞争获得记账权（如比特币），能耗高；PoS 根据持有代币的数量和时间获得记账权，能耗低。', 1),
(31, '敏捷开发宣言', '敏捷开发的核心价值观是什么？', '["项目管理", "敏捷"]', '个体和互动高于流程和工具；工作的软件高于详尽的文档；客户合作高于合同谈判；响应变化高于遵循计划。', 2),
(32, 'Java HashMap 底层原理', 'Java 8 中 HashMap 的底层实现结构是什么？', '["编程语言", "Java"]', 'Java 8 HashMap 使用数组+链表+红黑树实现。当链表长度超过 8 且数组长度超过 64 时，链表会转换为红黑树以提高查询效率。', 1),
(33, 'Python 装饰器', '什么是 Python 装饰器？有什么作用？', '["编程语言", "Python"]', '装饰器本质上是一个 Python 函数，它可以让其他函数在不需要做任何代码变动的前提下增加额外功能，常用于日志、权限校验。', 3),
(34, 'TCP 三次握手', '请画图或文字描述 TCP 三次握手的过程。', '["网络协议", "TCP"]', '1. 客户端发送 SYN；2. 服务端回复 SYN+ACK；3. 客户端回复 ACK。建立可靠连接。', 2),
(35, 'Linux 权限管理', 'Linux 命令 chmod 755 filename 代表什么意思？', '["操作系统", "Linux"]', '文件所有者拥有读写执行权限(7)，同组用户拥有读执行权限(5)，其他用户拥有读执行权限(5)。', 1),
(36, 'SQL 注入', '什么是 SQL 注入？如何防止？', '["安全", "数据库"]', '攻击者通过输入恶意 SQL 片段操纵数据库查询。防止方法：使用预编译语句（PreparedStatement）、ORM 框架、严格校验输入。', 3),
(37, 'Redis 持久化', 'Redis 的 RDB 和 AOF 有什么区别？', '["数据库", "NoSQL"]', 'RDB 是指定时间间隔的快照，恢复快但可能丢数据；AOF 记录每次写操作，数据更安全但文件体积大，恢复慢。', 2),
(38, 'Kafka 的应用场景', 'Kafka 主要用于什么场景？', '["微服务", "消息队列"]', '日志收集、流式数据处理、系统解耦、削峰填谷、事件源记录。', 1),
(39, 'Spring Boot Starter', 'Spring Boot Starter 的作用是什么？', '["前端框架", "Java"]', 'Starter 是一组依赖描述符，可以一站式引入相关模块的所有依赖，简化 Maven/Gradle 配置，实现开箱即用。', 2),
(40, 'React Virtual DOM', '虚拟 DOM 如何提升性能？', '["前端框架", "React"]', '虚拟 DOM 是内存中的 JS 对象树。React 通过 Diff 算法比较新旧虚拟 DOM，计算出最小变更，批量更新真实 DOM，减少重排重绘。', 1),
(41, 'Vue 生命周期', 'Vue created 和 mounted 的区别？', '["前端框架", "Vue"]', 'created：实例已创建，数据观测已完成，但未挂载 DOM；mounted：模板已编译并挂载到页面，可以操作 DOM。', 3),
(42, '浏览器渲染原理', '从输入 URL 到页面展示经历了什么？', '["前端框架", "浏览器"]', 'DNS 解析 -> TCP 连接 -> 发送 HTTP 请求 -> 接收响应 -> 解析 HTML/CSS 构建 DOM/CSSOM 树 -> 渲染树 -> 布局 -> 绘制。', 2),
(43, 'DNS 解析过程', '简述 DNS 解析流程。', '["网络协议", "DNS"]', '浏览器缓存 -> 系统 hosts -> 本地 DNS 服务器 -> 根域名服务器 -> 顶级域名服务器 -> 权威域名服务器。', 1),
(44, '进程与线程', '进程和线程的区别是什么？', '["操作系统", "基础"]', '进程是资源分配的最小单位，线程是 CPU 调度的最小单位。进程间内存隔离，线程间共享进程内存。', 2),
(45, '死锁的四个条件', '产生死锁的必要条件有哪些？', '["操作系统", "并发"]', '互斥条件、请求与保持条件、不剥夺条件、循环等待条件。', 3),
(46, 'LRU 缓存算法', 'LRU 算法的淘汰策略是什么？', '["算法", "缓存"]', '最近最少使用（Least Recently Used）。当缓存满时，优先淘汰最长时间未被访问的数据。通常用哈希表+双向链表实现。', 1),
(47, '快排的时间复杂度', '快速排序的平均和最坏时间复杂度是多少？', '["算法", "排序"]', '平均 O(nlogn)，最坏 O(n^2)（数组已有序时）。', 2),
(48, 'RESTful API', 'RESTful 风格接口的特点？', '["网络协议", "API"]', '基于资源，使用 HTTP 动词（GET/POST/PUT/DELETE）表示操作，无状态，统一接口，支持多种表现形式（JSON/XML）。', 1),
(49, 'JWT 原理', 'JWT (JSON Web Token) 的结构是怎样的？', '["安全", "认证"]', '由 Header（头部）、Payload（负载）、Signature（签名）三部分组成，中间用点分隔。', 3),
(50, 'OAuth 2.0', 'OAuth 2.0 的常见授权模式有哪些？', '["安全", "授权"]', '授权码模式（最常用）、隐式模式、密码模式、客户端凭证模式。', 2),
(51, 'Docker Compose', 'Docker Compose 的作用是什么？', '["容器技术", "Docker"]', '用于定义和运行多容器 Docker 应用程序的工具，通过 YAML 文件配置应用的服务。', 1),
(52, 'Nginx 反向代理', '什么是反向代理？Nginx 如何实现？', '["网络协议", "服务器"]', '反向代理代理的是服务器，客户端不知道实际服务器。Nginx 通过 proxy_pass 指令将请求转发给后端服务器集群。', 3),
(53, 'CAP 定理', '分布式系统的 CAP 定理指什么？', '["微服务", "分布式"]', 'Consistency（一致性）、Availability（可用性）、Partition tolerance（分区容错性），三者不可兼得，通常只能满足 CP 或 AP。', 1),
(54, 'BASE 理论', '解释 BASE 理论。', '["微服务", "分布式"]', 'Basically Available（基本可用）、Soft state（软状态）、Eventually consistent（最终一致性），是对 CAP 中一致性和可用性权衡的结果。', 2),
(55, 'MVCC 机制', '数据库 MVCC 是什么？', '["数据库", "并发"]', '多版本并发控制。通过保存数据的历史版本，实现读写不冲突，提高数据库并发性能，常用于隔离级别实现。', 3),
(56, 'Go Goroutine', 'Go 协程（Goroutine）与线程的区别？', '["编程语言", "Go"]', 'Goroutine 是用户态轻量级线程，栈内存极小（几 KB），由 Go 运行时调度，启动和切换成本远低于内核态线程。', 1),
(57, 'Rust 所有权', '简述 Rust 的所有权机制。', '["编程语言", "Rust"]', 'Rust 内存管理的核心。规则：每个值都有一个变量作为所有者；同一时间只能有一个所有者；所有者离开作用域，值被丢弃。保证了内存安全。', 2),
(58, 'GraphQL vs REST', 'GraphQL 相比 REST 的优势？', '["网络协议", "API"]', '按需获取数据（避免 Over-fetching/Under-fetching）、强类型系统、单一端点、强大的开发者工具。', 3),
(59, 'WebSocket', 'WebSocket 与 HTTP 的区别？', '["网络协议", "实时"]', 'WebSocket 是全双工通信协议，建立在 TCP 之上。HTTP 是单向的（请求-响应）。WebSocket 适合实时聊天、推送场景。', 1),
(60, 'CDN 原理', 'CDN 是如何加速网站访问的？', '["网络协议", "架构"]', '内容分发网络。将内容缓存到离用户最近的边缘节点，通过 DNS 负载均衡将用户请求导向最佳节点，减少延迟。', 2);

-- =========================================================================
-- 4. 题库-题目 关联表 (全覆盖映射)
-- =========================================================================
INSERT INTO question_bank_question (questionBankId, questionId, userId) VALUES
-- 1. JavaScript 基础
(1, 1, 1),
(1, 12, 3), -- 闭包
(1, 15, 3), -- 原型链

-- 2. CSS 样式
(2, 2, 2),
(2, 14, 2), -- BEM

-- 3. HTML 基础
(3, 3, 3),
(3, 13, 3),

-- 4. 前端框架 (补充了 React 原理, Vue 生命周期, SpringBoot 作为后端框架示例也常归此类或独立)
(4, 4, 1),
(4, 16, 1), -- React Lifecycle
(4, 19, 1), -- Vue Binding
(4, 39, 2), -- Spring Boot Starter (Java框架)
(4, 40, 1), -- React Virtual DOM
(4, 41, 3), -- Vue Lifecycle
(4, 42, 2), -- 浏览器渲染

-- 5. 算法与数据结构
(5, 5, 2),
(5, 46, 1), -- LRU
(5, 47, 2), -- 快排

-- 6. 数据库原理
(6, 6, 3),
(6, 13, 1), -- ACID
(6, 37, 2), -- Redis
(6, 55, 3), -- MVCC

-- 7. 操作系统
(7, 7, 1), -- HTTP/HTTPS 这里的原始归类其实在网络更合适，但保留原样
(7, 35, 1), -- Linux 权限
(7, 44, 2), -- 进程线程
(7, 45, 3), -- 死锁

-- 8. 网络协议
(8, 8, 2), -- 设计模式 原题归类可能有误，但保留 ID 映射
(8, 7, 1), -- HTTP/HTTPS (补充关联)
(8, 17, 2), -- 404/500
(8, 34, 2), -- TCP 握手
(8, 43, 1), -- DNS
(8, 48, 1), -- RESTful
(8, 52, 3), -- Nginx
(8, 58, 3), -- GraphQL
(8, 59, 1), -- WebSocket

-- 9. 设计模式
(9, 8, 2), -- 单例
(9, 9, 3),

-- 10. 编程语言概述
(10, 10, 1),
(10, 18, 3), -- Python vs Java
(10, 32, 1), -- Java HashMap
(10, 33, 3), -- Python 装饰器
(10, 56, 1), -- Go Goroutine
(10, 57, 2), -- Rust 所有权

-- 11. 版本控制
(11, 9, 3), -- Git 分支
(11, 21, 2), -- Git Rebase

-- 12. 安全与加密
(12, 22, 3), -- XSS
(12, 23, 1), -- CSRF
(12, 36, 3), -- SQL 注入
(12, 49, 3), -- JWT
(12, 50, 2), -- OAuth 2.0

-- 13. 云计算
(13, 24, 1), -- IaaS/PaaS/SaaS
(13, 60, 2), -- CDN

-- 14. 微服务架构
(14, 25, 2), -- 服务发现
(14, 38, 1), -- Kafka
(14, 53, 1), -- CAP
(14, 54, 2), -- BASE

-- 15. 容器技术
(15, 10, 1), -- Docker 命令
(15, 26, 3), -- K8s Pod
(15, 51, 1), -- Docker Compose

-- 16. DevOps 实践
(16, 11, 2), -- 前端性能 (原题归类)
(16, 27, 1), -- CI/CD

-- 17. 数据分析
(17, 28, 2), -- SQL Group By

-- 18. 人工智能
(18, 29, 3), -- 过拟合

-- 19. 区块链技术
(19, 30, 1), -- PoW vs PoS

-- 20. 项目管理
(20, 31, 2); -- 敏捷宣言