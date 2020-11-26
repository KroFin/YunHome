<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>云+-房屋页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/lib/amazeui/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/hp.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/room.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css"/>

    <script src="${pageContext.request.contextPath}/index/lib/amazeui/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/index/lib/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/index/lib/amazeui/assets/js/amazeui.js"></script>
    <script src="${pageContext.request.contextPath}/index/lib/amazeui/pagination/amazeui-pagination.js"></script>

    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
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
                                                               href="${pageContext.request.contextPath}/index.jsp"
                                                               target="_blank"
                                                               tongji_tag="pc_topbar_log_home">厚溥云租房首页</a></strong>
                </div>
            </div>
            <div class="bar_right">
                <div id="commonTopbar_login"><a
                        href="${pageContext.request.contextPath}/user/toLoginPage"
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
    <%-- 、筛选条件 --%>
    <div class="main-wrap">
        <!-- 面包屑导航 -->
        <div class="nav-top-bar">
            <a href="https://wh.58.com/">厚溥云租房</a> &gt;
            <a href="https://wh.58.com/house.shtml">武汉房产信息</a> &gt;
            <a href="https://wh.58.com/chuzu/">武汉出租</a>
        </div>

        <!-- 区域、地铁线路、北京小区 -->
        <div class="filter-wrap">
            <!--筛选信息-->
            <div class="search_bd">
                <!--区域展示start-->
                <dl class="secitem secitem_fist">
                    <dd style="margin-left: 0px">
                        <a href="javascript:void(0)"
                           class="select" onclick="checkRegion(0,'')">不限</a>
                        <c:forEach items="${regisons}" var="region">
                            <a href="javascript:void(0)" onclick="checkRegion(${region.id},'${region.regionName}')">${region.regionName}</a>
                        </c:forEach>
                    </dd>
                </dl>
                <!--区域展示end-->
                <!-- 筛选条件 -->
                <!-- 租金 -->
                <dl id="secitem-rent" class="secitem">
                    <dt class="fl">租金：</dt>
                    <dd>
                        <a href="javascript:void(0)"
                           class="select" onclick="checkRent('0_999999')">不限</a>
                        <a href="javascript:void(0)"
                           name="b_link" para="paras" ck="b1"
                           onclick="checkRent('0_500')">500元以下</a>
                        <a href="javascript:void(0)"
                           name="b_link" para="paras" ck="b2" onclick="checkRent('500_1000')">500-1000元</a>
                        <a href="javascript:void(0)"
                           name="b_link" para="paras" ck="b" onclick="checkRent('1000_2000')">1000-2000元</a>
                        <a href="javascript:void(0)"
                           name="b_link" para="paras" ck="b4" onclick="checkRent('2000_3000')">2000-3000元</a>
                        <a href="javascript:void(0)"
                           name="b_link" para="paras" ck="b6" onclick="checkRent('3000_4500')">3000-4500元</a>
                        <a href="javascript:void(0)"
                           name="b_link" para="paras" ck="b7"
                           onclick="checkRent('4500_999999')">4500元以上</a>
                        <span class="prifilter">
                <span class="text">
                    <input onfocus="openRentBtn()" onblur="closeRentBtn()" type="text" para="minprice" muti="1" min="0" max="999999" name="b_q" autocomplete="off">
                </span>
                <span class="dev"> - </span>
                <span class="text">
                    <input onfocus="openRentBtn()" onblur="closeRentBtn()" type="text" para="minprice" muti="1" min="0" max="999999" name="b_q" autocomplete="off">
                </span>
                <span class="dev">元</span>
                <span class="shaixuanbtn none">
                    <a rel="nofollow" href="javascript:void(0);"
                       onclick="clickLog('from=fcpc_list_wh_Zujin_shaixuan')">价格筛选</a>
                </span>
            </span>
                    </dd>
                </dl>

                <!-- 厅室 -->
                <dl class="secitem">
                    <dt>厅室：</dt>
                    <dd id="secitem-room">
                        <a rel="nofollow"
                           href=""
                           class="select" onclick="clickLog('from=fcpc_list_wh_Tingshi_')">不限</a>
                        <a rel="nofollow"
                           href=""
                           onclick="clickLog('from=fcpc_list_wh_Tingshi_j1')">一室</a>
                        <a rel="nofollow"
                           href=""
                           onclick="clickLog('from=fcpc_list_wh_Tingshi_j2')">两室</a>
                        <a rel="nofollow"
                           href=""
                           onclick="clickLog('from=fcpc_list_wh_Tingshi_j')">三室</a>
                        <a rel="nofollow"
                           href=""
                           onclick="clickLog('from=fcpc_list_wh_Tingshi_j4')">四室</a>
                        <a rel="nofollow"
                           href=""
                           onclick="clickLog('from=fcpc_list_wh_Tingshi_j5')">四室以上</a>
                    </dd>
                </dl>

                <!-- 方式 -->
                <dl class="secitem">
                    <dt>方式：</dt>
                    <dd id="secitem-type">
                        <a rel="nofollow"
                           href=""
                           class="select" onclick="clickLog('from=fcpc_list_wh_Fangshi_')">不限</a>
                        <a rel="nofollow"
                           href=""
                           onclick="clickLog('from=fcpc_list_wh_Fangshi_zhengzu')">整租</a>
                        <a rel="nofollow"
                           href=""
                           onclick="clickLog('from=fcpc_list_wh_Fangshi_danjian')">合租</a>
                    </dd>
                </dl>

                <!-- 其他 -->
                <dl class="secitem">
                    <dt>其他：</dt>
                    <dd id="secitem-other">
                        <div class="moniselectcon">
                            <div class="moniselect"><i></i> 朝向不限</div>
                            <div id="secitem-direction" class="moniselectList selectlist01" style="display: none;">
                                <a href="javascript:void(0)"
                                   class="select">朝向不限 </a>
                                <a href="javascript:void(0)"
                                   name="b_link2" para="paras" ck="d1"
                                   onclick="clickLog('from=fcpc_list_wh_Qita_toward_d1')">东 </a>
                                <a href="javascript:void(0)"
                                   name="b_link2" para="paras" ck="d2"
                                   onclick="clickLog('from=fcpc_list_wh_Qita_toward_d2')">南 </a>
                                <a href="javascript:void(0)"
                                   name="b_link2" para="paras" ck="d"
                                   onclick="clickLog('from=fcpc_list_wh_Qita_toward_d')">西 </a>
                                <a href="javascript:void(0)"
                                   name="b_link2" para="paras" ck="d4"
                                   onclick="clickLog('from=fcpc_list_wh_Qita_toward_d4')">北 </a>
                                <a href="javascript:void(0)"
                                   name="b_link2" para="paras" ck="d5"
                                   onclick="clickLog('from=fcpc_list_wh_Qita_toward_d5')">南北 </a>
                                <a href="javascript:void(0)"
                                   name="b_link2" para="paras" ck="d6"
                                   onclick="clickLog('from=fcpc_list_wh_Qita_toward_d6')">东西 </a>
                                <a href="javascript:void(0)"
                                   name="b_link2" para="paras" ck="d7"
                                   onclick="clickLog('from=fcpc_list_wh_Qita_toward_d7')">东南 </a>
                            </div>
                        </div><!-- moniselectcon -->

                        <span id="secitem-has-pic" class="picCheckbox">
                <a class="unchecked" href="javascript:;" name="map" value="" id="ispic">
                    <label for="ispic">只看有图</label>
                </a>
            </span>
                    </dd>
                </dl>
            </div>
        </div>

        <!-- 已选的筛选条件(朝向、装修) --><!-- 需要修改:挂载点-->
        <div id="selected" style="display: block;">
            <div class="barct" style="display: none">
                <dt>条件：</dt>
                <a title="取消" style="display: none" class="par" href=""><em class="regin">${regionName}</em><i>×</i></a>
                <a title="取消" style="display: none" class="par" href=""><em class="rent">${rent}</em><i>×</i></a>
            </div>
        </div>

    </div>
    <%-- 4、搜索结果--%>
    <div class="list-wrap">
        <div class="list-title">
            <a class="tuiguang" href="" target="_blank"
               onclick="clickLog('from=fcpc_list_wh_bbkf')">联系客服</a>
            <a href="" onclick="clickLog('from=fcpc_list_wh_defaulttab')">
                <span id="tab-default" class="select">武汉出租</span></a>
            <a href="" onclick="clickLog('from=fcpc_list_wh_persontab')">
                <span id="tab-customer">个人房源</span></a>
            <a href="javascript:void(0)" onclick="clickLog('from=fcpc_list_wh_jingjirentab')">
                <span id="tab-middleman">经纪人</span></a>
            <a href="javascript:void(0)"
               onclick="clickLog('from=2000000001000100000010')">
                <span id="tab-ax">安选房源</span></a>
            <a href="javascript:void(0)"
               onclick="clickLog('from=fcpc_list_wh_tab_pinpaigy');" target="_blank">
                <span id="tab-ppgy">品牌公寓</span></a>
            <a href="javascript:void(0)"
               onclick="clickLog('from=20000000801000100000010')">
                <span id="tab-video">视频房源</span>
            </a>
            <a href="javascript:void(0)" onclick="clickLog('from=200000004056000100000010')"
               target="_blank">
                <span id="tab-msduanzu">民宿短租</span>
            </a>
            <a href="javascript:void(0)"
               onclick="clickLog('from=200000004149000100000010')" target="_blank">
                <span id="tab-vrhouse">VR看房</span>
            </a>
        </div>
        <div class="list-box">
            <ul class="house-list">
                <c:forEach items="${page.list}" var="room">
                    <li class="house-cell">
                        <div class="img-list">
                            <a href="${pageContext.request.contextPath}/front/room/toRoomDetails?id=${room.roomImgList[0].roomId}">
                                <img src="http://localhost/${room.roomImgList[0].img}">
                            </a>
                        </div>
                        <div class="des">
                            <h2>
                                <a href="${pageContext.request.contextPath}/front/room/toRoomDetails?id=${room.roomImgList[0].roomId}"
                                   class="strongbox"
                                   style="color: #333"
                                   tongji_label="listclick"
                                   onclick="clickLog('from= fcpc_zflist_gzcount ');"
                                   target="_blank" rel="nofollow">
                                        ${room.title} </a>
                            </h2>
                            <p class="room">主卧(室) &nbsp;&nbsp;&nbsp;&nbsp;${room.area}㎡
                            </p>
                            <p class="infor">
                                <a href=""
                                   onClick="clickLog('from=fcpc_list_wh_biaoti_shangquan')">${room.address}</a>
                                &nbsp;&nbsp;
                                <a href=""
                                   target="_blank"
                                   onClick="clickLog('from=fcpc_list_wh_biaoti_xiaoqu')">${room.detailAddress}</a>
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
                            </div>
                            <div class="money">
                                <b class="strongbox">${room.rent}</b>元/月
                            </div>
                        </div>
                    </li>
                </c:forEach>

                <%--  分页--%>
                <nav aria-label="...">
                    <ul class="pagination">
                        <c:if test="${page.pageNum ==1}">
                            <li class="disabled"><span><span aria-hidden="true">&laquo;</span></span></li>
                        </c:if>
                        <c:if test="${page.pageNum !=1}">
                            <li class=""><span><span aria-hidden="true">&laquo;</span></span></li>
                        </c:if>
                        <c:forEach items="${page.navigatepageNums}" var="currentPage">
                            <c:if test="${page.pageNum==currentPage}">
                                <li class="active"><a href="${pageContext.request.contextPath}/front/room/list?pageNum=${currentPage}&pageSize=${pageSize}&regionId=${regionId}&regionName=${regionName}&rent=${rent}">${currentPage}</a></li>
                            </c:if>
                            <c:if test="${page.pageNum!=currentPage}">
                                <li><a href="${pageContext.request.contextPath}/front/room/list?pageNum=${currentPage}&pageSize=${pageSize}&regionId=${regionId}&regionName=${regionName}&rent=${rent}">${currentPage}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${page.pageNum<page.total}">
                            <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                        </c:if>
                        <c:if test="${page.pageNum==page.total}">
                            <li class="disabled"><span aria-label="Next"><span aria-hidden="true">&raquo;</span></span></li>
                        </c:if>

                    </ul>
                </nav>
                <%--<li id="pager_wrap">--%>
                <%--<div class="pager">--%>
                <%--<strong><span>1</span></strong><a--%>
                <%--href=""><span>2</span></a><a--%>
                <%--href=""><span></span></a>--%>
                <%--. . . <a--%>
                <%--href=""><span>70</span></a><a--%>
                <%--class="next"--%>
                <%--href=""><span>下一页</span></a>--%>
                <%--</div>--%>
                <%--</li>--%>
            </ul>

            <%-- 右侧广告--%>
            <div class="list-right-ad">
                <div id="hot-house">
                    <h2 class="hot-title">热推房源<a href="javascript:void(0)" class="hot-icon">hot</a>

                    </h2>
                    <ul class="hot-house-wrap">

                        <li class="hot-house-li">
                            <a href="javascript:void(0)" onclick="clickLog('from=fc_pc_jg_zz_&amp;model=jglist-right&amp;id=43752739052930-39005394697235-1602509413001146722-1823148')">
                                <div class="pic-wrap">
                                    <img lazy_src="https://pic5.58cdn.com.cn/anjuke_58/aacae52fd51e15b4cb490bb1a87fcbba?w=320&amp;h=240&amp;crop=1" src="https://pic5.58cdn.com.cn/anjuke_58/aacae52fd51e15b4cb490bb1a87fcbba?w=320&amp;h=240&amp;crop=1" data-loaded="true">
                                </div>
                                <div class="detail-info">
                                    <h3>洪山&nbsp;/&nbsp;新南湖&nbsp;/&nbsp;保利公园</h3>
                                    <div class="house-type">1室&nbsp;&nbsp;&nbsp;&nbsp;40平</div>
                                    <div class="price">1330元/月</div>
                                </div>
                            </a>
                        </li>
                        <li class="hot-house-li">
                            <a href="javascript:void(0)" onclick="clickLog('from=fc_pc_jg_zz_&amp;model=jglist-right&amp;id=43718223815697-48039848002326-1602414407407171252-1821438')">
                                <div class="pic-wrap">
                                    <img lazy_src="https://pic3.58cdn.com.cn/anjuke_58/294c434d2d0bd256e79f5f80650b3a5f?w=320&amp;h=240&amp;crop=1" src="https://pic3.58cdn.com.cn/anjuke_58/294c434d2d0bd256e79f5f80650b3a5f?w=320&amp;h=240&amp;crop=1" data-loaded="true">
                                </div>
                                <div class="detail-info">
                                    <h3>汉阳&nbsp;/&nbsp;四新&nbsp;/&nbsp;碧桂园</h3>
                                    <div class="house-type">2室&nbsp;&nbsp;&nbsp;&nbsp;37.65平</div>
                                    <div class="price">1500元/月</div>
                                </div>
                            </a>
                        </li>
                        <li class="hot-house-li">
                            <a href="javascript:void(0)" onclick="clickLog('from=fc_pc_jg_zz_&amp;model=jglist-right&amp;id=43595191322268-68134144030724-1602293916275120213-1818260')">
                                <div class="pic-wrap">
                                    <img lazy_src="https://pic1.58cdn.com.cn/anjuke_58/e47f627e6690b35bc2bbb3328608fd9c?w=320&amp;h=240&amp;crop=1" src="https://pic1.58cdn.com.cn/anjuke_58/e47f627e6690b35bc2bbb3328608fd9c?w=320&amp;h=240&amp;crop=1" data-loaded="true">
                                </div>
                                <div class="detail-info">
                                    <h3>江夏&nbsp;/&nbsp;金融港&nbsp;/&nbsp;魅力之城</h3>
                                    <div class="house-type">3室&nbsp;&nbsp;&nbsp;&nbsp;118平</div>
                                    <div class="price">2600元/月</div>
                                </div>
                            </a>
                        </li>
                        <li class="hot-house-li">
                            <a href="javascript:void(0)" onclick="clickLog('from=fc_pc_jg_zz_&amp;model=jglist-right&amp;id=43803395796868-67451841305366-1602215696947861159-1816989')">
                                <div class="pic-wrap">
                                    <img lazy_src="https://pic2.58cdn.com.cn/anjuke_58/6b24719f2109912db85cbaa3a7daaeca?w=320&amp;h=240&amp;crop=1" src="https://pic2.58cdn.com.cn/anjuke_58/6b24719f2109912db85cbaa3a7daaeca?w=320&amp;h=240&amp;crop=1" data-loaded="true">
                                </div>
                                <div class="detail-info">
                                    <h3>洪山&nbsp;/&nbsp;珞瑜路&nbsp;/&nbsp;成园小区</h3>
                                    <div class="house-type">1室&nbsp;&nbsp;&nbsp;&nbsp;52平</div>
                                    <div class="price">1500元/月</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
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
        // 触发价格筛选按钮的显示与隐藏
        function openRentBtn() {
            $(".shaixuanbtn").css("display","inline-block");
            // alert("获取交单");
        }
        function closeRentBtn() {
            $(".shaixuanbtn").css("display","none");
        }
        // 房源区域选择
        function checkRegion(regionId,regionName) {
            console.log(regionId);
            // 进行搜索
            location.href="${pageContext.request.contextPath}/front/room/list?pageNum=${pageNum}&pageSize=${pageSize}&rent=${rent}&regionId="+regionId+"&regionName="+regionName;
        }
        // 房源组件选择
        function checkRent(rent) {
            console.log(rent);
            // 进行搜索
            location.href="${pageContext.request.contextPath}/front/room/list?pageNum=${pageNum}&pageSize=${pageSize}&regionId=${regionId}&regionName=${regionName}&rent="+rent;
        }

        $(function () {
            // 页面加载后，对搜索条件进行处理
            let reginName =$(".regin").html();
            let rent =$(".rent").html();
            if((reginName == '' || reginName ==null) && (rent == '' || rent ==null)){
                $(".barct").css("display","none");
            }else{
                if(reginName!=null && reginName!=''){
                    $(".regin").parent().css("display","inline-block");
                }else{
                    $(".regin").parent().css("display","none");
                }
                if(rent!=null && rent!=''){
                    $(".rent").parent().css("display","inline-block");
                }else{
                    $(".rent").parent().css("display","none");
                }
                $(".barct").css("display","inline-block");
            }

        })

        // 手动输入价格搜索
        $(".input_rent").click(function () {
            $(".shaixuanbtn.none").css("diplay","inline-block");
        } );
    </script>
</body>
</html>
