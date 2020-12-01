<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>云+ 房屋密码找回</title>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/index/lib/layer/css/layui.css">--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index/lib/layer/css/login1.css"/>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="../bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="qiqiu1 qiqiu">
    <img src="${pageContext.request.contextPath}/index/lib/layer/login_img/q2.png"/>
    <div class="text">love</div>
</div>
<div class="qiqiu2 qiqiu">
    <img src="${pageContext.request.contextPath}/index/lib/layer/login_img/q3.png"/>
    <div class="text">love</div>
</div>
<div class="qiqiu3 qiqiu">
    <img src="${pageContext.request.contextPath}/index/lib/layer/login_img/q4.png"/>
    <div class="text">love</div>
</div>
<div class="qiqiu4 qiqiu">
    <img src="${pageContext.request.contextPath}/index/lib/layer/login_img/q5.png"/>
    <div class="text">love</div>
</div>
<div class="qiqiu5 qiqiu">
    <img src="${pageContext.request.contextPath}/index/lib/layer/login_img/q6.png"/>
    <div class="text">love</div>
</div>

<div class="login">
    <h1>修改密码邮件发送</h1>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/user/passwordChange" method="post">
        <div class="form-group" >
            <label for="password" class="col-sm-3 control-label">新密码</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="password" name="password" placeholder="新密码">
            </div>
        </div>
        <div class="form-group" >
            <label for="passwordRE" class="col-sm-3 control-label">重新输入新密码</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="passwordRE" name="passwordRE" placeholder="重复输入新密码" onblur="validate()">
            </div>
        </div>
        <span id="msg"></span>
        <div class="form-group">
            <div class="col-sm-12" style="text-align: center">
                <button type="submit" class="btn btn-success">提交</button>
            </div>
        </div>
    </form>
</div>

</body>


<script>
    function validate() {
        let pwd = $("#password").val();
        let pwdRE = $("#passwordRE").val();
        <!-- 对比两次输入的密码 -->
        if(pwd === pwdRE)
        {
            $("#msg").html("两次密码相同");
            $("#msg").css("color","green");
            $("#msg").removeAttr("disabled");
        }
        else {
            $("#msg").html("两次密码不相同");
            $("#msg").css("color","red")
            $("button").attr("disabled","disabled");
        }
    }
</script>
</body>
</html>

