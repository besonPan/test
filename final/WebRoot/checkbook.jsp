<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'borrow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		h1{
			text-align:center;
    		margin-left:auto;
			margin-right:auto;
		}
		.check{
			position:absolute;
			left:50%;
			margin-left:-100px;
		}
		.button{
			position:absolute;
			left:55%;
		}
		*{
			list-style: none;
			margin: 0px;
			padding: 0px;
		}
		h2{color:red;}
		body {
			background: #f1f1f1;
		}
		ul {
			padding-left: 30px;
			width: 1000px;
			
			overflow: hidden;
			background: #fff;
		}
		li {
			width: 200px;
			height: 304px;
			margin-top: 28px;
			margin-right: 8px;
			float: left;
			border: 1px solid transparent;
			position: relative;
			background: #f5f5f5;
		}
		p {
			width:180px;
			font-size: 12px;
			color: black;
			text-align: center;
		}
		.left {
			float: left;
			font-size: 12px;
			color: #F40;
			font-weight: bold;
		}
		.right {
			float: right;
			color: #9ca0aa;
			margin-top: 3px;
			font-size: 10px;
		}
		.top {
			padding: 3px 12px;
			line-height: 18px;
		}
		.bottom {
			margin-top: 8px;
			padding: 0 13px;
		}
	</style>
	
  </head>
  
  <body>
  	<h1>图书查询</h1>
  	<div style="position: absolute; top: 20px; right: 20px;">欢迎  <a href="${pageContext.request.contextPath}/userModify.jsp">${user.username}</a>  进入XXX图示管理系统  | <a href="${pageContext.request.contextPath}/login.jsp" target="_top">退出</a></div>
  	<form action="${pageContext.request.contextPath}/book/check" method="post">
    <input type="text" name="bookname" id="bookname" placeholder="可用书名或类别名查找" class="check">
    <input type="submit" class="button" value="搜索">
    </form>
    <ul>
    	<h2>推荐图书：</h2>
    	<li>
	        <a href="${pageContext.request.contextPath}/bookDetail.jsp?id=1&name=中国思想史&type=哲学&author=程艾蓝&press=河南大学出版社&detail=本书为《中国思想史》。全书以个人的观察角度与理解视野，对中国知识、思想与信仰的历史进行历史的研究与描述。该书不仅关心古代中国精英与经典思想的发展，而且分析这些思想得以形成与确立的知识来源和终极依据，也描述产生这些思想的土壤的一般知识、思想与信仰的历史，以及中国思想世界的最终确立和逐渐瓦解的过程。作者改变了过去作为教科书的思想史以人为中心的章节模式，引徵丰富的古代文献，也参考现代中外研究成果，清理与叙述从上古以来到十九世纪的中国人的知识、思想与信仰世界">
	    		<img src="images/a1.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">中国思想史</p>
	    		<p class="bottom">
	    			<span class="left">程艾蓝</span>
	    			<span class="right">河南大学出版社</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=6&name=罗生门&type=文学&author=芥川龙之介&press=江苏凤凰文艺出版社&detail=《罗生门》日本文坛的“鬼才”、“短篇小说之神”芥川龙之介擅长描写人物性格与玄妙的心理转折，笔锋犀利简洁，常一针见血藉作品暗讽社会丑恶现象。受家庭教养影响，芥川龙之介广泛且大量涉猎中国古代文学与世界经典，并常以此做为创作灵感，再加以独树一格的冷峻文笔，寄予独特的人生感怀，直打人性底层黑暗。好友菊池宽曾叹：“像他那样高身的教养，优秀的趣味，已及兼备和汉洋学问的作家，今后恐怕绝无仅有。”">
				<img src="images/b6.jpg" alt="" width="200px">
			</a>
	    		<p class="top">罗生门</p>
	    		<p class="bottom">
	    			<span class="left">芥川龙之介</span>
	    			<span class="right">江苏凤凰文艺出版社</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=15&name=基因社会&type=科学与自然&author=以太·亚奈&press=江苏凤凰文艺出版社&detail=《基因社会》内容简介：你的基因如何控制你的身体和生活？
