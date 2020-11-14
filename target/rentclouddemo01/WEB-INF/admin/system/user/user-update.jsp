<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../../base.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户修改</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 页面meta /-->
</head>
<body>
<div id="frameContent" class="content-wrapper" style="margin-left:0px;">
    <!-- 内容头部 -->
    <section class="content-header">
        <h1>
            系统管理
            <small>用户管理</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li><a href="${ctx}/admin/user/list">用户列表</a></li>
        </ol>
    </section>
    <!-- 内容头部 /-->

    <!-- 正文区域 -->
    <section class="content">
        <!--订单信息-->
        <div class="panel panel-default">
            <div class="panel-heading">用户信息</div>
            <form id="editForm" action="${ctx}/admin/user/update" method="post">
                <input type="hidden" value="${user.id}" name="id">
                <div class="row data-type" style="margin: 0px">
                    <div class="col-md-2 title">用户名称</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" placeholder="用户名称" name="username" value="${user.username}">
                    </div>

                    <div class="col-md-2 title">邮箱</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" placeholder="邮箱" name="email" value="${user.email}">
                    </div>

                    <div class="col-md-2 title">手机号码</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" placeholder="手机号码" name="phone" value="${user.phone}">
                    </div>

                    <div class="col-md-2 title">年龄</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" placeholder="年龄" name="age" value="${user.age}">
                    </div>

                    <div class="col-md-2 title">密码</div>
                    <div class="col-md-4 data">
                        <input type="password" class="form-control" placeholder="密码" name="password"  value="${user.password}" readonly>
                    </div>

                    <div class="col-md-2 title">性别</div>
                    <div class="col-md-4 data">
                        <div class="form-group form-inline">
                            <div class="radio"><label><input type="radio" name="gender" value="1" ${user.gender==1?'checked':''}>男</label></div>
                            <div class="radio"><label><input type="radio" name="gender" value="0" ${user.gender==0?'checked':''}>女</label></div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
        <!--订单信息/-->

        <!--工具栏-->
        <div class="box-tools text-center">
            <button type="button" onclick='document.getElementById("editForm").submit()' class="btn bg-maroon">保存</button>
            <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
        </div>
        <!--工具栏/-->

    </section>
    <!-- 正文区域 /-->

</div>
<!-- 内容区域 /-->
</body>
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<link rel="stylesheet" href="../../css/style.css">
<script>
    $('#datepicker').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    });
    $('#datepicker1').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    });
</script>
</html>
