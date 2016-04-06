<%@page import="com.hbhglekang.db.table.Zhuanjia"%>
<%@page import="com.hbhglekang.db.table.TaocanInfo"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.hbhglekang.db.table.Taocan"%>
<%@page import="com.hbhglekang.db.CacheMap"%>
<%@page import="com.hbhglekang.db.DbManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	CacheMap cacheMap = DbManager.instance.getCacheMap();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="head.jsp" />
<!-- body area -->
<body>
	<jsp:include page="head_nav.jsp" />
	<!-- data area -->


	<div class="jj_Boxrg">
		<div class="jj_weizhi">
			<h3>
				<a href="#">专家团队</a>
			</h3>
			<p>
				<a href='<%=basePath%>experts.jsp'>专家团队</a> >

				
			</p>
		</div>
		<div class="zhuanjia">
		
			<%
				Set<Entry<Integer, Zhuanjia>> zhuanjias = cacheMap.zhuanjiaMap.id2Zhuanjia.entrySet();
				for(Entry<Integer, Zhuanjia> entry: zhuanjias){
							Zhuanjia zhuanjia = entry.getValue();
			%>
			<div class="zhuaj">
				<div class="zj">
					<div class="zj_img">
						<img src="<%=zhuanjia.getAvatar_path() %>" />
					</div>
					<div class="zj_js">
						<li class="zj_js1"><b><%=zhuanjia.getName() %></b><font></font></li>
						<li class="zj_js2"><p>
								专家介绍 【基本资料】 姓 名：<%=zhuanjia.getName() %> 性 别：<%=zhuanjia.getSex() %> 职 称：<%=zhuanjia.getTitle() %>
								【个人简历】<%=zhuanjia.getIntroduction() %><a
									href="/lekang_portal/expert.jsp?expertId=<%=zhuanjia.getId() %>"
									style="color:#F00; font-size:14px;">[查看详情]</a>
							</p></li>
						<li class="zj_js3"><a target="_blank"
							href="#"><img src="/lekang_portal/images/zhuajia_06.jpg" /></a></li>
					</div>
				</div>
			</div>
			<%
			}
			 %>

		</div>
		<style>
			.tc_list_page {
				float: left;
				width: 100%;
			}
			
			.tc_list_page ul {
				float: right;
			}
			
			.tc_list_page ul li {
				float: left;
				margin-right: 25px;
			}
			
			.tc_list_page ul li a {
				background: #999;
				padding: 5px 10px;
				color: #fff;
			}
			
			.tc_list_page ul li a:hover {
				background: #6dcff6;
			}
			
			.tc_list_page ul li a.on {
				background: #72cbad;
			}
		</style>


	</div>


	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />
</body>
</html>
