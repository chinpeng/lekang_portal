<%@page import="com.hbhglekang.db.table.Zhuanjia"%>
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
	CacheMap cacheMap = DbManager.instance.getCacheMap();
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
				<font>您所在的位置</font><a href='<%=basePath %>experts.jsp'>专家团队</a>
				>
			</div>

			<%
			if(CommonUtil.checkValidArgs(request, "expertId"))
			{
				String expertId = request.getParameter("expertId");
				Zhuanjia zhuanjia = cacheMap.zhuanjiaMap.id2Zhuanjia.get(Integer.parseInt(expertId));
			 %>
			 <!--普通内容页-->
			<div class="article_article">
				<div class="article">
					<h1><%=zhuanjia.getName() %></h1>
					<div class="article_txt" id="contentText"
						onmouseup="showImg(event)";="">
						<p>专家介绍</p>
						<p>【基本资料】</p>
						<p style="text-align: center;">
							<img alt="" src="<%=zhuanjia.getAvatar_path() %>" />
						</p>
						<p>姓 名：<%=zhuanjia.getName() %></p>
						<p>性 别：<%=zhuanjia.getSex() %></p>
						<p>职 称：<%=zhuanjia.getTitle() %></p>
						<p>
							<%=zhuanjia.getIntroduction() %>
						</p>
					</div>

					<div id="Articleline"></div>
				</div>
			</div>
			 <%
			 } else {
			  %>
			  <jsp:forward page="experts.jsp"/>
			  <%
			  }
			   %>
</div>
</div>

			<!-- content area end -->

			<jsp:include page="foot_nav.jsp" />
</body>
</html>

