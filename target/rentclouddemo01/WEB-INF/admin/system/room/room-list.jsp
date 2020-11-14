<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>房屋管理列表</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
</head>
<script>
    function deleteById() {
        var id = getCheckId();
        if(id) {
            if(confirm("你确认要删除此条记录吗？")) {
                location.href="/system/user/delete.do?id="+id;
            }
        }else{
            alert("请勾选待处理的记录，且每次只能勾选一个")
        }
    }
</script>
<body>
<div id="frameContent" class="content-wrapper" style="margin-left:0px;">
<section class="content-header">
    <h1>
        系统管理
        <small>房屋管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
    </ol>
</section>
<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">房屋列表</h3>
        </div>
        <div class="box-body">
            <div class="table-box">
                <div class="pull-left">
                    <div class="form-group form-inline">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" title="发布" onclick='location.href="${ctx}/admin/room/toAddPage"'><i class="fa fa-file-o"></i> 发布</button>
                            <button type="button" class="btn btn-default" title="删除" onclick='deleteById()'><i class="fa fa-trash-o"></i> 删除</button>
                            <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                            <button type="button" class="btn btn-default" title="角色" onclick="roleList()"><i class="fa fa-user-circle-o"></i> 角色</button>
                        </div>
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        <input type="text" class="form-control input-sm" placeholder="搜索">
                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                </div>
                <div class="table-responsive" style="width: 100%">
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="width: 1800px">
                        <thead>
                        <tr>
                            <th class="" style="padding-right:0px;width: 50px"> </th>
                            <th class="sorting" style="width: 100px">标题</th>
                            <th class="sorting" style="width: 50px">租金</th>
                            <th class="sorting" style="width: 50px;">房型</th>
                            <th class="sorting" style="width: 80px;">所在区域</th>
                            <th class="sorting" style="width: 100px">地址</th>
                            <th class="sorting" style="width: 100px;">地址详情</th>
                            <th class="sorting" style="width: 80px">房屋面积</th>
                            <th class="sorting" style="width: 80px">出租方式</th>
                            <th class="sorting" style="width: 200px">交通情况</th>
                            <th class="sorting" style="width: 200px">设备情况</th>
                            <th class="sorting" style="width: 250px">房屋描述</th>
                            <th class="sorting" style="width: 80px">所属房主</th>
                            <th class="sorting" style="width: 80px">房屋状态</th>
                            <th class="sorting" style="width: 50px">租户</th>
                            <th class="text-center" style="width: 50px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${page.list}" var="item">
                                <tr>
                                    <td>
                                        <input name="ids" value="${item.id}" type="checkbox">
                                    </td>
                                    <td><a href="${pageContext.request.contextPath}system/user/toUpdate?id=${item.id}">${item.title}</a>
                                    </td>
                                    <td>${item.rent}</td> <td>${item.roomType}</td>
                                    <td>${item.region.regionName}</td> <td>${item.address}</td>
                                    <td>${item.detailAddress}</td>
                                    <td>${item.area}</td> <td>${item.rentType}</td>
                                    <td>${item.trafficCondition}</td>
                                    <td>${item.facilitiesCondition}</td>
                                    <td>${item.roomDesc}</td>
                                    <td>${item.user.username}</td>
                                    <td>
                                        <c:if test="${item.rentStatus ==0}">待出 租</c:if>
                                        <c:if test="${item.rentStatus ==1}">已出 租</c:if>
                                        <c:if test="${item.rentStatus ==-1}">已 下架</c:if>
                                    </td>
                                    <td>${item.rentUser.username}</td>
                                    <th class="text-center">
                                        <button type="button" class="btn bg- olive btn-xs" onclick='location.href="/system/user/toUpdate.do? id=${item.id}"'>编辑</button>
                                </th>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <jsp:include page="../../common/page.jsp">
                <jsp:param value="${ctx}/admin/room/list" name="pageUrl"/>
            </jsp:include>
        </div>
    </div>

</section>
</div>
</body>

</html>
