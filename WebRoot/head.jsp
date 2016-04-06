<!-- head area -->
<head>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<title>乐康健康管理中心</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="乐康健康管理中心meta描述" />
<meta name="keywords" content="黄冈体检、乐康体检、体检中心、健康体检" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/css.css">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/public.css">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/newcss.css">
<script type="text/javascript" src="<%=basePath %>js/jquery-1.js"></script>
<script type="text/javascript" src="<%=basePath %>js/gg.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.pack.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jQuery.blockUI.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="<%=basePath %>js/showdate.js"></script>
<script type="text/javascript" src="<%=basePath %>js/browjs.js"></script>
 <script type="text/javascript" src="<%=basePath %>ckeditor4.5.4/ckeditor.js"></script>
<script type="text/javascript" src="<%=basePath %>ckfinder2.5.1/ckfinder.js"></script>
<script type="text/javascript">
	$(function() {
		//We initially hide the all dropdown menus
		$('#dropdown_nav li').find('.sub_nav').hide();

		//When hovering over the main nav link we find the dropdown menu to the corresponding link.
		$('#dropdown_nav li').hover(function() {
			//Find a child of 'this' with a class of .sub_nav and make the beauty fadeIn.
			$(this).find('.sub_nav').fadeIn(100);
		}, function() {
			//Do the same again, only fadeOut this time.
			$(this).find('.sub_nav').fadeOut(50);
		});
	});
</script>

</head>