<%@page import="com.hbhglekang.util.CommonUtil"%>
<%@page import="com.hbhglekang.db.DbManager"%>
<%@page import="com.hbhglekang.db.table.Hierarchy"%>
<%@page import="com.hbhglekang.db.CacheMap"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
						List<Hierarchy> list = cacheMap.hierarchyMap.parent_id2Hierarchy.get(parent_id);
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

				<div class="jj_Boxrg">
					<div class="jj_weizhi">
						<h3>
							<a href="#"><%=name %></a>
						</h3>
					</div>
					<!-- aboutus conetent start -->
					<div>
						<div class="jj_Boxrg1">
						<img src="images/jj_rg01.jpg">
					</div>
					<div class="jj_Boxrg2">
						<h3>中心简介</h3>
					</div>
					<div class="jj_Boxrg3">
						<div class="jj_Boxrg31">
							<p style="font-size:16px;">【中南大学湘雅二医院简介】</p>
							<p>
								中南大学湘雅二医院(原湖南医科大学附属第二医院)位于历史名城，湖南省会长沙，脱胎于1906年美国雅礼协会在中国创办最早的西医院之一——雅礼医院，始建于1958年，是一所卫生部直属的大型三级甲等医院，隶属于教育部直属的中南大学，是国内学科最齐全、技术力量最雄厚的医院之一，素有"南湘雅"美誉。先后荣获全国百佳医院、全国五一劳动奖状、全国卫生系统先进集体等荣誉称号。</p>
							<p>
								医院拥有国家代谢性疾病临床医学研究中心、精神疾病诊治技术国家地方联合工程实验室两个国家级科研平台，形成了由精神病与精神卫生学(含医学心理中心)、心胸外科、代谢病与内分泌学、神经病学、耳鼻咽喉科学、普通外科学(重点培育学科)6个国家重点学科以及药学部(临床药学)、骨科、心血管内科、血液内科、内分泌科、胸外科、心脏大血管外科、精神病科、临床护理专业、呼吸内科、神经内科、肾病科、普通外科、眼科、皮肤科、麻醉科、耳鼻咽喉科、消化内科、医学影像科、感染病科、康复医学科、风湿免疫科、老年病科等23个卫生部临床重点建设专科，糖尿病免疫学教育部重点实验室、肾脏病和血液净化学湖南重点实验室、医学表观基因组学湖南省重点实验室、湖南省心血管病现代医疗技术研究中心、精神疾病诊疗技术湖南省工程实验室、精神病学与精神卫生学湖南省重点实验室和湖南省麻醉临床医疗技术研究中心7个省部级重点实验室;内科学、外科学、妇产科学、皮肤病与性病学、儿科学、眼科学、护理学、肿瘤学、医学心理学、中西医结合医学、特种医学等11个湖南省重点学科组成的优势学科平台。</p>
							<p>中南大学湘雅二医院健康管理中心位于医院东侧维一星城国际商务楼(一、二层)，占地面积4627
								平方米，是医院投资购置的专业性体检机构，具有高档的装修和一整套设施的备置，交通便捷、环境优雅舒适，体检流程布局合理，拥有现代化的分诊导诊系统，全程体检实现了科学化、网络化管理，内设贵宾区、男宾区、女宾区，配备有TTM热断层扫描成像系统、法国鹰演DDFAO全身健康扫描系统、进口彩色超声诊断仪、数码X光照片机、动脉硬化检测仪、骨密度测定仪等高档检测设备，并拥有一支医德高尚、技术精湛的专业检诊队伍和态度热忱、礼貌端庄的服务团队，为客户提供专业化、个性化的一站式服务。健康管理中心隶属医院业务科室，共享医院医疗资源，检测项目齐全，全套体检项目均在同一楼层完成，检后实行绿色通道和健康管理服务，是目前国内医疗行业最高端的健康管理中心之一。</p>
							<p>
								健康管理中心设计有各类人群、常见疾病的体检套餐，承接各单位领导、员工、VIP客户、省、市、区参保人员、公务员、招生、招聘、家庭和个人体检，期待您的光临。</p>


						</div>
						<div class="jj_Boxrg32">
							<img src="images/jjrg02.jpg">
						</div>
						<div class="jj_Boxrg33">
							<a href="#"><img src="images/jjrg03.jpg"></a>
						</div>
						<div class="jj_Boxrg31">
							<p style="font-size:16px;">【我们的优势】</p>
							<p>1、一流的专业医疗团队4100余人、舒适宽敞的医院环境（占地面积230余亩）以及拥有目前先进的医疗设备8台(件)。</p>
							<p>2、每年开展高新技术近100项，在国内较早开展了多种器官移植，受术者生存质量高，整体水平达国内先进，是全国获准开展器官移植项目医院之一。</p>
							<p>3、拥有30个卫生部专科医师培训基地、卫生部全科医师临床培养基地，10个省级诊疗中心、11个省级质控中心，湖南省卫生应急救援培训基地亦落户该院。</p>
							<p>
								4、配备有TTM热断层扫描成像系统、法国鹰演DDFAO全身健康扫描系统、进口彩色超声诊断仪、数码X光照片机、动脉硬化检测仪、骨密度测定仪等高档检测设备。</p>
							<p>5、并拥有一支医德高尚、技术精湛的专业检诊队伍和态度热忱、礼貌端庄的服务团队，为客户提供专业化、个性化的一站式服务。</p>
							<p>6、体检项目齐全，检后实行绿色通道和健康管理服务，是目前国内医疗行业高端的健康管理中心之一。</p>
							<p style="font-size:16px;">【我们的荣誉】</p>
						</div>

					</div>
					<div class="jj_Boxrg2">
						<h3>我们的价值心</h3>
					</div>

					<div class="jj_Boxrg4">
						<div class="jj_Boxrg41">
							<dl>
								<dd>
									<a href="#" target="_blank"><img
										src="images/jjjx_01.jpg"></a>
								</dd>
								<dt>在这里，我们拥有一套综合性的、完整的健康体检方案，精细到每一个部位。</dt>
							</dl>
							<dl>
								<dd>
									<a href="#" target="_blank"><img
										src="images/jjjx_02.jpg"></a>
								</dd>
								<dt>机构70%以上均是三甲医院副主任级别以上资深专家，把关体检项目，体检我们更专业。</dt>
							</dl>
							<dl>
								<dd>
									<a href="#" target="_blank"><img
										src="images/jjjx_03.jpg"></a>
								</dd>
								<dt>检后，由资深专家深度解析体检报告、体检数据结果，提供运动、饮食等健康干预方案。</dt>
							</dl>
						</div>
					</div>

					<div class="jj_Boxrg2" style="margin-top:30px;">
						<h3>热心公益 · 责任钻研</h3>
					</div>
					<div class="jj_Boxrg5">
						<dl style=" margin-left:80px;">
							<dd>
								<img src="images/jjzy_01.jpg"
									alt="热心公益.责任钻研">
							</dd>
							<dt>
								<p style="font-size:15px;">
									在不断的锐意进取中，湘雅二医院健康管理中心始终秉承社会责任，热心公益事业，以高品质的专业体检技术和服务，与广大人士一起传递健康的宗旨，
									缔造健康幸福的生活。</p>
							</dt>
						</dl>
						<div class="brand4-r">
							<img src="images/jjzy_02.jpg" alt="钻研">
						</div>
					</div>
				</div>
				<!-- aboutus conetent end -->
			</div>
		</div>
	</div>

	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />

</body>
</html>

