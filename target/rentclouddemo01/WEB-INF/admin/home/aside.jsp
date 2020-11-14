<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../base.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../img/user-logo.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p> ${sessionScope.loginUser.userName}</p>
                <a href="#">${sessionScope.loginUser.companyName}</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cube"></i> <span>系统管理</span>
                    <span class="pull-right-container">
                     <i class="fa fa-angle-left pull-right"></i>
                 </span>
                </a>
                <ul class="treeview-menu">
                    <li id="sys-user">
                        <a href="${ctx}/admin/user/list" onclick="setSidebarActive(this)"  target="iframe">
                            <i class="fa fa-circle-o"></i>用户管理
                        </a>
                    </li>
                    <li id="sys-room">
                        <a href="${ctx}/admin/room/list" onclick="setSidebarActive(this)"  target="iframe">
                            <i class="fa fa-circle-o"></i>房屋管理
                        </a>
                    </li>
                    <li id="sys-roomImg">
                        <a href="${ctx}/admin/roomImg/list" onclick="setSidebarActive(this)"  target="iframe">
                            <i class="fa fa-circle-o"></i>图片管理
                        </a>
                    </li>
                    <li id="sys-order">
                        <a href="${ctx}/admin/order/list" onclick="setSidebarActive(this)"  target="iframe">
                            <i class="fa fa-circle-o"></i>订单管理
                        </a>
                    </li>
                    <li id="sys-role">
                        <a href="${ctx}/admin/role/list" onclick="setSidebarActive(this)"  target="iframe">
                            <i class="fa fa-circle-o"></i>角色管理
                        </a>
                    </li>
                    <li id="sys-log">
                        <a href="${ctx}/admin/log/list" onclick="setSidebarActive(this)"  target="iframe">
                            <i class="fa fa-circle-o"></i>日志管理
                        </a>
                    </li>
                </ul>
            </li>
            <li class="treeview">
             <a href="#">
                 <i class="fa fa-cube"></i> <span>统计分析</span>
                 <span class="pull-right-container">
                     <i class="fa fa-angle-left pull-right"></i>
                 </span>
             </a>
             <ul class="treeview-menu">
                 <li id="stat-factory">
                     <a href="/stat/toCharts.do?chartsType=factory" onclick="setSidebarActive(this)"  target="iframe">
                         <i class="fa fa-circle-o"></i>房屋出租统计
                     </a>
                 </li>
                 <li id="stat-sell">
                     <a href="/stat/toCharts.do?chartsType=sell" onclick="setSidebarActive(this)"  target="iframe">
                         <i class="fa fa-circle-o"></i>区域租房热点排行
                     </a>
                 </li>
                 <li id="stat-online">
                     <a href="/stat/toCharts.do?chartsType=online" onclick="setSidebarActive(this)"  target="iframe">
                         <i class="fa fa-circle-o"></i>在线人数统计
                     </a>
                 </li>
             </ul>
         </li>

        </ul>

      </section>
               <!-- /.sidebar -->
</aside>
