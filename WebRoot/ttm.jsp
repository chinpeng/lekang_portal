<%@page import="com.hbhglekang.db.table.TaocanInfo"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.hbhglekang.db.table.Taocan"%>
<%@page import="com.hbhglekang.db.CacheMap"%>
<%@page import="com.hbhglekang.db.DbManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	CacheMap cacheMap = DbManager.instance.getCacheMap();
	int tcid = request.getParameter("tcid") != null ? Integer.parseInt(request.getParameter("tcid")) : 1;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="head.jsp" />
<!-- body area -->

<body>
<jsp:include page="head_nav.jsp" />
<!-- data area -->
	ttm
	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />
</body>
</html>
