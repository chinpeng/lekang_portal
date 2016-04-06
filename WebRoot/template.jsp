<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loadfile = request.getParameter("loadfile");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>template page</title>
  </head>
  
  <body>
  
  	<jsp:include page="head_nav.jsp" />
  	<!-- content area start -->
  	<%
  		if(loadfile != null) {
  	 %>
  	<jsp:include page="<%=loadfile %>"/>
  	<%
  		} else {
  	 %>
  	 content
  	 <%
  	 	}
  	  %>
  	<!-- content area end -->
	<jsp:include page="foot_nav.jsp" />
  
  </body>
</html>



