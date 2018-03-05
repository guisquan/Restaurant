<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>后台模板</title>
    <link rel="stylesheet" href="../../css/amazeui.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/core.css"/>
    <link rel="stylesheet" href="../../css/menu.css"/>
    <link rel="stylesheet" href="../../css/index.css"/>
    <link rel="stylesheet" href="../../css/admin.css"/>
    <link rel="stylesheet" href="../assets/css/page/typography.css"/>
    <link rel="stylesheet" href="../assets/css/page/form.css"/>
</head>
<body>
<!-- Begin page -->
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-topbar-left am-hide-sm-only">
        <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">

            <li><h4 class="page-title">表单验证</h4></li>
        </ul>

        <ul class="am-nav am-navbar-nav am-navbar-right">
            <li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
            <li class="hidden-xs am-hide-sm-only">
                <form role="search" class="app-search">
                    <input type="text" placeholder="Search..." class="form-control">
                    <a href=""><img src="../assets/img/search.png"></a>
                </form>
            </li>
        </ul>
    </div>
</header>
<!-- end page -->


<div class="admin">
    <!--<div class="am-g">-->
    <!-- ========== Left Sidebar Start ========== -->
    <!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
            <div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <!-- User -->
            <div class="user-box am-hide-sm-only">
                <div class="user-img">
                    <img src="../assets/img/avatar-1.jpg" alt="user-img" title="Mat Helme"
                         class="img-circle img-thumbnail img-responsive">
                    <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
                </div>
                <h5><a href="#">Mat Helme</a></h5>
                <ul class="list-inline">
                    <li>
                        <a href="#">
                            <i class="am-icon-cog" aria-hidden="true"></i>
                        </a>
                    </li>

                    <li>
                        <a href="#" class="text-custom">
                            <i class="am-icon-cog" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- End User -->

            <ul class="am-list admin-sidebar-list">
                <li><a href="../index.html"><span class="am-icon-home"></span> 首页</a></li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span>
                        表格 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
                        <li><a href="table_basic.html" class="am-cf"> 基本表格</span></a></li>
                        <li><a href="table_complete.html">完整表格</a></li>
                    </ul>
                </li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-line-chart"
                                                                                      aria-hidden="true"></i> 统计图表 <span
                            class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
                        <li><a href="chart_line.html" class="am-cf"> 折线图</span></a></li>
                        <li><a href="chart_columnar.html" class="am-cf"> 柱状图</span></a></li>
                        <li><a href="chart_pie.html" class="am-cf"> 饼状图</span></a></li>
                    </ul>
                </li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav5'}"><span class="am-icon-file"></span> 表单
                        <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav5">
                        <li><a href="form_basic.html" class="am-cf"> 基本表单</a></li>
                        <li><a href="form_validate.html">表单验证</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!-- sidebar end -->

    <!--</div>
</div>
</div>-->
    <!-- ========== Left Sidebar end ========== -->


    <!--	<div class="am-g">-->
    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="am-g">
                <!-- Row start -->
                <div class="am-u-sm-12">
                    <div class="card-box">
                        <ul class="am-nav am-fr">
                            <li class="am-dropdown" data-am-dropdown>
                                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                                    <span class="am-icon-caret-down"></span>
                                </a>
                                <ul class="am-dropdown-content">
                                    <li>1231234</li>
                                    <li>1231234</li>
                                    <li>1231234</li>
                                    <li>1231234</li>
                                </ul>
                            </li>
                        </ul>

                        <form action="" class="am-form" data-am-validator>
                            <fieldset>
                                <legend>JS 表单验证</legend>
                                <div class="am-form-group">
                                    <label for="doc-vld-name-2">用户名：</label>
                                    <input type="text" id="doc-vld-name-2" minlength="3" placeholder="输入用户名（至少 3 个字符）"
                                           required/>
                                </div>

                                <div class="am-form-group">
                                    <label for="doc-vld-email-2">邮箱：</label>
                                    <input type="email" id="doc-vld-email-2" placeholder="输入邮箱" required/>
                                </div>

                                <div class="am-form-group">
                                    <label for="doc-vld-url-2">网址：</label>
                                    <input type="url" id="doc-vld-url-2" placeholder="输入网址" required/>
                                </div>

                                <div class="am-form-group">
                                    <label for="doc-vld-age-2">年龄：</label>
                                    <input type="number" class="" id="doc-vld-age-2" placeholder="输入年龄  18-120" min="18"
                                           max="120" required/>
                                </div>

                                <div class="am-form-group">
                                    <label class="am-form-label">爱好：</label>
                                    <label class="am-checkbox-inline">
                                        <input type="checkbox" value="橘子" name="docVlCb" minchecked="2" maxchecked="4"
                                               required> 橘子
                                    </label>
                                    <label class="am-checkbox-inline">
                                        <input type="checkbox" value="苹果" name="docVlCb"> 苹果
                                    </label>
                                    <label class="am-checkbox-inline">
                                        <input type="checkbox" value="菠萝" name="docVlCb"> 菠萝
                                    </label>
                                    <label class="am-checkbox-inline">
                                        <input type="checkbox" value="芒果" name="docVlCb"> 芒果
                                    </label>
                                    <label class="am-checkbox-inline">
                                        <input type="checkbox" value="香蕉" name="docVlCb"> 香蕉
                                    </label>
                                </div>

                                <div class="am-form-group">
                                    <label>性别： </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" value="" name="docVlGender" required> 男
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="docVlGender"> 女
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="docVlGender"> 其他
                                    </label>
                                </div>

                                <div class="am-form-group">
                                    <label for="doc-select-1">下拉单选框</label>
                                    <select id="doc-select-1" required>
                                        <option value="">-=请选择一项=-</option>
                                        <option value="option1">选项一...</option>
                                        <option value="option2">选项二.....</option>
                                        <option value="option3">选项三........</option>
                                    </select>
                                    <span class="am-form-caret"></span>
                                </div>

                                <div class="am-form-group">
                                    <label for="doc-select-2">多选框</label>
                                    <select multiple class="" id="doc-select-2" minchecked="2" maxchecked="4">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>

                                <div class="am-form-group">
                                    <label for="doc-vld-ta-2">评论：</label>
                                    <textarea id="doc-vld-ta-2" minlength="10" maxlength="100"></textarea>
                                </div>

                                <button class="am-btn am-btn-secondary" type="submit">提交</button>
                            </fieldset>
                        </form>


                    </div>
                </div>
                <!-- Row end -->
            </div>


        </div>
    </div>
    <!-- end right Content here -->
    <!--</div>-->
</div>
</div>

<!-- navbar -->
<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

<script type="text/javascript" src="../assets/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="../assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/blockUI.js"></script>
</body>

</html>
