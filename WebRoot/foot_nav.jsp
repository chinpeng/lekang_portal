<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="box_box">
		<div class="foot"></div>
		<div class="foot_nav" style="height: 45px;">
			<div class="hdtop">
				<a href="#"><img src="images/top.jpg" />
				</a>
			</div>
			<ul>
				<li><a href="<%=basePath %>" title="长沙湘雅附二医院体检中心">网站首页</a>
				</li>
				<li><a href="<%=basePath %>tijianliucheng/" target="_blank">体检流程</a>
				</li>
				<li><a href="<%=basePath %>location.jsp" target="_blank">来院路线</a>
				</li>
				<li><a href="<%=basePath %>aboutus.jsp" target="_blank">关于我们</a>
				</li>
				<li><a href="<%=basePath %>" target="_blank">联系我们</a>
				</li>
				<li style="border:none;"><a
					href="<%=basePath %>sitemap/" target="_blank">网站地图</a>
				</li>

			</ul>
		</div>

	</div>