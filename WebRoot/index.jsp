<%@page import="com.hbhglekang.db.table.Taocan"%>
<%@page import="com.hbhglekang.db.table.TaocanInfo"%>
<%@page import="com.hbhglekang.db.table.Zhuanjia"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.hbhglekang.db.CacheMap"%>
<%@page import="com.hbhglekang.db.DbManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	CacheMap cacheMap = DbManager.instance.getCacheMap();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="head.jsp" />
<!-- body area -->
<body>

	<jsp:include page="head_nav.jsp" />

	<!-- content area start -->

	<div class="box_box" style="background:#e8f7fb;height:360px;">
		<div class="bannerbox" style="height:308px">
			<div class="topleft"
				style="height: 355px;position: relative;z-index: 1;">
				<ul class="category fl">
					<li><a href="<%=basePath %>jibing.jsp" class="cheng">疾病检查</a></li>
					<li><a href="<%=basePath %>taocan.jsp" class="">按人群体检</a></li>
					<li><a class="">热门筛查项目</a></li>
					<li><a href='http://www.xyyytj.com/plus/swt.php' class="">团体体检咨询</a>
					</li>
					<li><a href="<%=basePath %>anli.jsp" class="">体检案例</a></li>
					<li><a href='<%=basePath %>tijian.jsp?parent_id=12&id=16' class="">体检套餐预约</a></li>
				</ul>
				<div style="display: none;" class="wenXue kuang">
					<a href="<%=basePath %>jibing.jsp"></a>
					<p>
						<a href="<%=basePath %>jibing.jsp">脑部检查</a>
					</p>
				</div>
				<div style="display: none;" class="rwsk kuang">
					<a href="http://www.xyyytj.com/taocan/"></a>
					<p>
						<a href="/taocan/jichu/">全身体检</a>
					</p>
					<p>
						<a href="/taocan/yjk/">亚健康</a>
					</p>
					<p>
						<a href="/taocan/nxtc/">女性体检</a>
					</p>
					<p>
						<a href="/taocan/zln/">中老年体检</a>
					</p>
					<p>
						<a href="http://www.xyyytj.com/taocan/jichu/13812.html">男性体检</a>
					</p>
				</div>
				<div style="display: none;" class="child kuang">
					<a href="http://www.xyyytj.com/taocan/"></a>
					<p>
						<a href="http://www.xyyytj.com/ttm/">TTM全身体检</a>
					</p>
					<p>
						<a href="http://www.xyyytj.com/swcc/">三维彩超</a>
					</p>
					<p>
						<a href="http://www.xyyytj.com/hcgz/">核磁共振</a>
					</p>
					<p>
						<a href="http://www.xyyytj.com/wj/">电子胃镜</a>
					</p>
					<p>
						<a href="http://www.xyyytj.com/cj/">电子肠镜</a>
					</p>
					<p>
						<a href="http://www.xyyytj.com/petct/">petct</a>
					</p>
				</div>
				<div style="display: none;" class="lzcg kuang">
					<a href="<%=basePath %>"></a>

				</div>
				<div style="display: none;" class="zrkx kuang">
					<a href="<%=basePath %>"></a>
				</div>



				<h6>
				<!-- 
					<a href="http://www.xyyytj.com/plus/swt.php" target="_blank"
						title='在线咨询'
						style="border:1px solid #86d3ec;background:#20afdc;margin-right:10px;">在线咨询</a>
					-->
					<a style="border:1px solid #f6c777; background:#f39800;"
						href="/guahao/" target="_blank" title='网上挂号'>网上挂号</a>
				</h6>
			</div>
			<!--topleft end-->
			<div class="topright" style="height:324px">

				<div class="huandeng">
					<div class="imgnav" id="imgnav">
						<div id="ctrl" class="ctrl">
							<div id="btn">
								<span class="hov"></span> <span class=""></span> <span class=""></span>
								<span class=""></span>
							</div>
						</div>
						<div id="img">
							<a href="ttm.html" target="_blank"> <img
								style="display: inline;" src="images/index_quanshen.jpg"
								alt="TTM全身体检">
							</a> <a href="taocan/zln/" target="_blank"> <img
								style="display: none;" src="images/index_laonian.jpg"
								alt="中老年人体检">
							</a> <a href="taocan/danwei/" target="_blank"> <img
								style="display: none;" src="images/index_qiye.jpg" alt="企业、单位体检">
							</a> <a href="taocan/danwei/" target="_blank"> <img
								style="display: none;" src="images/index_qiye.jpg" alt="企业、单位体检">
							</a>
						</div>
					</div>
					<!--imgnav end-->
				</div>
				<!--huandeng end-->
				<script type="text/javascript">
					$(function() {//页脚幻灯
						var t = false;
						var j = 1;
						$("#btn span").each(function(i) {
							$(this).mouseover(function() {
									if (i < 3) {
										j = i;
									} else {
										j = -1;
									}
						$(this).addClass("hov").siblings(".hov").removeClass("hov");
						$("#img img:visible").fadeOut(0,
							function() {$("#img img").eq(i).fadeIn(0,function() {
										$("#msg li:visible").hide();
										$("#msg li").eq(i).show();
										})
									});
								});
							})

						$.func_play = function() {
							$("#btn span").eq(j).mouseover();
							j++;
							if (j == 4) {
								j = 0;
							}
						}
						setInterval($.func_play, 2000);

						$("#imgnav").hover(function() {
							clearInterval(t);
						}, function() {
							t = setInterval($func_play, 2000);
						})
					})
				</script>


			</div>
			<!--topright end-->
		</div>
	</div>

	<div class="box_box"
		style="border-top:2px solid #20afdc; background:#fff;">
		<div class="main-top">
			<div class="hot_tc">
				<div class="index_title">
					<img
						src="<%=basePath %>images/taocan/remen_taocan.jpg"
						width="153" height="40"
						style="position:absolute; z-index:1; left:-3px;;top:-1px;"><a
						href="<%=basePath %>taocan.jsp" target="_blank">更多>></a>
				</div>
				<%
					Set<Entry<Integer, TaocanInfo>> entrys = cacheMap.taocanInfoMap.id2TaocanInfo.entrySet();
					int breakFlag = 0;
					for(Entry<Integer, TaocanInfo> entry : entrys){
						TaocanInfo taocanInfo = entry.getValue();
						Taocan taocan = cacheMap.getTaocan(taocanInfo.getTcid());
				%>
				<div class="index_tc_list">
					<a href="<%=basePath %>taocan.jsp?tcid=<%=taocan.getId() %>" target="_blank">
						<img src="<%=((taocan.getPic_path() != null && taocan.getPic_path().trim().length() > 0) ? taocan.getPic_path() : "/lekang_portal/images/avatar.jpg") %>" alt="<%=taocan.getName() %>" width="267" height="152"> 
					</a> 
					<a href="<%=basePath %>taocan.jsp?tcid=<%=taocan.getId() %>" target="_blank"><h5><%=taocan.getName() %></h5> </a>
					<ul>
						<li>
							<%-- <h2>已有<font><%=taocanInfo.getCount() %>人</font>购买</h2> --%>
							<a href="<%=basePath %>taocan.jsp?id=<%=taocanInfo.getId() %>" target="_blank" class="blue_color">查看男性</a>
						</li>
						<li>
							<%-- <h2>已有<font><%=taocanInfo.getCount() %>人</font>购买</h2> --%>
							<a href="<%=basePath %>taocan.jsp?id=<%=taocanInfo.getId() %>" target="_blank" class="pink_color">查看女性</a>
						</li>
					</ul>
				</div>
				<%
						++breakFlag;
						if(breakFlag == 6){
							break;
						}
					}
				%>
				<div style="height:1px;"></div>
			</div>
			<!--hottc end-->
			<div class="morefw">
				<div class="index_title">
					<font>TTM全身体检</font><a href="<%=basePath %>ttm.jsp" target="_blank">更多>></a>
				</div>
				<dl>
					<dt>
						<img src="<%=basePath %>images/pic2.jpg" alt="服务">
					</dt>
					<%
					for(int i=0; i<8; i++)
					{
					%>
					<dd>
						<a href="<%=basePath %>ttm.jsp?articleid=14212" target="_blank">湘雅TTM全身体检多少钱?</a>
					</dd>
					<%
					}
					%>
				</dl>

			</div>
			<!--morefw end-->
		</div>
	</div>

	<div class="box_box" style="margin-top:15px;">
		<div class="box_zjtd">
			<div class="index_zj">
				<div class="index_title">
					<font>专家团队</font><a href="<%=basePath %>experts.jsp" target="_blank">更多>></a>
				</div>
				<%
					Set<Entry<Integer, Zhuanjia>> zhuanjias = cacheMap.zhuanjiaMap.id2Zhuanjia.entrySet();
				%>
				<div class="gallery">
					<div class="bd">
						<ul>
						<%
						for(Entry<Integer, Zhuanjia> entry: zhuanjias){
							Zhuanjia zhuanjia = entry.getValue();
						%>
							<li>
								<div class="index_zj_con">
									<div class="index_zj_img">
										<img src="<%=((zhuanjia.getAvatar_path() == null || zhuanjia.getAvatar_path().trim().length()==0) ? "/lekang_portal/images/avatar.jpg" : zhuanjia.getAvatar_path()) %>" alt='<%=zhuanjia.getName() %>' width="123" height="172">
									</div>
									<div class="index_zj_text">
										<dl>
											<dt><%=zhuanjia.getName() %></dt>
											<dd>
												<p>
												<%=zhuanjia.getSex() %>,
												<%=zhuanjia.getAge() %>,
												<%=zhuanjia.getTitle() %>
												<%=((zhuanjia.getIntroduction().length() > 20) ? (zhuanjia.getIntroduction().substring(0, 20)+"...") : zhuanjia.getIntroduction()) %>
													<a href="<%=basePath %>experts.jsp?id=<%=zhuanjia.getId() %>" target="_blank">[查看详情]</a>
												</p>
											</dd>
										</dl>
									</div>
								</div>
							</li>
							<%
						}
							%>
						</ul>
					</div>
					<div class="hd_zj hd">
						<div class="index_zj_btn">
							<a class="sPrev" style="margin-bottom:5px;"><</a>
							<a class="sNext">></a>
						</div>
						<div class="index_zj_list">
							<ul>
							<%
								for(Entry<Integer, Zhuanjia> entry: zhuanjias){
								Zhuanjia zhuanjia = entry.getValue();
							%>	
								<li><img src="<%=((zhuanjia.getAvatar_path() == null || zhuanjia.getAvatar_path().trim().length()==0) ? "/lekang_portal/images/avatar.jpg" : zhuanjia.getAvatar_path()) %>" width="44" height="62">
									<p style="margin-top:10px;">
										<font>专家：<%=zhuanjia.getName() %></font>
									</p>
									<p>职称：<%=zhuanjia.getTitle() %></p>
								</li>
								<%
								}
							%>
							</ul>

						</div>
					</div>
				</div>
				<script type="text/javascript">
					jQuery(".hd_zj").slide({
						mainCell : "ul",
						effect : "leftLoop",
						autoPlay : true,
						vis : 2,
						prevCell : ".sPrev",
						nextCell : ".sNext",
						interTime : 5000
					});
					jQuery(".gallery").slide({
						mainCell : ".bd ul",
						effect : "leftLoop",
						autoPlay : true,
						delayTime : 500,
						defaultIndex : 0,
						interTime : 5000
					});
				</script>

			</div>

			<div class="myjc">
				<div class="index_title"
					style="margin-bottom:0px;border-right:1px solid #e9e9e9;">
					<font style="width:244px;">上月健康体检人数 1352人</font>
				</div>
				<div class="myjc_text">
					<div class="img_bg_1">
						<ul>
							<li style="margin-left:85px;">320例</li>
							<li style="margin-left:105px;">283例</li>
							<li style="margin-left:50px;">5例</li>
							<li style="margin-left:145px;">453例</li>
							<li style="margin-left:85px;">367例</li>
							<li style="margin-left:10px;">55例</li>
						</ul>
					</div>
					<div class="img_bg_2">
						<ul>
							<li style="margin-top:65px;">40%</li>
							<li style="margin-top:20px;">20%</li>
							<li style="margin-top:20px;">15%</li>
							<li style="margin-top:15px;">18%</li>
						</ul>
						<ol>
							<li style="margin-top:65px;">47%</li>
							<li style="margin-top:20px;">35%</li>
							<li style="margin-top:20px;">55%</li>
							<li style="margin-top:15px;">25%</li>
						</ol>
					</div>
				</div>
			</div>
		</div>


	</div>

	<div class="box_box" style="margin-top:15px;">
		<div class="jkgl">
			<div class="index_title" style="border-top:none;">
				<img
					src="<%=basePath %>images/xyimg_45.jpg"
					style="position:absolute; z-index:1; left:-1px;;top:-1px;"
					height="40" width="153">
			</div>
			<div class="jkmm">

				<p>
					<span>健康资讯频道</span><a href="<%=basePath %>jibing.jsp" target="_blank">[更多]</a>
				</p>
				<dl>
					<dt>
						<a href="<%=basePath %>health.jsp?parent_id=7&id=10&articleid=0" target="_blank">
						<img src="/images/defaultpic.gif" alt="矿物质缺乏" height="112" width="150">
						</a>
					</dt>
					<dd>
						<a href="<%=basePath %>health.jsp?parent_id=7&id=10&articleid=0" target="_blank">很多人自己身体总出现这样那样的问题，查来查去也没有查出问题，殊不知有些不良情况的发生是因为体内矿物质的缺乏引起...</a>
					</dd>

				</dl>




				<ul>
					<%
					for(int i=0; i<5; i++)
					{
					%>
					<li><a href="<%=basePath %>health.jsp?parent_id=7&id=10&articleid=0" target="_blank">矿物质缺乏有哪些症状</a>
					</li>
					<%
					}
					%>
				</ul>
			</div>

			<div class="mzgl">
				<div class="qibox">
					<div class="lqbz">
						<img class="gonglue"
							src="http://www.xyyytj.com/templets/0592ttm/new_images/mzgl.jpg"
							alt="每周攻略">
						<div class="p3">
							<p style="line-height:35px; height:35px;">
								第 <span>222</span> 期
							</p>
							<p>责任编辑</p>
							<p>zyx</p>
						</div>
					</div>

					<a href="" target="_blank"><img class="pic5"
						src="http://www.xyyytj.com/templets/0592ttm/new_images/2-130419144A1147.jpg"
						alt="健康攻略" height="121" width="380"> </a>
				</div>
				<p class="wenzi2">
					现在老年人退休后，经济条件还不错的人对于养生保健这块都挺重视的，有些老人还会定期对身体进行检查。而现如今体检机构也是越来越多了，体检机构该如何选择也成了许多人的困扰。那...<a
						href="<%=basePath %>health.jsp?parent_id=7&id=9&articleid=0" target="_blank">[查看攻略]</a>
				</p>

				<ul>
					<%
					for(int i=0; i<2; i++)
					{
					%>
					<li><span>[<a href='<%=basePath %>health.jsp?parent_id=7&id=9'>体检问答</a>]
					</span><a href="<%=basePath %>health.jsp?parent_id=7&id=9&articleid=0" target="_blank">长沙40岁的男人体检</a></li>
					<%
					}
					%>
					<%
					for(int i=0; i<1; i++)
					{
					%>
					<li><span>[<a href='<%=basePath %>health.jsp?parent_id=7&id=8'>体检常识</a>]
					</span><a href="<%=basePath %>health.jsp?parent_id=7&id=8&articleid=0" target="_blank">长沙吃盐过需要定期做哪些项目检查</a></li>
					<%
					}
					%>
				</ul>
			</div>
			<div class="tjdp">
				<p class="dptitle">
					<span>体检资讯及问答</span>
				</p>
				<div class="gundongbox">

					<div class="jkmm1">
						<ul>
						<%
						for(int i=0;i<8;i++)
						{
						%>
							<li><a href="<%=basePath %>health.jsp?parent_id=7&id=9&articleid=0" target="_blank">长沙哪里可以检查内分泌</a>
							</li>
						<%
						}
						%>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script language="javascript" src="js/ToolTip.js"></script>

	<div class="box_box" style="height:282px;margin-top:20px; ">
		<div style="width:1200px; margin:0 auto;">
			<div class="index_huanjing" style="width:900px;">
				<ul>
					<li class="">
						<div style="width:400px; height:252px">
							<img
								src="http://www.xyyytj.com/uploads/allimg/140220/111-1402201RG3.jpg"
								width="399" height="252"
								onMouseOver="toolTip('<img src=http://www.xyyytj.com/uploads/allimg/140220/111-1402201RG3.jpg>')"
								onMouseOut="toolTip()">
						</div>
					</li>

					<li class="">
						<div style="width:200px; height:120px; margin-bottom:10px;">
							<img
								src="http://www.xyyytj.com/uploads/allimg/140220/111-1402201R559.jpg"
								width='200' height="120"
								onMouseOver="toolTip('<img src=http://www.xyyytj.com/uploads/allimg/140220/111-1402201R559.jpg>')"
								onMouseOut="toolTip()">
						</div>
					</li>

					<li class="">
						<div style="width:120px; height:120px; margin-bottom:10px;">
							<img
								src="http://www.xyyytj.com/uploads/allimg/140220/111-1402201R330.jpg"
								width="119" height="120"
								onMouseOver="toolTip('<img src=http://www.xyyytj.com/uploads/allimg/140220/111-1402201R330.jpg>')"
								onMouseOut="toolTip()">
						</div>
					</li>
					<li class="">
						<div style="width:120px; height:120px; margin-bottom:10px;">
							<img
								src="http://www.xyyytj.com/uploads/allimg/140125/1-140125113144G9.JPG"
								width="119" height="120"
								onMouseOver="toolTip('<img src=http://www.xyyytj.com/uploads/allimg/140125/1-140125113144G9.JPG>')"
								onMouseOut="toolTip()">
						</div>
					</li>

					<li class="">
						<div style="width:120px; height:120px">
							<img
								src="http://www.xyyytj.com/uploads/allimg/140125/1-140125113642424.JPG"
								height="120" width="120"
								onMouseOver="toolTip('<img src=http://www.xyyytj.com/uploads/allimg/140125/1-140125113642424.JPG>')"
								onMouseOut="toolTip()">
						</div>
					</li>

					<li class="">
						<div style="width:200px; height:120px">
							<img
								src="http://www.xyyytj.com/uploads/allimg/140220/111-1402201R003.jpg"
								width="200" height="120"
								onMouseOver="toolTip('<img src=http://www.xyyytj.com/uploads/allimg/140220/111-1402201R003.jpg>')"
								onMouseOut="toolTip()">
						</div>
					</li>

					<li class="">
						<div style="width:119px; height:120px">
							<img
								src="http://www.xyyytj.com/uploads/allimg/140220/111-1402201Q140.jpg"
								width="119" height="120"
								onMouseOver="toolTip('<img src=http://www.xyyytj.com/uploads/allimg/140220/111-1402201Q140.jpg>')"
								onMouseOut="toolTip()">
						</div>
					</li>
				</ul>
			</div>
			<div class="zxyy">
				<a href="<%=basePath %>location.jsp" class="color_1" style="margin-left:30px;" title="来院路线">来院路线</a> 
				<a onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=16676590&o=http://localhost:8090&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');" class="color_2" title="在线咨询">在线咨询</a>
				<!-- 
				http://bizapp.qq.com/webpres.htm
				<img  style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=16676590&o=http://localhost:8090&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"  border="0" SRC=http://wpa.qq.com/pa?p=1:16676590:1 alt="在线咨询">
				 -->
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$(".yqlj li").eq(0).css("height", "31px");
			$(".yqlj li").eq(0).css("border", "1px solid #e9e9e9");
			$(".yqlj li").eq(0).css("border-bottom", "none");
			$(".yqlj li").hover(function() {
				$(".yqlj li").css("height", "30px");
				$(".yqlj li").css("border", "none");
				$(".yqlj p").css("display", "none");
				var num = $(".yqlj li").index(this);
				$(".yqlj p").eq(num).css("display", "block");
				$(".yqlj li").eq(num).css("height", "31px");
				$(".yqlj li").eq(num).css("border", "1px solid #e9e9e9");
				$(".yqlj li").eq(num).css("border-bottom", "none");
			})
		})
	</script>

	<div class="box_box">
		<div class="yqlj">
			<ul>
				<li>友情链接</li>
				<li>其他链接</li>
			</ul>
			<p class="p_1" style="display:block;">
				<a href="http://yy.china.com.cn/tjk/" target="_blank">体检科</a> <a
					href="http://www.bj999.cn" target="_blank">北京妇科医院</a>
			</p>
		</div>
	</div>

	<!-- content area end -->

	<jsp:include page="foot_nav.jsp" />

</body>
</html>
