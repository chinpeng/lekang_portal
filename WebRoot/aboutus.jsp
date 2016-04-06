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
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
	<div class="jj_Box">
		<div class="jj_main">
				<div class="jj_Boxlf">
					<div class="jj_Boxlf1">
						<ul>
						<%
						CacheMap cacheMap = DbManager.instance.getCacheMap();
						List<Hierarchy> list = cacheMap.hierarchyMap.parent_id2Hierarchy.get(1);
						for(Hierarchy h : list){
							if(h.getId() == id){
								name = h.getName();
							}
							%>
							<li><a href="<%=(h.getPath() != null ? h.getPath()+"?parent_id="+parent_id+"&id="+h.getId() : "#")%>"><%=h.getName()%> </a></li>
							<%
						}
						%>
						</ul>
					</div>
				</div>
				<%
			  		if(loadfile != null) {
			  			String tofile = loadfile.toString();
			  	 %>
			  			<jsp:include page="<%=tofile %>"/>
			  	<%
			  		} else {
			  			List<Content> contents = cacheMap.contentMap.hierarchy_id2Content.get(id);
			  			Content content = null;
			  			if(contents != null && contents.size() > 0){
							Collections.sort(contents);
							content = contents.get(contents.size()-1);
						}
			  			if(content != null){
			  				String tofile = Constants.ContentDataDir+"/"+content.getName()+".jsp";
				  	 %>
				  		<jsp:include page="<%=tofile %>"/>
				  	 <%
			  			}else{
			  	 	%>
			  	 		无内容
			  	 	<%
			  			}
			  	 	}
			  	  %>
			
		</div>
	</div>

	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />

</body>
</html>