大约40年前，理查德•道金斯出版了《自私的基因》，提出：人生来自私，跟其他生物一样，不过是基因的生存工具。然而，人类仍不清楚这些自私的基因是如何协作以构建生物体的。《基因社会》以丰富的新的研究为基础，为理解基因如何为了生存而合作及竞争提供了一种解释。
人为什么会得癌症？假如不同人种的基因差别很小，为什么还会有战争？人类的语言从何而来？以太•亚奈（Itai Yanai）和马丁•莱凯尔（Martin Lercher）属于系统生物学这一新领域内的领军人物，两人提出了一个具有说服力的新理论框架，帮助人们理解人类基因组的进化过程。与道金斯的经典隐喻所暗含的意思所不同的是，构建基因组的并非是只关心自身生死存亡的个体基因。我们的基因组是由类似人类社会的基因社会所构成的，和人类社会一样，基因社会的成员们也会彼此联合或敌对。
《基因社会》揭示了基因在各个生物学尺度上——从个体细胞到整个物种——的合作和竞争中所使用的遗传策略。本书描述了基因组在癌细胞、尼安德特人、有性生殖、生命起源中的运作方式，并一直强调着一点：给予基因间相互作用足够的重视，我们才能真正理解生命的规律。">
				<img src="images/c15.jpg" alt="" width="200px">
			</a>
	    		<p class="top">基因社会</p>
	    		<p class="bottom">
	    			<span class="left">以太·亚奈</span>
	    			<span class="right">江苏凤凰文艺出版社</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=23&name=人类简史:从动物到上帝&type=历史&author=尤瓦尔·赫拉利&press=中信出版社&detail=《人类简史 从动物到上帝》是以色列新锐历史学家的一部重磅作品。从十万年前有生命迹象开始到21世纪资本、科技交织的人类发展史。十万年前，地球上至少有六个人种，为何今天却只剩下了我们自己？我们曾经只是非洲角落一个毫不起眼的族群，对地球上生态的影响力和萤火虫、猩猩或者水母相差无几。为何我们能登上生物链的顶端，最终成为地球的主宰？
　　从认知革命、农业革命到科学革命，我们真的了解自己吗？我们过得更加快乐吗？我们知道金钱和宗教从何而来，为何产生吗？人类创建的帝国为何一个个衰亡又兴起？为什么地球上几乎每一个社会都有男尊女卑的观念？为何一神教成为为广泛接受的宗教？科学和资本主义如何成为现代社会重要的信条？理清影响人类发展的重大脉络，挖掘人类文化、宗教、法律、国家、信贷等产生的根源。这是一部宏大的人类简史，更见微知著、以小写大，让人类重新审视自己。">
	    		<img src="images/d23.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">人类简史:从动物到上帝</p>
	    		<p class="bottom">
	    			<span class="left">尤瓦尔·赫拉利</span>
	    			<span class="right">中信出版社</span>
	    		</p>
	  	</li>
	  	<li>
			<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=32&name=能力都是逼出来的&type=励志与成功&author=布兰登·伯查德&press=中国友谊出版公司&detail=能力引导个人通往自由之地。生活中你总要在某个时候逼自己一把，因为不逼就不能够深刻审视自己，不逼就不能发现能力边界，不逼就不能逃离困境。很多人都是在关键时候对自己狠了一点，才突破了个人的瓶颈，突破了社会的束缚。本书作者就是在19岁时的一场车祸后，开启自己非凡人生的。">
				<img src="images/e32.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">能力都是逼出来的</p>
	    		<p class="bottom">
	    			<span class="left">布兰登·伯查德</span>
	    			<span class="right">中国友谊出版公司</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=43&name=你不可不知的法律常识&type=法律&author=张志强&press=中华工商联合出版社&detail=《你不可不知的法律常识》酒后出事，同席者承担多大责任？样品误当新品卖，是否构成消费欺诈？车借给朋友出了事故，责任由谁承担？是不是所有的合同都可以采用电子签名？“小三”有权分得遗产吗？夫妻购买的小产权房，离婚时如何分割？父债子还，天经地义吗？借款人跑了，如何讨债？如何约定民间借贷的利息才合法？购买学区房，卖房人不迁走户口怎么办？老赖的住房不会被执行吗？这些问题都是生活中大家非常关注的，也是常常厘不清的。《你不可不知的法律常识》从生活与消费，夫与妻关系、父母与子女、资产与理财、企业经营与管理、诉讼与仲裁、犯罪与刑罚这7个方面入手，选取了与日常生活密切相关的100个问题，用非常接地气的语言，生动而严谨地进行点对点的讲解，非常适合大家查阅式阅读。">
	    		<img src="images/f43.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">你不可不知的法律常识</p>
	    		<p class="bottom">
	    			<span class="left">张志强</span>
	    			<span class="right">中华工商联合出版社</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=49&name=高兴死了!!!&type=心理&author=珍妮•罗森&press=江苏凤凰文艺出版社&detail=《高兴死了！！！》内容简介：我正在人生低谷，我现在高兴死了！
