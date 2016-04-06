<%@page import="com.hbhglekang.util.CommonUtil"%>
<%@page import="java.io.File"%>
<%@page import="com.hbhglekang.Constants"%>
<%@page import="com.hbhglekang.db.table.Content"%>
<%@page import="com.hbhglekang.db.DbManager"%>
<%@page import="com.hbhglekang.db.table.Hierarchy"%>
<%@page import="com.hbhglekang.db.CacheMap"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String loadfile = request.getParameter("loadfile");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="head.jsp" />
<!-- body area -->
<body>

	<jsp:include page="head_nav.jsp" />
	<%
		int parent_id = CommonUtil.checkValidArgs(request, "parent_id") ? Integer
				.parseInt(request.getParameter("parent_id")) : 1;
		int id = CommonUtil.checkValidArgs(request, "id") ? Integer
				.parseInt(request.getParameter("id")) : -1;
		String parent_name = request.getParameter("parent_name");
		String name = parent_name;
	%>

	<!--网页主体main-->
	<div class="main">
		<div class="main_left">
			<div class="main_title">
				<font>您所在的位置</font><a href='<%=basePath%>anli.jsp'>典型案例</a> >
			</div>

			<!--普通内容页-->
			<div class="article_article">
				<div class="article">
					<h1>长期咳嗽经检查结果竟是肺炎</h1>
					<div class="article_ten">
						来源:<a href="/">乐康体检中心</a> 2015-04-15 11:18
					</div>
					<div class="article_txt" id="contentText"
						onmouseup="showImg(event)";="">
						<p>
							周女士今年53岁，是一位长期为家庭艰苦劳作的家庭妇女，一生辛勤节约，即使家庭生活条件不错，但她也一直处于不乱花不乱用的精神上。长时间的劳作，让她最近处于咳嗽状态，周女士只当是平时小感冒，去了小诊所买了止咳药，毫无作用，还是咳得不停，经常半夜严重咳嗽，丈夫看她这几天经常这么咳想带她去医院看一下，周女士说只是小感冒而已过两天就会好了。可是连夜日的咳嗽让丈夫实在是担心，想带她去看，但周女士就是舍不得花钱，丈夫没办法只能打电话给在城里工作的儿子小李，让儿子上网查查长期咳嗽是有什么疾病吗?</p>
						<p>
							于是小李在长沙市各大生活门户网搜遍了关于母亲的情况，偶然间浏览到&ldquo;<a
								href='http://www.xyyytj.com/' target='_blank'><u>湘雅二医院</u></a>健康管理中心&rdquo;的网站，得知湘雅二医院健康管理中心有一种设备叫热断层(TTM)扫描成像系统，是以细胞代谢热医学为基础的功能影像技术。是目前世界上唯一一种能够对人体无损伤、无辐射、绿色、原位观察体内细胞群活性，细胞群与细胞群之间的关系为基础的全新医学学科，体检过程中无污染、无介入、无辐射、安全又简单的绿色体检。全程只需60分钟全身系统扫描。小李觉得母亲的这个长期咳嗽通过<a
								href='http://www.xyyytj.com/ttm/' target='_blank'><u>TTM体检</u></a>会得到解答，就马上拨打了咨询热线，在详细了解过后，便给母亲预约了第二天的体检，但由于第二天的体检人数有限，客服医生让体检调解到后天早上。小李回家与父母说体检预约了，母亲不肯去，觉得自己只是小小感冒而已没必要去做什么<a
								href='http://www.xyyytj.com/quanshen/' target='_blank'><u>全身检查</u></a>，但在丈夫和儿子的一再劝说下，周女士也就放下态度去做个检查也好，自己好大一把岁数也没做过什么体检。
						</p>
						<p>
							第三天，周女士随丈夫和儿子来到湘雅二医院健康管理中心，由于初来咋到不怎么清楚路线，小李一路上与湘雅附二的客服医生进行沟通询问，根据提示到达位于长沙市韶山北路216号的维一星城国际商务楼，来到门口就有专门的导检护士进行带领，周女士与丈夫办完相关的手续后便来到做TTM体检扫描的地方。一会儿，根据体检医生的提示周女士进行了全身系统扫描，医生对周女士进行一系列的讲评。</p>
						<p style="text-align: center;">
							<img alt=""
								src="http://www.xyyytj.com/uploads/allimg/150415/115-150415111916104.jpg"
								style="width: 300px; height: 292px;" />
						</p>
						<p>
							右肺上叶可见细胞代谢热增高区，代谢热值1.19，方差0.20，形态不规则，代谢热分布不均匀;2、边界毛刺，高代谢热中夹杂低代谢热区，呈类圆状分布，与淋巴连接密切;3、热断层过程中往纵膈方向伸展，后位对应区可见代谢热增高区，代谢热不均匀，边界呈毛刺状。右肺上叶细胞变异。</p>
						<p>
							周女士有点慌，害怕这是非常严重的病，医生安慰李女士：只要多点卧床休息、大量饮水、吸氧、积极排痰就可以逐渐痊愈，肺炎治疗的最主要环节是抗感染。</p>
						<p>
							经过医生的详细讲评之后李女士出来了，面对自己的丈夫和儿子，李女士忍住想哭的冲动，还好自己及时来做这个体检，如果自己再拖下去，自己的丈夫和儿子该怎么办呢?李女士衷心感谢湘雅二医院健康管理中心，她的长期咳嗽通过热成像检查得到了解答，并可以这么耐心、亲切的对待每一个前来体检的人，详细的解说自己的身体的潜在疾病。</p>
					</div>
					<div id="Articleline"></div>
					<div class="artpage">
						上一篇：<a href='/anli/article_14753.html'>8年“逃检”，宫颈病变不自知</a> 下一篇：没有了
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />
</body>
</html>

