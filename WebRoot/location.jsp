<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <jsp:include page="head.jsp" />
<!-- body area -->
  <body>
  
  <jsp:include page="head_nav.jsp" />
  
   <!-- data area -->
   <jsp:include page="location_block.jsp" />
    <!-- content area end -->
	<jsp:include page="foot_nav.jsp" />
  </body>
</html>