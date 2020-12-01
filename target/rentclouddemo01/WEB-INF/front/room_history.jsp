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

    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css"/>
</head>
<body>
<div class="hp-containers">
    <%-- 1、头部导航--%>
    <jsp:include page="${pageContext.request.contextPath}/common/header.jsp"></jsp:include>
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
                <c:forEach items="${page.list}" var="room">
                    <li class="house-cell">
                        <div class="img-list">
                            <a href="${pageContext.request.contextPath}/front/room/toRoomDetails?id=${room.id}">
                                <img src="http://localhost/${room.roomImgList[0].img}">
                            </a>
                        </div>
                        <div class="des">
                            <h2>
                                <a href="${pageContext.request.contextPath}/front/room/toRoomDetails?id=${room.id}"
                                   class="strongbox"
                                   style="color: #333"
                                   tongji_label="listclick"
                                   onclick="clickLog('from= fcpc_zflist_gzcount ');"
                                   target="_blank" rel="nofollow">
                                        ${room.title}</a>
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
                                ${room.historyList[0].hhDate}
                            </div>
                            <div class="money">
                                <b class="strongbox">${room.rent}</b>元/月
                            </div>
                            <div class="deleteHistory">
                                <a href="${pageContext.request.contextPath}/front/room/deleteHistory?hhId=${room.historyList[0].hhId}">删除浏览记录</a>
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
                                <li class="active"><a href="${pageContext.request.contextPath}/front/favority/list?pageNum=${currentPage}&pageSize=${pageSize}">${currentPage}</a></li>
                            </c:if>
                            <c:if test="${page.pageNum!=currentPage}">
                                <li><a href="${pageContext.request.contextPath}/front/favority/list?pageNum=${currentPage}&pageSize=${pageSize}">${currentPage}</a></li>
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
