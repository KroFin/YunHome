<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>房屋图片管理列表</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
</head>
<script>
    function deleteById() {
        var id = getCheckId()
        if(id) {
            if(confirm("你确认要删除此条记录吗？")) {
                location.href="${pageContext.request.contextPath}/admin/roomImg/delete?id="+id;
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
            <small>房屋图片管理</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">房屋图片列表</h3>
            </div>
            <div class="box-body">
                <div class="table-box">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" title="添加" onclick='location.href="${ctx}admin/roomImg/toAddPage"'><i class="fa fa-file-o"></i> 发布</button>
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
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="width: 1000px">
                            <thead>
                            <tr>
                                <th class="" style="padding-right:0px;width: 50px"> </th>
                                <th class="sorting" style="width: 50px">所属房屋编号</th>
                                <th class="sorting" style="width: 150px">房屋标题</th>
                                <th class="sorting" style="width: 250px;">图片</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.list}" var="item">
                                <tr>
                                    <td><input name="ids" value="${item.id}" type="checkbox"></td>
                                    <td><a href="${pageContext.request.contextPath}system/user/toUpdate?id=${item.id}">${item.room.id}</a></td>
                                    <td>${item.room.title}</td>
                                    <td><img style="width: 150px;" src="http://49.234.181.182:8090/${item.img}" alt=""></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="box-footer">
                <jsp:include page="../../common/page.jsp">
                    <jsp:param value="${ctx}/admin/roomImg/list" name="pageUrl"/>
                </jsp:include>
            </div>
        </div>

    </section>
</div>
</body>

</html>