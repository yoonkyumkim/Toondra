<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
</script>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top navbar-top-ahope" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <a class="navbar-brand-ahope" href="${pageContext.request.contextPath }/">Toondra</a>
    </div>
    <!-- /.navbar-header -->
    
    <ul class="nav navbar-top-links navbar-right">
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle navbar-top-ahope" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i>  
                <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                	<a href="${pageContext.request.contextPath }/admin/login/logout">
                		<i class="fa fa-sign-out fa-fw"></i> Logout
                	</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/work/workListView" class="navbar-siderbar-ahope"><i class="fa fa-book fa-fw"></i> 작품 관리</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/author/authorListView" class="navbar-siderbar-ahope"><i class="fa fa-pencil-square-o fa-fw"></i> 작가 관리</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/member/memberListView" class="navbar-siderbar-ahope"><i class="fa fa-user fa-fw"></i> 회원 관리</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/service/genreListView" class="navbar-siderbar-ahope">
                    	<i class="fa fa-bars fa-fw"></i> 서비스 장르
                    </a>
                </li>
                <li>
                    <a href="/" class="navbar-siderbar-ahope">
                    	<i class="fa fa-comments-o fa-fw"></i> 커뮤니티<span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/community/notice/noticeListView" class="navbar-siderbar-ahope">공지 사항</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/community/faq/faqListView" class="navbar-siderbar-ahope">FAQ</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/community/inquiry/inquiryListView" class="navbar-siderbar-ahope">문의 답변</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/community/push/pushListView" class="navbar-siderbar-ahope">알림 관리</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                 <li>
                    <a href="/"  class="navbar-siderbar-ahope">
                    	<i class="fa fa-bar-chart-o fa-fw"></i> 통계<span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/stats/purchase/statsListView" class="navbar-siderbar-ahope">매출 통계</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/stats/content/statsListView" class="navbar-siderbar-ahope">컨텐츠 통계</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
