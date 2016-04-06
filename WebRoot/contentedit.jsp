<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- 内容编辑  -->
	<jsp:include page="head.jsp" />
  <body>
  
  	<form id="detailForm" method="post" action="testEdit.jsp">
  		level1:<input type="text" id="level1" name="level1"/>
    	<textarea id="content" name="content"></textarea>
    	<!-- <input type="button" value="保存" id="save" onclick="doSave()" /> -->
	</form>
  
  	<script type="text/javascript">
	    var editor = null;
	    window.onload = function(){
	    	//alert("test3");
	        editor = CKEDITOR.replace('content'); //参数‘content’是textarea元素的name属性值，而非id属性值
	        //alert("test4");
	        //editor.setData('这里是需要传递给CKEditor编辑器实例的值');
			//editor.getData();
			CKFinder.setupCKEditor( editor, 'ckfinder2.5.1/' );
	    }
	</script>
  
  </body>
</html>
