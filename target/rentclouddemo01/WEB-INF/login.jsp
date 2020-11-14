<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>云+ 房屋登录</title>
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
	 <h1>用户登录</h1>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="username" class="col-sm-3 control-label">用户名</label>
			<div class="col-sm-9">
				<input type="username" class="form-control" id="username" placeholder="Username">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-3 control-label">密码</label>
			<div class="col-sm-9">
				<input type="password" class="form-control" id="inputPassword3" placeholder="Password">
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
			<div class="col-sm-12" style="text-align: center">
				<button type="submit" class="btn btn-success">登录</button>
			</div>
		</div>
	</form>
	</div>

</body>


<script>

</script>
</body>
</html>