珍妮，一位抑郁症患者，将自己与孤独、痛苦朝夕相处的故事写成了《高兴死了！！！》。
她疯狂收集每一个快乐的瞬间，用它们回击每一个糟糕的日子。这本书里，有她与精神科医生的滑稽对话，她与家人、小浣熊标本的有趣日常，以及存在于她脑袋里的幽默闹剧与感人战歌。
人生难免风风雨雨，但只要我们永远乐观，我们就会收获巨大的快乐。处于人生低谷时，记得提醒自己：我们每赢得一场战斗，就会变得更强壮一点。我们的挣扎不会白费，我们会胜利，我们会活着。">
	    		<img src="images/g49.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">高兴死了!!!</p>
	    		<p class="bottom">
	    			<span class="left">珍妮•罗森</span>
	    			<span class="right">江苏凤凰文艺出版社</span>
	    		</p>
	  	</li>
	  	<li>
			<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=61&name=枪炮.病菌.钢铁:人类社会的命运&type=政治与军事&author=贾雷德•戴蒙德&press=上海译文出版社&detail=人类社会发展史的另类阐释，东西方文明差异的独特审视；美国普利策奖、比尔•盖茨特别推荐作品

为什么现代社会中的财富和权力的分配，是以今天这种面貌呈现，而非其他形式？为何越过大洋进行杀戮、征服和灭绝的，不是美洲、非洲的土著，而是欧洲人和亚洲人？各族群间的生活差异为何如此之大？ 对于现代人类、国家间的种种不平等现象，史学家往往存而不论，而在这部作品中，作者为许多大家熟悉以及想当然的答案赋予了截然不同的含义。

