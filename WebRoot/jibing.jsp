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
		int parent_id = CommonUtil.checkValidArgs(request, "parent_id") ? Integer.parseInt(request.getParameter("parent_id")) : 1;
		int id = CommonUtil.checkValidArgs(request, "id") ? Integer.parseInt(request.getParameter("id")) : -1;
		String parent_name = request.getParameter("parent_name");
		String name = parent_name;
	%>
	<!--网页主体main-->
	<div class="main">
		<div class="main_left">
			<div class="main_title">
				<font>您所在的位置</font><a href='<%=basePath %>jibing.jsp'>健康资讯</a> >
			</div>
			<div class="list_article">
				<ul class="list_article_ul">
					<li><div class="list_article_img">
							<a href="/jibing/toubu/15168.html" target="_blank"><img
								src="/lekang_portal/images/avatar.jpg" width="224" height="149"></a>
						</div>
						<h2>
							<h2>
								<a href="#" target="_blank">长沙要怎样预防脑供血不足</a>
							</h2>
							<p>
								现在正值春季是脑血管疾病多发的季节，许多人经常会感到头晕脑胀，可能会误以为会睡眠不足造成的，但其实这可能是脑供血不足的信号。
								专家提醒，若不能早期发现脑供血不足，那长此以往，可能会导致痴呆或脑梗死，必须要引起我们的重视。 那么，长沙要怎样预...
								<a href="#" target="_blank">[详情]</a>
							</p>
						</h2></li>
					<li><div class="list_article_img">
							<a href="#" target="_blank"><img
								src="/lekang_portal/images/avatar.jpg" width="224" height="149"></a>
						</div>
						<h2>
							<h2>
								<a href="#" target="_blank">长沙女性应多久做一次乳腺检查</a>
							</h2>
							<p>
								乳腺增生、乳腺炎甚至是乳腺肿瘤等乳腺疾病是女性常见的健康杀手，且由于近年来女性工作压力的加大，有不断上升的趋势，必须引起广大女性朋友对此的关注，做好定期的乳腺检查工作。
								那么，长沙女性应多久做一次乳腺检查? 体检作为一种有效预防疾病的手段，定...
								<a href="#" target="_blank">[详情]</a>
							</p>
						</h2></li>
				</ul>
				<!-- 
				<div class="list_page">
					<ul>
						<li>首页</li>
						<li class="thisclass">1</li>
						<li><a href='list_47_2.html'>2</a></li>
						<li><a href='list_47_3.html'>3</a></li>
						<li><a href='list_47_4.html'>4</a></li>
						<li><a href='list_47_5.html'>5</a></li>
 						<li><a href='list_47_2.html'>下一页</a></li>
					</ul>
				</div>
				 -->
			</div>
		</div>
	</div>

	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />
</body>
</html>

