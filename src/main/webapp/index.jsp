<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


		<title>云租房+-首页</title>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
	</head>
	<body>

	<%-- 1、头部导航--%>
	<div id="commonTopbar" class="commonTopbar" style="min-width: 1190px;">
		<div class="w pos">
			<div class="bar_left"><h2>武汉</h2> <span id="commonTopbar_ipconfig">[<a
					href="javascrpit:void(0)"
					target="_self" tongji_tag="pc_topbar_log_changcity" style="margin-left:0; padding:0px;">切换城市</a>]</span>
				<div id="commonTopbar_appQR" class="haschild"><a class="mytxt">厚溥APP</a><span class="arrow"></span><span
						class="mark"></span>
					<div class="appQRbox"><img data-lazy="">
						<p>扫描二维码下载</p></div>
				</div>
				<div id="commonTopbar_homepageLink"><strong><a class="mytxt"
															   href="${pageContext.request.contextPath}/WEB-INF/index.jsp"
															   target="_blank"
															   tongji_tag="pc_topbar_log_home">厚溥云租房首页</a></strong>
				</div>
			</div>
			<div class="bar_right">
				<div id="commonTopbar_login"><a
						href="${pageContext.request.contextPath}/user/toLoginPage"
						target="_self" tongji_tag="pc_topbar_log_login">登录</a><span class="gap">|</span><a
						href="${pageContext.request.contextPath}/user/toRegisterPage" >注册</a></div>
				<div id="commonTopbar_mymenu" class="haschild"><a id="commonTopbar_tomy" target="_blank"
																  href="javascript:void(0)"
																  tongji_tag="pc_topbar_log_my">个人中心</a><span
						class="arrow"></span><span class="mark"></span>
					<div class="hc" id="commonTopbar_loginbox"><a id="dd" href="javascript:void(0)"
																  target="_blank" tongji_tag="pc_topbar_log_my_account">我的账户</a><a
							id="" href="" target="_blank"
							tongji_tag="pc_topbar_log_my_account">我的浏览</a><a
							id="commonTopbar_tohelp" href="javascript:void(0)"
							target="_blank" tongji_tag="">举报中心</a></div>
				</div>
				<div id="commonTopbar_vip" class="haschild"><a class="mytxt" href=""
															   target="_blank">商家中心</a><span class="arrow"></span><span
						class="mark"></span>
					<div class="hc"><a id="commonTopbar_tomypost" href="${pageContext.request.contextPath}/admin/"
									   target="_blank" tongji_tag="pc_topbar_log_my_post">我的发布</a><a
							href="javascript:void(0)" target="_blank">账户资料</a><a
							href="javascript:void(0)" target="_blank">我的资金</a></div>
				</div>
				<div id="commonTopbar_help" class="help-con haschild"><a
						href="javascript:void(0)"
						class="mytxt">帮助中心</a><span class="arrow"></span><span class="mark"></span>
					<div class="hc"><h>客户</h>
						<p>
							<a href="javascript:void(0)"
							   target="_blank" tongji_tag="pc_topbar_log_my_helpcenter">客户帮助</a>|<a
								href="javascript:void(0)"
								target="_blank">网站建议</a></p>
						<p><a href="javascript:void(0)" target="_blank">反欺诈联盟</a>|<a
								href="javascript:void(0)" target="_blank">维权中心</a></p>
						<h>商户</h>
						<p>
							<a href="javascript:void(0)"
							   target="_blank" tongji_tag="pc_topbar_log_my_helpcenter">商户帮助</a>|<a
								href="javascript:void(0)">渠道招商</a></p>
						<p><a href="javascript:void(0)" target="_blank">成为会员</a>|<a href="javascript:void(0)"
																					target="_blank">推广热线</a></p>
						<p>
							<a href="javascript:void(0)"
							   target="_blank">学习中心</a>|<a href="javascript:void(0)"
														   target="_blank">处罚申诉</a></p></div>
				</div>
				<div class="help-con"><a href="javascript:void(0)" class="mytxt"
										 tongji_tag="pc_topbar_log_ai" target="_blank">联系客服</a></div>
				<div id="commonTopbar_sitemap" class="haschild"><span class="mytxt">网站导航</span><span
						class="arrow"></span><span class="mark"></span>
					<div id="commonTopbar_sitemapBox" class="hc">
						<ul class="maplist">
							<li class="list0 tracker" tracker="house"><h><a href="javascript:void(0)"
																			target="_blank">房产</a></h>
								<p class="subtitle"><a href="javascript:void(0)" target="_blank">房屋出租</a></p>
								<p><a href="javascript:void(0)" target="_blank">整租</a>|<a href="javascript:void(0)"
																						  target="_blank">合租</a>|<a
										href="javascript:void(0)" target="_blank">公寓</a></p>
								<p class="subtitle"><a href="javascript:void(0)" target="_blank">商业地产</a></p>
								<p><a href="javascript:void(0)" target="_blank">商铺出租</a>|<a
										href="javascript:void(0)" target="_blank">商铺出售</a></p>
								<p><a href="javascript:void(0)" target="_blank">写字楼出租</a>|<a
										href="javascript:void(0)" target="_blank">生意转让</a></p>
								<p><a href="javascript:void(0)" target="_blank">厂房</a>|<a
										href="javascript:void(0)" target="_blank">仓库</a>|<a href="javascript:void(0)"
																							target="_blank">土地</a>
								</p>
							</li>
						</ul>
						<i class="shadow"></i></div>
				</div>
			</div>
		</div>
	</div>
	<%-- 2、轮播图--%>

		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="../index/img/1.jpg" alt="">
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<img src="../index/img/2.jpg" alt="">
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<img src="../index/img/3.jpg" alt="">
				<div class="carousel-caption">
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<%--  3、尾部--%>
	<div id="commonFooter" class="commonFooter">
		<div class="upWrap">
			<a target="_blank"  href="javascript:void(0)" rel="nofollow">常见问题</a><span>|</span>
			<a target="_blank"  href="javascript:void(0)" rel="nofollow">帮助中心</a><span>|</span>
			<a  target="_blank" href="javascript:void(0)" rel="nofollow">意见反馈</a><span>|</span>
			<a target="_blank" href="javascript:void(0)" rel="nofollow">了解厚溥云租房</a><span>|</span><a
				target="_blank" href="javascript:void(0)" rel="nofollow">加入厚溥云租房</a><span>|</span>
			<a target="_blank"   href="javascript:void(0)" rel="nofollow">反欺诈联盟</a><span>|</span>
			<a target="_blank" href="javascript:void(0)" rel="nofollow">报案平台</a><span>|</span>
			<a target="_blank"  href="javascript:void(0)"  rel="nofollow">推广服务</a><span>|</span>
			<a target="_blank" href="javascript:void(0)" rel="nofollow">渠道招商</a><span>|</span>
			<a target="_blank"  href="javascript:void(0)"   rel="nofollow">维权中心</a><span>|</span>
			<a target="_blank" href="javascript:void(0)" rel="nofollow">Investor Relations</a>
		</div>
		<div class="downWrap">
			<div><em>2006-2021 myhopu.com版权所有</em><span>|</span><a target="_blank"
																   href="javascript:void(0)"
																   rel="nofollow">鄂ICP备11005077号-1</a><span>|</span>
				<a target="_blank" href="javascript:void(0)">联系我们</a></div>
			<div>
				<a target="_blank"
				   href="javascript:void(0)">人力资源服务许可证</a><span>|</span>
				<a target="_blank" href="javascript:void(0)"
				   rel="nofollow">互联网药品信息服务资格证</a><span>|</span>
				<a target="_blank"  href="javascript:void(0)"  rel="nofollow">广播电视节目制作经营许可证</a>

			</div>
		</div>
	</div>

	</body>
</html>