远古时期，各大陆上的人类社会的发展开始分道扬镳。中国、中美洲、美国东南部和其他地区对野生动植物的早期驯化，使这些地区的各个族群获得了一种领先优势。为什么小麦和玉米、牛和猪以及现代世界的其他一些“了不起的”作物和牲畜出现在这些特定地区，而不是出现在其他地区？人们对这个问题的理解至今仍停留在依稀隐约之间。诚然，农业与放牧出现在局部地区，只是对不同族群的不同命运的部分解释，重要的是，发展水平超过狩猎采集阶段的社会，就有可能发展出文字、技术、政府、有组织的宗教，同时也更有可能发展出凶恶的病菌和战争中的强大武器。正是这样的社会在海洋和陆地上进行冒险，以牺牲其他民族为代价，向新的家园不断扩张，人们最熟悉的例子就是欧洲人在过去500年中对非欧洲民族的征服。开始时，这些欧洲人只是想通过航海去寻找贵金属和香料，结果却常常导致对土著人土地的入侵，并通过屠杀和带来的疾病大批消灭了土著居民。">	    		
				<img src="images/h61.jpg" alt="" width="200px">
			</a>
	    		<p class="top">枪炮.病菌.钢铁:人类社会的命运</p>
	    		<p class="bottom">
	    			<span class="left">贾雷德•戴蒙德</span>
	    			<span class="right">上海译文出版社</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=70&name=关于力量与肌肉的营养策略&type=健康与养生&author=克里斯蒂安·冯&press=北京科学技术出版社&detail=本书作者克里斯蒂安•冯•勒费尔霍尔茨博士是一名医生和营养学家，多年来也积极进行力量训练和对抗性体育运动。他以德国式的严谨科学方法，深入剖析了七大基本营养素对运动者的重要意义。系统地呈现了现代营养学在力量训练领域的最新研究成果，能够帮助运动者的运动效能获得决定性提升：使运动者增肌效果更加显著，减脂效果立竿见影，运动成绩实现飞跃性突破。这是一部真正科学的营养著作，在德国出版以来，再版10次，畅销9年，被奉为运动营养领域的奠基之作。">
	    		<img src="images/i70.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">关于力量与肌肉的营养策略</p>
	    		<p class="bottom">
	    			<span class="left">克里斯蒂安·冯</span>
	    			<span class="right">北京科学技术出版社</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=79&name=大数据与智能革命重新定义未来&type=计算机与互联网&author=吴军&press=中信出版集团股份有限公司&detail=《智能时代：大数据与智能革命重新定义未来》大数据和人工智能迅猛发展，对社会和商业的影响日益深刻，从学术界到企业界，智能化浪潮的来临，已经成为共识。可以比肩于大航海时期和工业革命的此次变革浪潮，必然会对我们的技术发展、商业和社会都会产生重大的影响。作者吴军在《智能时代：大数据与智能革命重新定义未来》中指出，首先，我们在过去被认为非常难以解决的问题，会因为大数据和机器智能的使用而迎刃而解，比如解决癌症个性化治疗的难题。同时，大数据和机器智能还会彻底改变未来时代的商业模式，很多传统的行业都将采用智能技术实现升级换代，同时改变原有的商业模式。大数据和机器智能对于未来社会的影响是全方位的。另一方面，智能化也会对整个社会带来巨大的冲击，尤其是在智能革命的初期。因此，在智能时代开始的时候，我们需要未雨绸缪，力争做控制世界的2%人，而不是被智能化浪潮淘汰。">
	    		<img src="images/j79.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">大数据与智能革命重新定义未来</p>
	    		<p class="bottom">
	    			<span class="left">吴军</span>
	    			<span class="right">中信出版集团股份有限公司</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=90&name=写给大家的西方美术史&type=艺术&author=蒋勋&press=湖南美术出版社&detail=温馨提示：由于该书较厚，纸张较硬。所以并没有使用传统的胶装工艺。而是使用了“双封锁线裸背装帧”，方便读者翻阅。并非质量问题
《写给大家的西方美术史》以时间为纬线，以各个艺术流派的艺术家及其代表性的作品为经线，回到历史现场，从史前时期的一把燧石手斧开始，围绕地中海这一世界西方美术的血脉初源，带你一路走过神秘的埃及、伟大的希腊、光荣的罗马……直到光辉的印象派，及光怪陆离的现当代艺术。或做正面解读，或挖背后的故事，数千年“美”的往事，娓娓道来。
蒋勋先生用柔美、亲民的文字，借助“西方美术史”这一扇通向世界的窗口，使得我们眺望和浏览世界不同文化的“美”的观念、材料、技法，省思人类共同的“美”的向往与创造。">
	    		<img src="images/k90.jpg" alt="" width="200px">
	    	</a>
	    		<p class="top">写给大家的西方美术史</p>
	    		<p class="bottom">
	    			<span class="left">蒋勋</span>
	    			<span class="right">湖南美术出版社</span>
	    		</p>
	  	</li>
	  	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=101&name=我的第一本专注力训练书&type=儿童读物&author=美国迪士尼公司&press=童趣出版有限公司&detail=本书为《看到找不到》系列之精彩合集。精选本系列中最经典和很受欢迎的形象页面，按综合难度由易到难编排，增加了专注能量级的划分和“目标锁定”等小细节，提升孩子寻找之后的成就感，逐步提升专注力、记忆力、观察力三大能力。本书足足128页，让孩子一次玩得过瘾、找得开心。
本书主要特点：
（1）迪士尼知名人物形象，激发孩子兴趣
（2）循序渐进，按难度编排，有助于孩子建立自信心
（3）针对专注力、记忆力、观察力三大能力，在玩耍中快乐提升思维能力 ">
	    	<img src="images/l101.jpg" alt="" width="200px"></a>
	    		<p class="top">我的第一本专注力训练书</p>
	    		<p class="bottom">
	    			<span class="left">美国迪士尼公司</span>
	    			<span class="right">童趣出版有限公司</span>
	    		</p>
	  	</li>
	</ul>
  </body>
</html>
