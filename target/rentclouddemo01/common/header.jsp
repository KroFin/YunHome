<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>

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
                                                           href="${pageContext.request.contextPath}/front/room/list"
                                                           target="_blank"
                                                           tongji_tag="pc_topbar_log_home">厚溥云租房首页</a></strong>
            </div>
        </div>
        <div class="bar_right">
            <span id="login-info">
                <c:if test="${empty loginUser}">
                <div id="commonTopbar_login">
                    <a href="${pageContext.request.contextPath}/user/toLoginPage" target="_self" tongji_tag="pc_topbar_log_login">登录</a><span class="gap">|</span>
                    <a href="${pageContext.request.contextPath}/user/toRegisterPage" >注册</a>
                </div>
                </c:if>
                <c:if test="${not empty loginUser}">
                <div id="commonTopbar_login">
                    <a href="javascript:void(0)" target="_self" tongji_tag="pc_topbar_log_login">${loginUser.username}</a><span class="gap">|</span>
                    <a href="${pageContext.request.contextPath}/user/logout" >退出</a>
                </div>
                </c:if>
            </span>

            <div id="commonTopbar_mymenu" class="haschild">
                <a id="commonTopbar_tomy" target="_blank" href="javascript:void(0)" tongji_tag="pc_topbar_log_my">个人中心</a>
                <span class="arrow"></span><span class="mark"></span>
                <div class="hc" id="commonTopbar_loginbox">
                    <a id="dd" href="javascript:void(0)" target="_blank" tongji_tag="pc_topbar_log_my_account">我的账户</a>
                    <a id="" href="${pageContext.request.contextPath}/front/favority/list" target="_blank" tongji_tag="pc_topbar_log_my_account">我的收藏</a>
                    <a id="commonTopbar_tohelp" href="javascript:void(0)" target="_blank" tongji_tag="">举报中心</a>
                    <a id="commonTopbar_toHistory" href="${pageContext.request.contextPath}/front/room/historyList" target="_blank" tongji_tag="">浏览记录</a>
                </div>
            </div>
            <div id="commonTopbar_vip" class="haschild">
                <a class="mytxt" href="${pageContext.request.contextPath}/admin/toIndexPage" target="_blank">商家中心</a><span class="arrow"></span>
                <span class="mark"></span>
                <div class="hc">
                    <a id="commonTopbar_tomypost" href="${pageContext.request.contextPath}/admin/" target="_blank" tongji_tag="pc_topbar_log_my_post">我的发布</a><a
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

<script>
    $("#commonTopbar_mymenu").mouseover(function(){
        $("#commonTopbar_mymenu").addClass("hover");
        $("#commonTopbar_loginbox").css("display","block");
    });
    $("#commonTopbar_mymenu").mouseout(function(){
        $("#commonTopbar_loginbox").css("display","none");
    });
</script>
</body>
</html>
