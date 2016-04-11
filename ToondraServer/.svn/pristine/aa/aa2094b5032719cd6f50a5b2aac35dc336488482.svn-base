<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>PushList</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(function(){
		tableInit();
		
		//date picker
		$("#startRegDate").datepicker({
			showOn: "both", 
			buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>'
		});
		$("#endRegDate").datepicker({
			showOn: "both", 
			buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>'
		});
		$("#startSendDate").datepicker({
			showOn: "both", 
			buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>'
		});
		$("#endSendDate").datepicker({
			showOn: "both", 
			buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>'
		});
		
		$('#search_btn').click(function(){
			bindTable();
		});
	
		$('#check_all').change(function(){
			$('input:checkbox[name="push_check"]').prop('checked', this.checked);
		});
		
		$('#delete_btn').click(function(){
			deletePush();
		});
		
		$('#insert_btn').click(function(){
			location.href = '${pageContext.request.contextPath}/admin/community/push/insertPushView';
		});
		
	});
	
	function deletePush() {
		
		var url = '${pageContext.request.contextPath}/admin/community/push/deletePush';
		var pushSeqStr = "";
		var count = 0;
		$('input:checkbox[name="push_check"]:checked').each(function(idx){
			if(idx > 0) {
				pushSeqStr += "|"
			}
			++count;
			pushSeqStr += $(this).val();
		});
		
		if(pushSeqStr == "") {
			cAlert("알림을 선택해 주세요.");
			return false;
		} else {
			var msg = "";
			msg = "개 알림를 삭제합니다.";
			
			cConfirm(count+msg, function(){
				
				var data = 'pushSeqStr='+pushSeqStr;
				ajaxP(url, data, function (data) {
					if(data.result == false) {
						if(data.msg != '') {
							cAlert(data.msg);
						} else {
							cAlert("알림 삭제에 실패하였습니다.");
						}
					} else {
						cAlert("알림을 삭제하였습니다.", function() {
							bindTable();
							$('#check_all').prop('checked', false);
						});
					}
				});
			});
		}
		
	}
	
	var oTable;
	function tableInit() {
		oTable = $("#push_list").dataTable({
			"aoColumnDefs": [
			                 	{
				                	"sDefaultContent": "",
				                	"aTargets": [ "_all" ]
								}
			               ],
			"bLengthChange": true,
   			"bFilter":false,
   			"sPaginationType": "bootstrap",
   			"order": [],
   			"bLengthChange" : false,
   			"bProcessing": true,
   			"oLanguage": {
				"sInfo" : "",
				"sInfoEmpty" : ""
			},
   			"bServerSide": true,
			"aoColumns": [
					{"bSortable": false, "sClass": "center"},
					{"bSortable": false, "sClass": "center"},
					{ "mDataProp": "title", "bSortable": false, "sClass": "center" },
					{ "mDataProp": "sendDateTime", "bSortable": false, "sClass": "center" },
					{ "mDataProp": "regDate", "bSortable": false, "sClass": "center" },
					{ "mDataProp": "sendStateStr", "bSortable": false, "sClass": "center" }
			],
			"sAjaxSource": "${pageContext.request.contextPath}/admin/community/push/pushList" ,
			"sServerMethod": "GET",
			"fnServerParams": function ( aoData ) {
				aoData.push( { "name":"startSendDate", "value":$("#startSendDate").val()} );
				aoData.push( { "name":"endSendDate", "value":$("#endSendDate").val()} );
				aoData.push( { "name":"startRegDate", "value":$("#startRegDate").val()} );
				aoData.push( { "name":"endRegDate", "value":$("#endRegDate").val()} );
				aoData.push( { "name":"title", "value":$("#title").val()} );
				aoData.push( { "name":"sendState", "value":$("#sendState").val()} );
			},
			"fnDrawCallback": function( oSettings ) {
			},
			"fnCreatedRow": function (nRow, aData, iDataIndex) {
				var totalCnt = oTable.fnSettings().fnRecordsTotal();
				var startIndex = oTable.fnSettings()._iDisplayStart;
				$(nRow).find('td').eq(1).html(totalCnt-(startIndex+iDataIndex));
				$(nRow).find('td').eq(0).html('<input type="checkbox" name="push_check" value="'+aData.pushSeq+'">');
				
				$(nRow).find('td:not(:first-child)').unbind("click").bind("click", function(){
					$('#pushSeq').val(aData.pushSeq);
					$('#frm').attr('action', '${pageContext.request.contextPath}/admin/community/push/pushDetail').submit();
				});
			}
		});
	}
	
	function bindTable() {
		oTable.fnDestroy();
		tableInit();
		oTable.fnSettings()._iDisplayStart = 0;
	}
</script>


</head>
<body>


<form id="frm" name="frm" method="post" >
	
	<input type="hidden" id="pushSeq" name="pushSeq" value="">
	
	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">커뮤니티 > 알림 관리</h3>
			<h5 class="page-header page-header-desc-ahope">알림 내역을 관리합니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-12">
		
			<!-- Searchbox -->
			<div id="filter-panel" class="filter-panel collapse in" style="height: auto;">
				<div class="panel panel-default">
					<div class="panel-body">
						
						
						<div class="navbar-form" role="search">
							<label>알림일 : </label>
							<div class="form-group search-cm-ahope">
								<input type="text" id="startSendDate" name="startSendDate" class="form-control input-ahope-wd-sm">
								-
								<input type="text" id="endSendDate" name="endSendDate" class="form-control input-ahope-wd-sm">
							</div>
							
							<label>등록일 : </label>
							<div class="form-group search-cm-ahope">
								<input type="text" id="startRegDate" name="startRegDate" class="form-control input-ahope-wd-sm">
								-
								<input type="text" id="endRegDate" name="endRegDate" class="form-control input-ahope-wd-sm">
							</div>
						</div>
							
						<div class="navbar-form navbar-left" role="search">
							<label>제목 : </label>
							<div class="form-group search-cm-ahope">
								<input type="text" id="title" name="title" class="form-control" placeholder="Title">
							</div>
							
							<label>상태 : </label>
							<div class="form-group search-cm-ahope">
								<select id="sendState" name="sendState" class="form-control">
									<option value="">전체</option>
									<option value="00">대기</option>
									<option value="01">전송중</option>
									<option value="02">완료</option>
									<option value="03">실패</option>
								</select>
							</div>
						</div>
						
						<div class="navbar-form search-btn-ahope">
							<button class="btn btn-ahope" type="button" id="search_btn" >
								<i class="fa fa-search"></i> 검색
							</button>
						</div>

					</div>
				</div>
			</div>		
		
			<div>
				<div class="btn-right">
					<button type="button" class="btn btn-default" id="insert_btn">등록</button>
					<button type="button" class="btn btn-ahope" id="delete_btn">삭제</button>
				</div>
			</div>
			
			<!-- list table -->
			<table id="push_list" class="table table-link-ahope">
				<caption></caption>
	     			<!-- list table header -->
				<thead id="sms-list-title" style="height:1px;">
					<tr>
						<th scope="col" style="width:5%"><input type="checkbox" id="check_all"></th>
						<th scope="col" style="width:10%"><strong>No</strong></th>
						<th scope="col" ><strong>제목</strong></th>
						<th scope="col" style="width:20%"><strong>알림일</strong></th>
						<th scope="col" style="width:20%"><strong>등록일</strong></th>
						<th scope="col" style="width:10%"><strong>상태</strong></th>
					</tr>
				</thead>
			</table>
			
		</div>
	</div>
	
</form>
</body>
</html>