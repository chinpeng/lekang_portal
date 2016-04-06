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
	int index = request.getParameter("index") != null ? Integer.parseInt(request.getParameter("index")) : 1;
	int pagesize = 4;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="head.jsp" flush="false"/>
<!-- body area -->

<body>
<jsp:include page="head_nav.jsp" flush="false"/>
<!-- data area -->
	<div class="taocan_main" style="margin-bottom:10px;" >
		<div class="tc_list_left">
			<div style="width:100%; background:#fff; float:left; height:10px;"></div>
			<%
			Set<Entry<String, List<Taocan>>> type2TaocanSet = cacheMap.taocanMap.type2Taocan.entrySet();
			for(Entry<String, List<Taocan>> entry : type2TaocanSet){
				String type = entry.getKey();
				List<Taocan> taocans = entry.getValue();
				if(taocans == null){
					continue;
				}
			%>
			<div class="tc_left_title">
				<b><%=type %></b>
			</div>

			<ul style="margin-top:35px;">
				<%
				for(int i=0; taocans.size() > 0 && i < taocans.size(); i++){
					Taocan taocan = taocans.get(i);
					if(taocan == null){
						continue;
					}
					if(i+1 == taocans.size()){
						%>
						<li style="margin-bottom:10px;"><a href="<%=basePath %>taocan.jsp?tcid=<%=taocan.getId() %>"><%=taocan.getName() %></a></li>
						<%
					} else {
						%>
						<li><a href="<%=basePath %>taocan.jsp?tcid=<%=taocan.getId() %>"><%=taocan.getName() %></a></li>
						<%
					}
				}
				%>
			</ul>
			<%
			}
			%>
		</div>

		<div class="tc_list_right">
			<div class="tc_bg_title"></div>
			<%
			List<TaocanInfo> taocanInfos = cacheMap.taocanInfoMap.tcid2TaocanInfo.get(tcid);
			int breakFlag = 0;
			if(taocanInfos != null){
				int startIndex = pagesize*(index-1);
				startIndex = (startIndex > taocanInfos.size() ? 0 : startIndex);
				for(int i=startIndex; i<taocanInfos.size(); i++){
					TaocanInfo ti = taocanInfos.get(i);
			%>
			<div class="tc_list_content">
				<div class="tc_iamges">
					<a href="<%=basePath %>taocanInfo.jsp?id=<%=ti.getId() %>" target="_blank">
						<img src="http://www.xyyytj.com/uploads/allimg/160112/115-1601121F050b3.jpg" width="285" height="196" alt="<%=ti.getName() %>">
					</a>
				</div>
				<div class="tc_text">
					<h1>
						<a href="<%=basePath %>taocanInfo.jsp?id=<%=ti.getId() %>" target="_blank"><%=ti.getName() %></a>
					</h1>
					<h2>
						<%-- <font>已购买：<%=ti.getCount() %><span></span>次</font> --%>
						<font>套餐评价：<img src="<%=basePath %>images/taocan/star.jpg"></font>
					</h2>
					<dl>
						<dt>套餐价格 |</dt>
						<dd><%=ti.getPrice() %></dd>
						<dt>适合人群 |</dt>
						<dd><%=ti.getAvailability() %></dd>

						<dt>套餐意义 |</dt>
						<dd><%=ti.getPackageMeaning() %></dd>

						<dt>主要项目 |</dt>
						<dd><%=ti.getMainItems() %></dd>

						<dt>筛查疾病 |</dt>
						<dd><%=ti.getDiseaseScreening() %></dd>
					</dl>
				</div>
			</div>
			<%
				++breakFlag;
				if(breakFlag >= 4){
					break;
				}
			  }
			}
			%>

			<div class="tc_list_page">
				<ul>
				<%
				if(taocanInfos != null){
					int total = taocanInfos.size();
					int pagetotal = (total / pagesize) + 1;
					for(int i=1; i <= pagetotal; i++){
						if(i != index){
					%>
						<li><a href="<%=basePath%>taocan.jsp?index=<%=i%>"><%=i%></a></li>
					<%
						} else {// 当前页
					%>
						<li class="thisclass"><%=i%></li>
					<%			
						}
					}
				}
				%>
				</ul>
			</div>
		</div>
	</div>
	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" flush="false"/>
</body>
</html>
