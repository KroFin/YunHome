<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>云+-房屋页-我的收藏</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/lib/amazeui/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/hp.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/room.css"/>

    <script src="${pageContext.request.contextPath}/index/lib/amazeui/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/index/lib/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/index/lib/amazeui/assets/js/amazeui.js"></script>
    <script src="${pageContext.request.contextPath}/index/lib/amazeui/pagination/amazeui-pagination.js"></script>
</head>
<body>
<div class="hp-containers">
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
                        href=""
                        target="_self" tongji_tag="pc_topbar_log_login">登录</a><span class="gap">|</span><a
                        href=""
                        target="_self" tongji_tag="pc_topbar_log_reg">注册</a></div>
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
                    <div class="hc"><a id="commonTopbar_tomypost" href=""
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
    <%-- 2、关键字搜索 --%>
    <div id="header-wrap" class="header-wrap">
        <div class="content clearfix">
            <a class="logo fl" href="" target="_blank"
               onclick=""></a>
            <a class="top-publish-news fr" href="" target="_blank"
               onclick="clickLog('from=fcpc_list_bj_fabu')">免费发布</a>
            <div class="search-section">
                <input class="search-input" type="text" value="" fdv="" id="keyword" name="b_q" para="key"
                       autocomplete="off" placeholder="请输入房源相关信息" style="color: rgb(204, 204, 204);">
                <i class="icon"></i>
                <a class="search-btn" href="javascript:;" onclick="clickLog('from=fcpc_list_wh_sousuo')">
                    <input type="button" value="搜房源">
                </a>
                <ul class="search-infolist" id="searchList" style="display: none;"></ul>
                <ul class="hotKey">
                    <li>
                        <a target="_blank" tongji_tag="from=fcpc_list_zz_reci_no1" href="javascript:void(0)">品牌公寓</a>
                    </li>
                    <li>
                        <a tongji_tag="from=fcpc_list_zz_reci_no2" href="javascript:void(0)">热租房源</a>
                    </li>
                    <li>
                        <a tongji_tag="from=fcpc_list_zz_reci_no" href="javascript:void(0)">个人房源</a>
                    </li>
                    <li>
                        <a tongji_tag="from=fcpc_list_zz_reci_no5" href="javascript:void(0)">阳光主卧</a>
                    </li>
                    <li>
                        <a tongji_tag="from=fcpc_list_zz_reci_no6" href="javascript:void(0)">独立卫生间</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <%-- 4、搜索结果--%>
    <div class="list-wrap">
        <div class="list-title">
            <a href="javascript:void(0)">
                <span id="tab-default" class="select">我的收藏</span></a>
        </div>
        <div class="list-box">
            <ul class="house-list" style="width: 100%;">
                <li class="house-cell">
                    <div class="img-list">
                        <a href="">
                            <img src="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9">
                        </a>
                    </div>
                    <div class="des">
                        <h2>
                            <a href="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9"
                               class="strongbox"
                               style="color: #333"
                               tongji_label="listclick"
                               onclick="clickLog('from= fcpc_zflist_gzcount ');"
                               target="_blank" rel="nofollow">
                                单间 | 免租1个月 可短租 加州香山美树 软件园 武大科 </a>
                        </h2>
                        <p class="room">主卧(室) &nbsp;&nbsp;&nbsp;&nbsp;1.96㎡
                        </p>
                        <p class="infor">
                            <a href=""
                               onClick="clickLog('from=fcpc_list_wh_biaoti_shangquan')">光谷软件园</a>
                            &nbsp;&nbsp;
                            <a href=""
                               target="_blank"
                               onClick="clickLog('from=fcpc_list_wh_biaoti_xiaoqu')">加州香山美树</a>
                        </p>
                        <div class="jjr">
                            来自经纪人: <span class=" jjr_par">
                                                    <span class="jjr_par_dp" title="蛋壳（武汉）公寓管理有限公司">
                                武汉蛋壳公寓                            </span>
                                                    <span class="listjjr">
                                                                彭章豹                                                                </span>
                            <!-- 新增结构 -->
                            <!-- 新增结构end -->
                        </span>
                        </div>
                    </div>
                    <div class="list-li-right">
                        <div class="send-time">
                            2020-09-27 10:49
                        </div>
                        <div class="money">
                            <b class="strongbox">960</b>元/月
                        </div>
                    </div>
                </li>
                <li class="house-cell">
                    <div class="img-list">
                        <a href="">
                            <img src="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9">
                        </a>
                    </div>
                    <div class="des">
                        <h2>
                            <a href="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9"
                               class="strongbox"
                               style="color: #333"
                               tongji_label="listclick"
                               onclick="clickLog('from= fcpc_zflist_gzcount ');"
                               target="_blank" rel="nofollow">
                                单间 | 免租1个月 可短租 加州香山美树 软件园 武大科 </a>
                        </h2>
                        <p class="room">主卧(室) &nbsp;&nbsp;&nbsp;&nbsp;1.96㎡
                        </p>
                        <p class="infor">
                            <a href=""
                               onClick="clickLog('from=fcpc_list_wh_biaoti_shangquan')">光谷软件园</a>
                            &nbsp;&nbsp;
                            <a href=""
                               target="_blank"
                               onClick="clickLog('from=fcpc_list_wh_biaoti_xiaoqu')">加州香山美树</a>
                        </p>
                        <div class="jjr">
                            来自经纪人: <span class=" jjr_par">
                                                    <span class="jjr_par_dp" title="蛋壳（武汉）公寓管理有限公司">
                                武汉蛋壳公寓                            </span>
                                                    <span class="listjjr">
                                                                彭章豹                                                                </span>
                            <!-- 新增结构 -->
                            <!-- 新增结构end -->
                        </span>
                        </div>
                    </div>
                    <div class="list-li-right">
                        <div class="send-time">
                            2020-09-27 10:49
                        </div>
                        <div class="money">
                            <b class="strongbox">960</b>元/月
                        </div>
                    </div>
                </li>
                <li class="house-cell">
                    <div class="img-list">
                        <a href="">
                            <img src="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9">
                        </a>
                    </div>
                    <div class="des">
                        <h2>
                            <a href="https://pic2.58cdn.com.cn/anjuke_58/68c1bb9b26a38ef833fb728c370478c9"
                               class="strongbox"
                               style="color: #333"
                               tongji_label="listclick"
                               onclick="clickLog('from= fcpc_zflist_gzcount ');"
                               target="_blank" rel="nofollow">
                                单间 | 免租1个月 可短租 加州香山美树 软件园 武大科 </a>
                        </h2>
                        <p class="room">主卧(室) &nbsp;&nbsp;&nbsp;&nbsp;1.96㎡
                        </p>
                        <p class="infor">
                            <a href=""
                               onClick="clickLog('from=fcpc_list_wh_biaoti_shangquan')">光谷软件园</a>
                            &nbsp;&nbsp;
                            <a href=""
                               target="_blank"
                               onClick="clickLog('from=fcpc_list_wh_biaoti_xiaoqu')">加州香山美树</a>
                        </p>
                        <div class="jjr">
                            来自经纪人: <span class=" jjr_par">
                                                    <span class="jjr_par_dp" title="蛋壳（武汉）公寓管理有限公司">
                                武汉蛋壳公寓                            </span>
                                                    <span class="listjjr">
                                                                彭章豹                                                                </span>
                            <!-- 新增结构 -->
                            <!-- 新增结构end -->
                        </span>
                        </div>
                    </div>
                    <div class="list-li-right">
                        <div class="send-time">
                            2020-09-27 10:49
                        </div>
                        <div class="money">
                            <b class="strongbox">960</b>元/月
                        </div>
                    </div>
                </li>
                <%--  分页--%>
                <li id="pager_wrap">
                    <div class="pager">
                        <strong><span>1</span></strong><a
                            href=""><span>2</span></a><a
                            href=""><span></span></a>
                        . . . <a
                            href=""><span>70</span></a><a
                            class="next"
                            href=""><span>下一页</span></a>
                    </div>
                </li>
            </ul>

    </div>
    <%-- 5、底部--%>
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
</div>
<script src="${pageContext.request.contextPath}/home/js/home_list.js"></script>
<script>
    $(function () {
        init()
    })
</script>
</body>
</html>
