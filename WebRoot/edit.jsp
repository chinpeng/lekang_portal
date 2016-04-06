<%@page import="java.io.File"%>
<%@page import="com.hbhglekang.util.FileUtil"%>
<%@page import="com.hbhglekang.Constants"%>
<%@page import="com.hbhglekang.db.table.Hierarchy"%>
<%@page import="com.hbhglekang.db.table.Content"%>
<%@page import="com.hbhglekang.db.CacheMap"%>
<%@page import="com.hbhglekang.db.DbManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String redirect = request.getParameter("redirect");
	String idStr = request.getParameter("id");
	long id = (idStr != null ? Long.parseLong(idStr) : -1);
	String name = request.getParameter("name");
	String hierarchy_id = request.getParameter("hierarchy_id");
	String data = request.getParameter("data");
	if(data == null || data.trim().length() <= 0){
		String contentdataPath = getServletConfig().getServletContext().getRealPath(Constants.ContentDataDir);
		String filename = name+".jsp";
		data = FileUtil.readFile(new File(contentdataPath), filename);
	}
	CacheMap cacheMap = DbManager.instance.getCacheMap();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Edit page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="ckeditor4.5.4/ckeditor.js"></script>
	<script type="text/javascript" src="ckfinder2.5.1/ckfinder.js"></script>
	<script type="text/javascript" src="js/jquery-1.js"></script>
  </head>
  
  <body>
  
  	<form id="detailForm" method="post" action="servlet/ContentSaveServlet"><!-- testEdit.jsp -->
  	<!-- redirect表示当前保存的内容在哪个页面进行jsp include -->
  		redirect:<input type="text" id="redirect" name="redirect" value="<%=redirect %>"/><br/>
  		id:<input type="text" id="id" name="id" value="<%=id %>"/><br/>
  		name:<input type="text" id="name" name="name" value="<%=name %>"/><br/>
  		hierarchy_id:<input type="text" id="hierarchy_id" name="hierarchy_id" value="<%=hierarchy_id %>"/><br/>
    	<textarea id="content" name="data"><%=data %></textarea>
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
	
	<script type="text/javascript">
		doSave = function(){
	    	//alert("test1");
	        editor.updateElement(); //非常重要的一句代码
	        //alert("test2");
	        //前台验证工作
	        var editor_data = CKEDITOR.instances.content.getData();
	        //alert(editor_data);
	        //alert($("#content").text());
	        //提交到后台-start $.post(URL,data,callback);
	        $.post("testEdit.jsp",
			    {
			      name:"Donald Duck",
			      city:"Duckburg",
			      data:editor_data
			    },
			    function(data,status){
			      //alert("数据：" + data + "\n状态：" + status+"\neditor_data："+editor_data);
			    	alert("状态：" + status+"\neditor_data："+editor_data);
			    }
		    );
	      //提交到后台-end
		}
		
	</script>
  
  </body>
</html>
