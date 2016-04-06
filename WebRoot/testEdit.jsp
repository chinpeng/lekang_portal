<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>  
  <body>
  	<input type="button" value="<%=request.getParameter("name") %>"/>
  	<input type="button" value="<%=request.getParameter("city") %>"/>
  	<input type="button" value="<%=request.getParameter("editor_data") %>"/>
  	<input type="button" value="<%=request.getParameter("content") %>"/>
  	<input type="button" value="<%=request.getParameter("level1") %>"/>
  	<pre>
  	将内容作为jsp文件保存并添加到数据库中，将以"jsp:include page="的方式引用展现
  	<%=request.getParameter("content") %>
  	</pre>
  </body>
</html>
