<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>云+-房屋详情信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/index/lib/amazeui/assets/css/amazeui.css" />
	<!--<link rel="stylesheet" href="lib/swiper/css/swiper.min.css" />-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/index/lib/sliderPro/slider-pro.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/hp.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/room.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/room_detail.css"/>

	<script src="${pageContext.request.contextPath}/index/lib/amazeui/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/index/lib/amazeui/assets/js/amazeui.js"></script>
	<script src="${pageContext.request.contextPath}/index/lib/sliderPro/jquery.sliderPro.min.js"></script>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>

	<script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=IPhRdbtgEfWjSOWdftKlRc5LVNaPEgDU"></script>
</head>

<body>
<%-- 1、头部导航--%>
<jsp:include page="${pageContext.request.contextPath}/common/header.jsp"></jsp:include>

<%-- 2、头部信息 --%>
<div id="header-wrap" class="header-wrap">
	<div class="content clearfix">
		<a class="logo fl" href="" target="_blank" onclick=""></a>
		<a class="top-publish-news fr" href="" target="_blank" onclick="">免费发布</a>
	</div>
</div>

<%-- 3、房源信息--%>
<div class="main-wrap">
	<!--房源题目-->
	<div class="house-title">
		<h1 class="c_333 f20 strongbox">${room.title}</h1>

		<p class="house-update-info c_888 f12">
			<!-- 临时下线徐州发布时间 -->
			10-12&nbsp;&nbsp;&nbsp;&nbsp;
		</p>

		<div class="title-right-info f12">
			<a id="su_kfdnew" class="collect-house pr c_888 clt-btn" href="javascript:void(0)" onclick="dealFavorite(${room.id})"><i class="icon"></i><span>加入收藏</span></a>
			<a id="richscan" class="richscan-house pr c_888" href="javascript:;"><i class="icon"></i>扫一扫</a>
			<a id="gaq_phone" class="see-by-phone pr c_888" href="javascript:;"><i class="icon"></i>发送到手机</a>
			<!-- 增加举报位置 -->
			<a id="report" class="report pr c_888" href="javascript:;"><i class="icon"></i>举报</a>
			<!-- 增加举报位置end -->
		</div>
	</div>

	<!--房源基本信息-->
	<div class="house-basic-info">
		<div class="house-basic-pic fl">
			<!-- todo 没有了原先的default样式 -->
			<div id="bigImg" class="basic-top-bigpic pr " onclick="clickLog('from=fcpc_detail_wh_tupian_datu0')"><!---->
				<!-- 视频加1 start -->
				<!-- 视频加1 end -->
				<img id="smainPic" src="http://localhost/${room.roomImgList[0].img}" style="margin-top: 0px;">
				<span id="sImgNu" class="leftNum pa f12">1/9</span>

				<!-- 视频加2 start -->
				<!-- 视频加2 end -->

				<div class="basic-pic-load" id="loadingSmall" style="display: none;">
					<div class="top icon"></div>
					<div class="bottom icon"></div>
				</div>
			</div>

			<div class="basic-pic-list pr">
				<ul id="leftImg" class="pic-list-wrap pa" style="left: 0px;">
					<c:forEach items="${room.roomImgList}" var="roomImg">
						<li id="xtu_xtu_1" class="actives" data-src="//pic2.58cdn.com.cn/mobile/big/n_v2710b42915e034a6c9ebbabb9d8aada57.jpg?w=640&amp;h=480&amp;crop=1">
							<img data-src="//pic2.58cdn.com.cn/mobile/big/n_v2710b42915e034a6c9ebbabb9d8aada57.jpg?w=180&amp;h=135&amp;crop=1" src="http://localhost/${roomImg.img}">
						</li>
					</c:forEach>
				</ul>

				<a id="slbt" class="basic-pic-left icon pa" href="javascript:void(0);" onclick="changePicPre()"></a>
				<a id="srbt" class="basic-pic-right icon pa" href="javascript:void(0);" onclick="changePicNext()"></a>
			</div>
		</div>
		<div class="house-basic-right fr">
			<div class="house-basic-desc">
				<div class="house-desc-item fl c_333">
					<div class="house-pay-way f16"><span class="c_ff552e"><b class="f36 strongbox">${room.rent}</b>
                                 元/月</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="instructions">押一付一</span>

					</div>
					<ul class="f14">
						<li><span class="c_888 mr_15">租赁方式：</span><span>${room.rentType} - 次卧</span>
						</li>
						<li><span class="c_888 mr_15">房屋类型：</span><span class="strongbox">${room.roomType}&nbsp;&nbsp;${room.area}平&nbsp;&nbsp;简单装修 </span>
						</li>
						<li>
							<span class="c_888 mr_15">朝向楼层：</span>
							<span class="strongbox">南&nbsp;&nbsp;高层 / 23层</span>
						</li>
						<li><span class="c_888 mr_15">所在小区：</span><span><a class="c_333 ah" href="javascript:void(0)" target="_blank" >${room.address}</a></span>
							<em class="zs c_888 f12">
								(在租 <a class="c_0091d7 ah" href="javascript:void(0)" target="_blank">
								54</a>
								套)
							</em>
						</li>
						<li><span class="c_888 mr_15">所属区域：</span><span>
                                                                        <a class="c_333 ah" href="javascript:void(0)" target="_blank" >${room.region.regionName}</a>&nbsp;&nbsp;
                                                                        <%--<a class="c_333 ah" href="javascript:void(0)" target="_blank" >新南湖</a>--%>
                                                                    </span><em class="dt c_888 f12">${room.trafficCondition}</em>
						</li>
						<li>
							<span class="c_888 mr_15">详细地址：</span>
							<span class="dz">${room.detailAddress}</span>
						</li>
					</ul>
				</div>

				<div class="house-agent-info house-broker-info fr" id="vipAgent" style="margin-top: 12px">
					<div class="agent-info-block basic-info">
						<!--头像-->
						<div class="agent-head-portrait pr">
							<a href="javascript:void(0)" target="_blank">
								<img src="https://pic1.ajkimg.com/display/009e70d47911d771abc61fffcbb7764b/100x133.jpg">
							</a>
						</div>
						<!-- 姓名+认证 -->
						<p class="agent-name f16 pr">
							<a class="c_000" href="javascript:void(0)" target="_blank" title="点击查看ta的信用" onclick="clickLog('from=fcpc_detail_wh_xingming')">卢淑奇(经纪人)</a>
							<i class="icon pho-approve" title="手机已认证"></i>
						</p>
						<!-- 所属公司 -->
						<p class="agent-company">
							武汉蛋壳公寓管理有限公司 </p>
					</div>

					<div class="agent-info-block">
						<!-- 经纪人积分部分 --->
						<div class="agent-score">
							<div class="score-item">
								<span class="score-result">较快</span>
								<span class="score-title">微聊回复</span>
							</div>
							<div class="score-item">
								<span class="score-result">较好</span>
								<span class="score-title">房源质量</span>
							</div>
							<div class="score-item">
								<span class="score-result">一般</span>
								<span class="score-title">服务水平</span>
							</div>
						</div>
					</div>

					<div class="agent-info-block">
						<div class="agent-infor-wrap">
							<span class="employment-record-num"></span>
						</div>

						<!-- 个人店铺 + 营业执照-->
						<div class="agent-infor-wrap">
                                    <span class="agent-store">
                                        <a class="ah" href="javascript:void(0)" target="_blank" >个人店铺</a>
                                    </span>
							<span class="business-license">
                                        <span class="name">营业执照</span>
                                        <span class="popover agent-img-pop-wrapper">
                                            <a class="agent-img-pop" title="点击查看原图" target="_blank" href="javascript:void(0)">
										</a>
                                        </span>
									</span>
						</div>

					</div>
				</div>
				<!--end-->
			</div>

			<div class="house-fraud-tip">
				<div class="house-chat-cover-container">
					<div class="house-chat-cover-wrapper">
						<i class="house-chat-icon house-chat-icon-guard"></i>
						<i class="house-chat-icon house-chat-icon-phone-white"></i>
						<span class="house-chat-txt">微信扫码看电话</span>
					</div>
					<div class="phone-qr-tooltips" style="width: 240px; animation-name: none; display: none;">
						<span class="tooltips-arrow tooltips-arrow-border"></span>
						<span class="tooltips-arrow tooltips-arrow-bg"></span>
						<div class="for-center"></div>
						<div class="phone-qr-code"><canvas width="170" height="170"></canvas></div>
					</div>
				</div>
				<span class="house-chat-im im-chat im-offline"  >
                        <i class="im-icon"></i>微聊
                        </span>
				<span class="wx-wrap">
                        <i>扫一扫，微信咨询</i>
                    </span>
			</div>
		</div>
		<br class="clear">
	</div>

	<!--房源描述-->
	<div class="house-detail-desc">
		<!--主要描述-->
		<div class="main-detail-info">

			<ul class="nav-detail-bar">
				<li class="on">
					<a id="housedetailNav" href="javascript:;" jumpto="housedetailNav">房源详情</a></li>
				<li>
					<a id="districtNav" href="javascript:;" jumpto="district-wrap">小区详情</a>
				</li>
			</ul>
			<div class="report-text">
				签约前切勿付
				<span class="color">订金、押金、租金</span>
				等一切费用！务必
				<span class="color">实地看房，</span>
				查验房东和房屋证件！
			</div>

			<!--房屋配置-->
			<div class="fang-detail">
				<dl class="conf-cate">
					<dt class="title">
						卧室设施
					</dt>
					<dd class="items">
						<ul class="house-disposal">
							<li class="bed"><i class="icon"></i>床</li>
							<li class="air-condition"><i class="icon"></i>空调</li>
							<li class="chest"><i class="icon"></i>衣柜</li>
							<li class="no-config"><i class="icon"></i>电视</li>
							<li class="no-config"><i class="icon"></i>暖气</li>
							<li class="balcony"><i class="icon"></i>阳台</li>
							<li class="no-config"><i class="icon"></i>卫生间</li>
							<li class="smart-lock"><i class="icon"></i>智能门锁</li>
						</ul>
					</dd>
				</dl>
				<dl class="conf-cate">
					<dt class="title">
						公共设施
					</dt>
					<dd class="items">
						<ul class="house-disposal">
							<li class="icebox"><i class="icon"></i>冰箱</li>
							<li class="washer"><i class="icon"></i>洗衣机</li>
							<li class="no-config"><i class="icon"></i>沙发</li>
							<li class="no-config"><i class="icon"></i>油烟机</li>
							<li class="cooker"><i class="icon"></i>可做饭</li>
							<li class="broadband"><i class="icon"></i>宽带</li>
							<li class="water-heater"><i class="icon"></i>热水器</li>
							<li class="fuel-gas"><i class="icon"></i>燃气灶</li>
						</ul>
					</dd>
				</dl>
			</div>
			<div class="house-word-introduce f16 c_555">
				<!-- 增加 start -->
				<ul class="introduce-item">
					<li>
						<span class="a1">房屋亮点</span>
						<span class="a2">
                                <!-- 防疫服务特殊展示带hover -->
                                                                        <em>独立阳台</em>
                                                                            <em>押一付一</em>
                                                                            <em>配套齐全</em>
                                                                            <em>南北通透</em>
                                                                </span>
					</li>
					<li><span class="a1">出租要求</span>
						<span class="a2">
                                                    <em>不是中介</em>
                                                    <em>作息正常</em>
                                                    </span></li>
					<li>
						<span class="a1">房源描述</span>
						<span class="a2">1、精装修主卧出租，屋内有空调、大衣柜、桌子、床垫。厨房冰箱共享，客厅电视也共享。卫生间有淋浴，干净整洁；<br>2、步行十就到地铁站，小区门口多公交车，出行十分便利；<br>3、商品房小区物业到位，环境优美，绿化宜人，公共健身休闲设施齐全；<br>4、真实房源，不收中介费<br>5、希望租房的人是一个爱干净的人，屋子里禁止养宠物，有意者随时看房，提前联系即可<br>房子超干净，无中介费，随时看房！<br>6、室内配置：配备品牌家具家电、配套床垫、抱枕、台灯、桌椅、衣柜、空调、洗衣机、冰箱和宽带。<br>7、定期保洁阿姨清理卫生，拒绝脏乱差。是抢手的好房啊，刚出来的，赶快打电话询问吧！</span>
					</li>
				</ul>
				<!-- 增加 end -->
			</div>

			<!--小区简介-->
			<div id="district-wrap" class="district-info-header">
				<div class="district-pic fl">
					<a href="javascript:void(0)" target="_blank">
						<img src="https://pic1.58cdn.com.cn/anjuke_58/32ba90addabb33f2a1b6296ebd9ea9fc?w=696&amp;h=522&amp;crop=1&amp;t=1&amp;srotate=1?w=140&amp;h=140&amp;crop=1" alt="小区">
					</a>
				</div>
				<div class="district-decs fl">
					<p class="title f18">
						<a class="c_333 ah rjj" \="" href="javascript:void(0)">小区:
							大华南湖公园世家东区<i class="icon"></i></a>
					</p>
					<p class="addr c_555 f14">小区地址：珞狮南路517号 </p>
					<a class="trend c_0091d7 f14 pr ah" href="javascript:void(0)" target="_blank"><i class="icon"></i>房租走势</a>
				</div>
				<div class="district-online-sale fr c_888 f14">
					<a class="c_888 ab" href="javascript:void(0)">
						<em class="c_333 f24 lh50">54</em>
						<em>在租房源</em>
					</a>
				</div>
			</div>

			<ul class="district-info-list c_333 f14 lh28">
				<li>
					<span class="c_888 mr_15">建筑年代：</span><span>2014</span>
				</li>
				<li>
					<span class="c_888 mr_15">建筑类型：</span><span>多层,小高层,高层</span>
				</li>
				<li>
					<span class="c_888 mr_15">物业公司：</span><span>武汉大华物业管理有限公司</span>
				</li>
				<li>
					<span class="c_888 mr_15">物业费用：</span><span>0.55元/平米/月</span>
				</li>
				<li>
					<span class="c_888 mr_15">所属商圈：</span>
					<span>
                            <a class="c_333 ah" href="javascript:void(0)" >洪山</a>&nbsp;/&nbsp;
                            <a class="c_333 ah" href="javascript:void(0)">新南湖</a>
                        </span>
				</li>
			</ul>
			<!--地图街景-->
			<div id="ditu">
				<div id="dtjt_wrap" class="mb15">
					<div id="dtjt_title">
						<span id="baidu_tab" class="active" onclick="clickLog('from=fcpc_detail_wh_xiaoquxq_xqditu')">小区地图&nbsp;</span>
						<span>/</span>
						<span id="soso_tab" onclick="clickLog('from=fcpc_detail_wh_xiaoquxq_xqjiejing')">&nbsp;小区街景</span>
					</div>
					<div id="baidu_map" class="map active">
						<div id="dtjt_info">
							<div id="map" style="overflow: hidden; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;"><div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: url(&quot;https://sapi.map.baidu.com/images/openhand.cur&quot;) 8 8, default;">
								<div class="BMap_mask" style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; user-select: none; width: 706px; height: 320px;"></div>
								<div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
									<span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;https://sapi.map.baidu.com/images/blank.gif&quot;); width: 20px; height: 20px; left: 343px; top: 150px; z-index: -6099932;" title=""></span>
								</div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"></div>
									<div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"><span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 343px; top: 150px; z-index: -6099932;"><div style="position: absolute; margin: 0px; padding: 0px; width: 20px; height: 20px; overflow: hidden;">
												<img src="https://img.58cdn.com.cn/images/5_0/xq/markerred.gif" style="border:none;left:0px; top:0px; position:absolute;"></div><label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background-color: rgb(255, 255, 255); border: 1px solid rgb(255, 0, 0); padding: 1px; white-space: nowrap; font: 12px arial, sans-serif; z-index: 80; user-select: none; left: 20px; top: 0px;">大华南湖公园世家东区</label>
											</span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div></div>
								<div style="position: absolute; top: 0px; left: 0px; z-index: 1; backface-visibility: hidden;"><div style="position: absolute; z-index: -100; left: 353px; top: 160px;">
									<img src="https://maponline0.bdimg.com/tile/?qt=vtile&amp;x=12430&amp;y=3462&amp;z=16&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -123px; top: -14px; opacity: 1;"><img src="https://maponline1.bdimg.com/tile/?qt=vtile&amp;x=12431&amp;y=3462&amp;z=16&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: 133px; top: -14px; opacity: 1;"><img src="https://maponline3.bdimg.com/tile/?qt=vtile&amp;x=12429&amp;y=3462&amp;z=16&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -379px; top: -14px; opacity: 1;"><img src="https://maponline0.bdimg.com/tile/?qt=vtile&amp;x=12429&amp;y=3463&amp;z=16&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -379px; top: -270px; opacity: 1;"><img src="https://maponline1.bdimg.com/tile/?qt=vtile&amp;x=12430&amp;y=3463&amp;z=16&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -123px; top: -270px; opacity: 1;"><img src="https://maponline2.bdimg.com/tile/?qt=vtile&amp;x=12431&amp;y=3463&amp;z=16&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: 133px; top: -270px; opacity: 1;"></div></div><div style="position: absolute; top: 0px; left: 0px; z-index: 2;"></div></div><div class=" anchorBL" style="height: 32px; position: absolute; z-index: 30; text-size-adjust: none; bottom: 20px; right: auto; top: auto; left: 1px;"><a title="到百度地图查看此区域" target="_blank" href="http://map.baidu.com/?sr=1" style="outline: none;"><img style="border:none;width:77px;height:32px" src="https://sapi.map.baidu.com/images/copyright_logo.png"></a></div><div id="zoomer" style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:url(https://sapi.map.baidu.com/images/openhand.cur) 8 8,default"><div class="BMap_zoomer" style="top:0;left:0;"></div><div class="BMap_zoomer" style="top:0;right:0;"></div><div class="BMap_zoomer" style="bottom:0;left:0;"></div><div class="BMap_zoomer" style="bottom:0;right:0;"></div></div><div unselectable="on" class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL" style="width: 62px; height: 186px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100; text-size-adjust: none;"><div class="BMap_stdMpPan" style="background-position: 0px 0px;"><div class="BMap_button BMap_panN" title="向上平移"></div><div class="BMap_button BMap_panW" title="向左平移"></div><div class="BMap_button BMap_panE" title="向右平移"></div><div class="BMap_button BMap_panS" title="向下平移"></div><div class="BMap_stdMpPanBg BMap_smcbg"></div></div><div class="BMap_stdMpZoom" style="height: 141px; width: 62px;"><div class="BMap_button BMap_stdMpZoomIn" title="放大一级"><div class="BMap_smcbg"></div></div><div class="BMap_button BMap_stdMpZoomOut" title="缩小一级" style="top: 120px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSlider" style="height: 102px;"><div class="BMap_stdMpSliderBgTop" style="height: 102px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSliderBgBot" style="top: 19px; height: 87px;"></div><div class="BMap_stdMpSliderMask" title="放置到此级别"></div><div class="BMap_stdMpSliderBar" title="拖动缩放" style="cursor: url(&quot;https://sapi.map.baidu.com/images/openhand.cur&quot;) 8 8, default; top: 19px;"><div class="BMap_smcbg"></div></div></div><div class="BMap_zlHolder"><div class="BMap_zlSt"><div class="BMap_smcbg"></div></div><div class="BMap_zlCity"><div class="BMap_smcbg"></div></div><div class="BMap_zlProv"><div class="BMap_smcbg"></div></div><div class="BMap_zlCountry"><div class="BMap_smcbg"></div></div></div></div></div><div unselectable="on" class=" BMap_cpyCtrl anchorBL" style="cursor: default; white-space: nowrap; color: black; background: none; font: 11px/15px arial, sans-serif; bottom: 2px; right: auto; top: auto; left: 2px; position: absolute; z-index: 10; text-size-adjust: none;"><span _cid="1"><span style="background: rgba(255, 255, 255, 0.701961);padding: 0px 1px;line-height: 16px;display: inline;height: 16px;">©&nbsp;2020 Baidu - GS(2019)5218号 - 甲测资字1100930 - 京ICP证030173号 - Data © 长地万方</span></span>
							</div>
							</div>
						</div>
					</div>
					<div id="soso_map" class="map" style="position: relative; background-color: rgb(229, 227, 223); overflow: hidden; transform: translateZ(0px);">
						<div id="static_map_background"></div>
						<div id="static_map"><div style="width: 100%; height: 100%; position: relative; background-color: rgb(229, 227, 223); overflow: hidden; transform: translateZ(0px);"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div n="targetElement" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div n="moveElement" style="position: absolute; left: 0px; top: 0px; z-index: 1; cursor: url(&quot;https://mapapi.qq.com/jsapi_v2/2/4/135/theme/grab.cur&quot;) 10 10, default; transform-origin: 0px 0px; transform: translate3d(0px, 0px, 0px) scale(1);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 200;"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101;"></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 201;"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 102;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 103;"></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 202;"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 104;"></div><div draggable="false" style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 105; background-color: transparent; background-image: url(&quot;data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAQAIBRAA7&quot;); margin: 0px; padding: 0px; user-select: none;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 106; cursor: default;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 107; cursor: default;"></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 99;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -87px; top: -147px;"><img src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/transparent.gif" draggable="false" style="width: 256px; height: 256px; user-select: none; padding: 0px; margin: 0px; border: 0px; position: absolute; transform: translateZ(0px);"><div draggable="false" style="position: absolute; width: 256px; height: 256px; line-height: 256px; font-family: Roboto, Arial, sans-serif; font-size: x-small; text-align: center; user-select: none;"></div></div></div></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="position: absolute; left: -87px; top: -147px; transition: opacity 200ms ease-out 0s;"><canvas width="256" height="256" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; user-select: none; transform: translateZ(0px); padding: 0px; margin: 0px; border: 0px;"></canvas></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="transform: translateZ(0px); position: absolute; left: -87px; top: -147px; transition: opacity 200ms ease-out 0s;"><canvas width="256" height="256" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; background: rgb(247, 245, 245); user-select: none; transform: translateZ(0px); padding: 0px; margin: 0px; border: 0px;"></canvas></div></div></div></div></div><div style="position: absolute; z-index: 1000000; margin: 2px 5px 0px 2px; left: 0px; bottom: 0px;" onpositionupdate="return;"><a title="到腾讯地图查看此区域" target="_blank" href="https://map.qq.com/?center=104.461761%2C34.519469&amp;l=15" style="position: static; overflow: visible; float: none; display: inline;"><div style="cursor: pointer; position: relative; overflow: hidden; width: 100px; height: 26px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: 0px; left: 0px; user-select: none; width: 100px; height: 26px; min-width: 100px; max-width: 100px; min-height: 26px; max-height: 26px;" src="https://mapapi.qq.com/web/lbs/logo/v2/tencent_color_logo.png"></div></a></div><div draggable="false" onresize="return;" style="position: absolute; z-index: 1000000; user-select: none; left: 7px; bottom: 0px;"><div style="position: absolute; width: 100%; height: 100%; opacity: 0.7;"><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="font-family: Arial, sans-serif; white-space: nowrap; font-size: 10px; color: rgb(34, 34, 34); line-height: 16px; direction: ltr; text-align: right; font-weight: normal; font-style: normal; background-color: transparent; position: relative; padding: 0px 5px;"><span style="font-family: Arial, sans-serif; white-space: nowrap; font-size: 10px; color: rgb(34, 34, 34); line-height: 16px; direction: ltr; text-align: right; font-weight: normal; font-style: normal; background-color: transparent;">©2020 Tencent - GS(2020)1720号 - Data© NavInfo</span><a style="font-family: Arial, sans-serif; white-space: nowrap; font-size: 10px; color: rgb(34, 34, 34); line-height: 16px; direction: ltr; text-align: right; font-weight: normal; font-style: normal; background-color: transparent; display: none; text-decoration: underline; cursor: pointer;">地图数据</a></div></div><div draggable="false" class="smnoprint" controlwidth="0" controlheight="0" onpositionupdate="return;" style="user-select: none; position: absolute; left: 0px; top: 0px; display: none;"><div style="position: absolute; left: 0px; top: 0px;"><div><div title="放大" style="position: relative; margin: 0px 19px; cursor: pointer; overflow: hidden; width: 26px; height: 22px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -60px; left: -88px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div><div style="position: relative; cursor: pointer; margin: 0px 19px; width: 0px; height: 101px; display: none;"><div title="单击缩放" style="position: absolute; margin: 0px; cursor: pointer;"><div style="width: 34px; height: 6px; position: relative; overflow: hidden;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -70px; left: -188px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div><div style="width: 26px; height: 90px; position: relative; overflow: hidden;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: 0px; left: -302px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div><div style="width: 34px; height: 6px; position: relative; overflow: hidden;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -82px; left: -188px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div></div><div style="display: none;"><div style="position: absolute; overflow: hidden; padding-left: 9px; width: 25px; height: 15px; left: 25px; bottom: 3px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -41px; left: -258px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"><span style="font-family: Arial, sans-serif; white-space: nowrap; font-size: 10px; color: rgb(255, 255, 255); line-height: 16px; direction: ltr; text-align: right; font-weight: normal; font-style: normal; background-color: transparent; position: absolute;">国</span></div><div style="position: absolute; overflow: hidden; padding-left: 9px; width: 25px; height: 15px; left: 25px; bottom: 27px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -41px; left: -258px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"><span style="font-family: Arial, sans-serif; white-space: nowrap; font-size: 10px; color: rgb(255, 255, 255); line-height: 16px; direction: ltr; text-align: right; font-weight: normal; font-style: normal; background-color: transparent; position: absolute;">省</span></div><div style="position: absolute; overflow: hidden; padding-left: 9px; width: 25px; height: 15px; left: 25px; bottom: 45px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -41px; left: -258px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"><span style="font-family: Arial, sans-serif; white-space: nowrap; font-size: 10px; color: rgb(255, 255, 255); line-height: 16px; direction: ltr; text-align: right; font-weight: normal; font-style: normal; background-color: transparent; position: absolute;">市</span></div><div style="position: absolute; overflow: hidden; padding-left: 9px; width: 25px; height: 15px; left: 25px; bottom: 81px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -41px; left: -258px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"><span style="font-family: Arial, sans-serif; white-space: nowrap; font-size: 10px; color: rgb(255, 255, 255); line-height: 16px; direction: ltr; text-align: right; font-weight: normal; font-style: normal; background-color: transparent; position: absolute;">街</span></div></div><div title="单击缩放" style="position: absolute; margin: 0px; cursor: pointer; height: 102px;"><div style="width: 34px; height: 75.2px; position: absolute; overflow: hidden; top: 20.8px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: 0px; left: -338px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div><div style="width: 34px; height: 6px; position: absolute; overflow: hidden; top: 95px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -100px; left: -188px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div></div><div title="拖动缩放" style="position: absolute; margin: 0px; z-index: 2; width: 26px; height: 26px; overflow: hidden; left: 3px; top: 14px; cursor: url(&quot;https://mapapi.qq.com/jsapi_v2/2/4/135/theme/grab.cur&quot;) 10 10, default;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -122px; left: -4px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div></div><div title="缩小" style="position: relative; margin: 0px 19px; cursor: pointer; overflow: hidden; width: 26px; height: 22px;"><img draggable="false" class="csssprite" dn="2" style="position: absolute; border: 0px; padding: 0px; margin: 0px; top: -87px; left: -88px; user-select: none; width: 360px; height: 255px; min-width: 360px; max-width: 360px; min-height: 255px; max-height: 255px;" src="https://mapapi.qq.com/jsapi_v2/2/4/135/theme/default/imgs/ctrls.png"></div></div></div></div><div class="smnoprint" onpositionupdate="return;" style="margin: 5px; cursor: pointer; z-index: 0; position: absolute; right: 0px; top: 0px;"><div style="float: left;"><div draggable="false" title="显示街道地图" style="color: rgb(255, 255, 255); font-family: Arial, sans-serif; font-size: 13px; background-color: rgb(38, 154, 234); user-select: none; padding: 1px 6px; direction: ltr; overflow: hidden; text-align: center; line-height: 20px; border: 1px solid rgb(113, 123, 135); box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px; font-weight: bold;">地图</div></div><div style="float: left;"><div draggable="false" title="显示卫星地图" style="color: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255); user-select: none; padding: 1px 6px; direction: ltr; overflow: hidden; text-align: center; line-height: 20px; border-width: 1px 1px 1px 0px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: initial; border-top-color: rgb(113, 123, 135); border-right-color: rgb(113, 123, 135); border-bottom-color: rgb(113, 123, 135); border-left-color: initial; border-image: initial; box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px; font-weight: normal;">卫星</div><div style="background-color: rgb(255, 255, 255); z-index: -1; padding-top: 2px; border-width: 0px 1px 1px; border-top-style: initial; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: initial; border-right-color: rgb(113, 123, 135); border-bottom-color: rgb(113, 123, 135); border-left-color: rgb(113, 123, 135); border-image: initial; text-align: left; position: absolute; right: 0px; top: 0px; display: none;"><div draggable="false" title="显示带有街道名称的卫星地图" style="color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 11px; background-color: rgb(255, 255, 255); user-select: none; padding: 1px 5px 3px; direction: ltr; text-align: left; white-space: nowrap; cursor: pointer;"><input type="checkbox" style="vertical-align: middle; margin: 0px 3px 0px 0px; cursor: pointer;"><label style="vertical-align: middle; cursor: pointer;">地名</label></div></div></div></div></div></div></div>
						<div id="map_drag"></div>
						<div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 1;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="width: 100%; height: 100%;"><div style="position: relative;width: 300px;background-color:#FFEFB6;border: 1px solid #FFC337;margin: 65px auto;padding: 10px;"><p>使用腾讯街景，需要将您的Adobe Flash Player 播放器升级到10或更新版本</p><div><a href="https://get.adobe.com/cn/flashplayer/" target="_blank;">下载最新版本</a></div></div></div><div style="width: 100%; height: 100%;"><div style="position: relative;width: 300px;background-color:#FFEFB6;border: 1px solid #FFC337;margin: 65px auto;padding: 10px;"><p>使用腾讯街景，需要将您的Adobe Flash Player 播放器升级到10或更新版本</p><div><a href="https://get.adobe.com/cn/flashplayer/" target="_blank;">下载最新版本</a></div></div></div></div></div></div>
					<div class="view-more-detailmap view-more">
						<a id="mapDetail" href="https://api.map.baidu.com/marker?location=30.499661,114.343603&amp;title=大华南湖公园世家东区&amp;content=珞狮南路517号&amp;output=html&amp;src=58.com" target="_blank" >地图详情
							<i class="icon"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!--右侧推荐及广告-->
		<div class="side-right-info fr">
			<div id="agent-other-house" class="agent-other-house">

				<p class="agent-house-nav f18 c_333">猜你喜欢房源推荐</p>
				<ul class="agent-otherhouse-list">
					<li>
						<a href="">
							<div class="pic fl">
								<img lazy_src="https://pic6.58cdn.com.cn/anjuke_58/614f2d45563b8f326420a236cb7ce8bb?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" src="https://pic6.58cdn.com.cn/anjuke_58/614f2d45563b8f326420a236cb7ce8bb?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" data-loaded="true">
							</div>
							<div class="side-right fl">
								<p class="info-title c_555 f18">理工大 杨园 万利广场 钢都中学 可月付 无中介 拎包入住</p>
								<p class="info-area-toward c_888 f12">3室1厅1卫&nbsp;/&nbsp;98平<br>合租&nbsp;/&nbsp;精装修</p>
								<p class="info-price c_ff552e f12"><b class="f18">2200</b>&nbsp;元/月</p>
							</div>
						</a>
					</li><li>
					<a href="" >
						<div class="pic fl">
							<img lazy_src="https://pic3.58cdn.com.cn/anjuke_58/b730649e78730198df589908c8d359ee?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" src="https://pic3.58cdn.com.cn/anjuke_58/b730649e78730198df589908c8d359ee?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" data-loaded="true">
						</div>
						<div class="side-right fl">
							<p class="info-title c_555 f18">理工大 徐东站 可月付 可短租  无中介 拎包入住</p>
							<p class="info-area-toward c_888 f12">3室1厅1卫&nbsp;/&nbsp;20平<br>合租&nbsp;</p>
							<p class="info-price c_ff552e f12"><b class="f18">900</b>&nbsp;元/月</p>
						</div>
					</a>
				</li><li>
					<a href="" target="_blank" >
						<div class="pic fl">
							<img lazy_src="https://pic5.58cdn.com.cn/anjuke_58/a1bbffd57e16b3bc734b6fba9073f2b0?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" src="https://pic5.58cdn.com.cn/anjuke_58/a1bbffd57e16b3bc734b6fba9073f2b0?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" data-loaded="true">
						</div>
						<div class="side-right fl">
							<p class="info-title c_555 f18">沃尔玛  维佳佰港城 武汉理工大学  南湖花园 丁字桥南路</p>
							<p class="info-area-toward c_888 f12">4室1厅1卫&nbsp;/&nbsp;23平<br>合租&nbsp;</p>
							<p class="info-price c_ff552e f12"><b class="f18">1200</b>&nbsp;元/月</p>
						</div>
					</a>
				</li><li>
					<a href="" target="_blank" >
						<div class="pic fl">
							<img lazy_src="https://pic5.58cdn.com.cn/anjuke_58/3287e64d0bd02e3d85cd4ec4e791a14e?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" src="https://pic5.58cdn.com.cn/anjuke_58/3287e64d0bd02e3d85cd4ec4e791a14e?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" data-loaded="true">
						</div>
						<div class="side-right fl">
							<p class="info-title c_555 f18">理工大 钢都中学 武钢 可月付 无中介 拎包入住</p>
							<p class="info-area-toward c_888 f12">3室1厅1卫&nbsp;/&nbsp;15平<br>合租&nbsp;</p>
							<p class="info-price c_ff552e f12"><b class="f18">700</b>&nbsp;元/月</p>
						</div>
					</a>
				</li><li>
					<a href="" target="_blank">
						<div class="pic fl">
							<img lazy_src="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" src="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9?w=336&amp;h=240&amp;crop=1?w=336&amp;h=240&amp;crop=1" data-loaded="true">
						</div>
						<div class="side-right fl">
							<p class="info-title c_555 f18">维佳 佰港城  首义学院  建安地铁工业大学   理工大</p>
							<p class="info-area-toward c_888 f12">4室1厅1卫&nbsp;/&nbsp;20平<br>合租&nbsp;</p>
							<p class="info-price c_ff552e f12"><b class="f18">1000</b>&nbsp;元/月</p>
						</div>
					</a>
				</li>
				</ul>
			</div>

		</div>
	</div>

</div>

<%-- 4、底部--%>
<div id="commonFooter" style="margin-bottom: 40px" class="commonFooter">
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

<!-- 模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 100px">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<form id="modal_loginFrom" class="form-horizontal">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" name="username" class="form-control" id="inputEmail3" placeholder="username">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label>
									<input type="checkbox"> Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" onclick="login()" class="btn btn-default">登录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	// 异步获取当前房源用户的收藏状态
	let favoriteStus=null;
	$.get("${pageContext.request.contextPath}/front/room/ifFavorite?roomId="+${room.id},function (resp) {
		if(resp=="1"){
			// 表示已收藏
			$("#su_kfdnew").addClass("on");
			$("#su_kfdnew span").html("取消收藏");
		}
		favoriteStus=resp;
	},"json");


	// 处理收藏与取消
	function dealFavorite() {
		let favoriteValue=$("#su_kfdnew span").html();
		if(favoriteValue =="取消收藏"){
			$.get("${pageContext.request.contextPath}/front/room/cancleFavorite?roomId=${room.id}",function (resp) {
				if(resp=="0"){
					// 表示取消收藏成功
					$("#su_kfdnew").removeClass("on");
					$("#su_kfdnew span").html("添加收藏");
				}else {
					alert("取消收藏失败，请重新操作！")
				}
			},"json");
		}else{
			// 需要判断用户是否登录
			if(favoriteStus=="0"){
				// 表示登录未收藏
				$.get("${pageContext.request.contextPath}/front/room/addFavorite?roomId=${room.id}",function (resp) {
					if(resp=="0"){
						// 表示添加收藏成功
						$("#su_kfdnew").addClass("on");
						$("#su_kfdnew span").html("取消收藏");
					}else {
						alert("添加收藏失败，请重新操作！")
					}
				},"json");
			}else{
				// 表示未登录，需要先去登录
				// 打开登录模态框
				$('#myModal').modal('show');
			}
		}
	}

	// 收藏异步登录处理
	// 用户异步登录操作
	function login() {
		// 获取登录表单数据
		let data = $("#modal_loginFrom").serialize();
		$.post("${pageContext.request.contextPath}/user/asyncLogin",data,function (resp) {
			if(resp=="-1"){
				alert("用户登录失败，请重新登录！");
			}else {
				// 表示登录成功
				// 关闭模态框
				$('#myModal').modal('hide');
				// 1、改变用户登录状态
				let str='                <div id="commonTopbar_login">\n' +
						'                    <a href="javascript:void(0)" target="_self" tongji_tag="pc_topbar_log_login">'+resp+'</a><span class="gap">|</span>\n' +
						'                    <a href="${pageContext.request.contextPath}/user/logout" >退出</a>\n' +
						'                </div>';
				$("#login-info").html(str);

				// 2、触发添加收藏事件
				favoriteStus="0";  // 修改登录状态
				dealFavorite();
			}
		});
	}
</script>


<script type="text/javascript">
	// 百度地图API功能
	var map = new BMapGL.Map("map");//创建地图实例
	var point = new BMapGL.Point(116.331398, 39.897445);// 创建点坐标 武汉市坐标116.331398, 39.897445
	map.centerAndZoom(point, 12);// 初始化地图，设置中心点坐标和地图缩放级别
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放、
	// 创建地址解析器实例
	var myGeo = new BMapGL.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	myGeo.getPoint("${room.address}", function(point) {
		if(point) {
			console.log(point.lng);
			console.log(point.lat);
			// 填充地图详情按钮的连接
			$("#mapDetail").attr("href","https://api.map.baidu.com/marker?location="+point.lat+","+point.lng+"&title=${room.address}&content=${room.detailAddress}&output=html");

			map.centerAndZoom(point, 18);
			//var myIcon = new BMap.Icon("http://developer.baidu.com/map/jsdemo/img/fox.gif", new BMap.Size(300,157));
			//var marker = new BMap.Marker(point,{icon:myIcon}); // 创建标注
			var marker = new BMapGL.Marker(point); // 创建标注
			map.addOverlay(marker);
			marker.enableDragging(); //开启拖拽
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			var label = new BMapGL.Label("${room.address}",{
				offset: new BMapGL.Size(30, 0)
			});
			marker.setLabel(label);

		} else {
			alert("您选择地址没有解析到结果!");
		}
	}, "武汉市");
</script>
</body>

</html>
