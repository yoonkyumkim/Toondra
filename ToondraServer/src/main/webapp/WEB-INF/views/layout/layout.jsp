<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
			<decorator:title default="Spring-SiteMesh" />
		</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metisMenu.min.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ahope.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.dataTables.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.css">
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/metisMenu.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/js/ahope.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modal.js"></script>

		<script	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrapPagination.js"></script>
		
			
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="${pageContext.request.contextPath}/resources/libs/html5shiv/html5shiv-3.7.2.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/libs/respond/respond-1.4.2.min.js"></script>
		<![endif]-->
		
		<script type="text/javascript">
			//Custom alert modal
			function cAlert(msg, func) {
				$('#ahopeAlertMsg').html(msg);
				$('#ahopeAlert').on('hide.bs.modal', function (e) {
					if(typeof func !== 'undefined')	func();
				});
				$('#ahopeAlert').modal('show');
			}
			
			//Custom confirm modal
			function cConfirm(msg, func) {
				$('#ahopeConfirmMsg').html(msg);
				$('#ahopeConfirmBtn').unbind("click").bind("click", function(){
					$('#ahopeConfirm').modal('hide');
					if(typeof func !== 'undefined')	func();
				});
				$('#ahopeConfirm').modal('show');
			}
			function workSwitch(func1,func2) {
				$("#workList").bind("click", function() {
					$("#workSwitch").modal('hide');
					if(typeof func !== 'undifined') func1();
				});
				$("#contentsList").bind("click", function() {
					$("#workSwitch").modal('hide');
					if(typeof func !== 'undifined') func2();
				});
				$('#workSwitch').modal('show');
			}
		</script>
		
		<decorator:head />
	</head> 
	
	
	<body> 
	
		<div id="wrapper">
			
			<!-- Navigator -->
			<c:import url="/WEB-INF/views/layout/frameset/nav.jsp" />
			
			<!-- Main -->
			<div id="page-wrapper">
				<decorator:body />
			</div>
		
		</div>
	
	
		<!-- alert -->
		<div class="modal fade alert-ahope" id="ahopeAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header alert-header-ahope">
						<h4 class="modal-title" id="myModalLabel">확 인</h4>
					</div>
					<div class="modal-body alert-body-ahope" id="ahopeAlertMsg"></div>
					<div class="modal-footer btn-center">
						<button type="button" class="btn btn-ahope" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	
		<!-- modal -->
		<div class="modal fade alert-ahope" id="ahopeConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header alert-header-ahope">
						<h4 class="modal-title" id="myModalLabel">확 인</h4>
					</div>
					<div class="modal-body alert-body-ahope" id="ahopeConfirmMsg"></div>
					<div class="modal-footer btn-center">
						<button type="button" class="btn btn-ahope" id="ahopeConfirmBtn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- workSwitch -->
		<div class="modal fade alert-ahope" id="workSwitch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header alert-header-ahope">
						<h4 class="modal-title" id="myModalLabel">이 동</h4>
					</div>
					<div class="modal-footer btn-center">
						<button type="button" class="btn btn-ahope" id="workList">작품 관리</button>
						<button type="button" class="btn btn-ahope" id="contentsList">컨텐츠 등록</button>
					</div>
				</div>
			</div>
		</div>
	
	</body> 
</html>