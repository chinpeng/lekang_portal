<%@page import="com.hbhglekang.db.CacheMap"%>
<%@page import="com.hbhglekang.db.DbManager"%>
<%@page import="com.hbhglekang.db.table.HierarchyHelper"%>
<%@page import="com.hbhglekang.db.table.Hierarchy"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String _path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path+"/";
%>
<div style="width:100%;  border-bottom:1px solid #eee;">
		<div class="top">
			<font>
				<a href="http://localhost:8080/lekang_portal" title="黄冈乐康体检中心官方微博" rel="nofollow"></a>
				<a title="黄冈乐康体检中心官方微信"></a>
				<a href="http://localhost:8080/lekang_portal" title="黄冈乐康体检中心官方QQ空间"  rel="nofollow"></a>
				<a href="http://localhost:8080/lekang_portal" title="冈乐康体检中心手机网站"></a>
			</font>
			<h3>欢迎来到乐康健康管理中心！</h3>
			<span>
				<a href="http://localhost:8080/lekang_portal" onClick="window.external.AddFavorite(location.href,document.title);return false;" title="收藏黄冈乐康体检中心官方网站">
					<img src="images/top_img1.jpg" width="22" height="21">加入收藏
				</a>
				<a href="http://localhost:8080/lekang_portal" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost:8080/lekang_portal');return false;" title="将黄冈乐康体检中心网站设为首页">
					<img src="images/top_img2.jpg" height="21" width="22">设为首页
				</a>
				<a target="_blank" href="http://localhost:8080/lekang_portal/sitemap/">
					<img src="images/top_img3.jpg" height="21" width="22">网站地图
				</a>
			</span>
		</div>
	</div>
	
	<div class="topbig">
		<ul>
			<h2>
				<a href="http://localhost:8080/lekang_portal">乐康健康体检中心</a>
			</h2>
			<font></font>
			<span></span>
		</ul>
	</div>
	
	<!-- 导航条 -->
	<div class="box_box" style="background:#20afdc;border-top:1px solid #e1f4fa;">
		<div class="head_nav">
		<!-- 下拉列表横幅 -->
			<ul id="dropdown_nav">
				<li><a href="/lekang_portal" title="">网站首页</a>	</li>
				<% 
				CacheMap cacheMap = DbManager.instance.getCacheMap();
				List<Hierarchy> list = cacheMap.hierarchyMap.parent_id2Hierarchy.get(0);
				for(Hierarchy h0 : list){
					int id = h0.getId();
				%>
				<li><a href="<%=(h0.getPath() != null ? h0.getPath()+"?parent_id="+h0.getId()+"&parent_name="+h0.getName() : "#")%>"><%=h0.getName()%></a>
					<ul class="sub_nav" style="display: none;">
					<%
					List<Hierarchy> list1 = cacheMap.hierarchyMap.parent_id2Hierarchy.get(id);
					for(Hierarchy h1 : list1){
						%>
						<li><a href="<%=(h1.getPath() != null ? h1.getPath()+"?parent_id="+h0.getId()+"&id="+h1.getId() : "#")%>"><%=h1.getName()%><font>></font></a></li>
						<%
					}
					%>
					</ul>
				</li>
				<%
				}
				%>
			</ul>
			<!-- 查询box -->
			<form name="formsearch" action="/search.jsp">
				<input name="kwtype" value="0" type="hidden">
				<input name="q" class="soso_box_form" id="search-keyword" value="在这里搜索..."
					onFocus="if(this.value=='在这里搜索...'){this.value='';}"
					onBlur="if(this.value==''){this.value='在这里搜索...';}" type="text">
				<input name="" class="soso_box_button" value="    " type="submit" target='_blank'>
			</form>
		</div>
	</div>