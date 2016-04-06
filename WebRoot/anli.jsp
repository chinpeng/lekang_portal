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
				<font>您所在的位置</font><a href='<%=basePath%>tijianxuzhi.jsp'>体检案例</a>
				>
			</div>
			<div class="list_article">
				<ul class="list_article_ul">
					<li><div class="list_article_img">
							<a href="#" target="_blank">
							<img src="/lekang_portal/images/avatar.jpg" width="224" height="149"></a>
						</div>
						<h2>
							<h2>
								<a href="<%=basePath%>article.jsp?articleid=" target="_blank">长沙有哪些症状时需要做胃镜检查</a>
							</h2>
							<p>
								现代社会人们的生活、就业、工作压力加大，这些压力对胃肠道会产生不良影响，很多人都有胃痛、胃胀、反酸、烧心、腹痛、腹胀、腹泻甚至便秘、大便带血等症状。
								引起这些症状最常见的原因有胃炎、胃十二指肠溃疡、胃癌、食道癌以及结肠炎、结肠息肉、结肠癌等...
								<a href="<%=basePath%>article.jsp?articleid=" target="_blank">[详情]</a>
							</p>
						</h2></li>
					<li><div class="list_article_img">
							<a href="<%=basePath%>article.jsp?articleid=" target="_blank">
							<img src="/lekang_portal/images/avatar.jpg" width="224" height="149"></a>
						</div>
						<h2>
							<h2>
								<a href="<%=basePath%>article.jsp?articleid=" target="_blank">“三高人群”的体检注意事项</a>
							</h2>
							<p>
								现在生活条件好了，不像以前挨饿受冻了，现在很多人都吃的可好了，以至于导致自己患上了三高。目前患三高的人群是越来越多了，那么这些人群为了健康着想应该做哪些检查呢，检查时有哪些注意事项呢?
								三高人群应该注重血压、血糖、糖化血红蛋白、血脂、载脂蛋...
								<a href="<%=basePath%>article.jsp?articleid=" target="_blank">[详情]</a>
							</p>
						</h2></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />
</body>
</html>

