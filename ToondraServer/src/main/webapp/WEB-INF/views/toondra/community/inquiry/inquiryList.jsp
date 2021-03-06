<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>InquiryList</title>

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
		
		$('#search_btn').click(function(){
			bindTable();
		});
	
		$('#insert_btn').click(function(){
			location.href = '${pageContext.request.contextPath}/admin/community/inquiry/insertInquiryView';
		});
		
	});
	
	var oTable;
	function tableInit() {
		oTable = $("#inquiry_list").dataTable({
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
					{ "mDataProp": "categoryCodeName", "bSortable": false, "sClass": "center" },
					{ "mDataProp": "email", "bSortable": false, "sClass": "center" },
					{ "mDataProp": "regDate", "bSortable": false, "sClass": "center" },
					{ "mDataProp": "answerYnStr", "bSortable": false, "sClass": "center" }
			],
			"sAjaxSource": "${pageContext.request.contextPath}/admin/community/inquiry/inquiryList" ,
			"sServerMethod": "GET",
			"fnServerParams": function ( aoData ) {
				aoData.push( { "name":"startRegDate", "value":$("#startRegDate").val()} );
				aoData.push( { "name":"endRegDate", "value":$("#endRegDate").val()} );
				aoData.push( { "name":"categoryCodeSeq", "value":$("#categoryCodeSeq").val()} );
				aoData.push( { "name":"email", "value":$("#email").val()} );
				aoData.push( { "name":"postYn", "value":$("#answerYn").val()} );
			},
			"fnDrawCallback": function( oSettings ) {
			},
			"fnCreatedRow": function (nRow, aData, iDataIndex) {
				var totalCnt = oTable.fnSettings().fnRecordsTotal();
				var startIndex = oTable.fnSettings()._iDisplayStart;
				$(nRow).find('td').eq(0).html(totalCnt-(startIndex+iDataIndex));
				$(nRow).find('td:not(:first-child)').unbind("click").bind("click", function(){
					$('#inquirySeq').val(aData.inquirySeq);
					$('#frm').attr('action', '${pageContext.request.contextPath}/admin/community/inquiry/inquiryDetail').submit();
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
	
	<input type="hidden" id="inquirySeq" name="inquirySeq" value="">
	
	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">커뮤니티 > 문의 답변</h3>
			<h5 class="page-header page-header-desc-ahope">회원이 문의한 내용을 조회, 답변을 관리합니다.</h5>
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
							<label>등록일 : </label>
							<div class="form-group search-cm-ahope">
								<input type="text" id="startRegDate" name="startRegDate" class="form-control input-ahope-wd-sm">
								-
								<input type="text" id="endRegDate" name="endRegDate" class="form-control input-ahope-wd-sm">
							</div>
							
							<label>문의유형 : </label>
							<div class="form-group search-cm-ahope">
								<select id="categoryCodeSeq" name="categoryCodeSeq" class="form-control">
									<option value="">전체</option>
									<c:forEach items="${codeList }" var="code">
										<option value="${code.codeSeq}">${code.codeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
							
						<div class="navbar-form navbar-left" role="search">
							<label>작성자 : </label>
							<div class="form-group search-cm-ahope">
								<input type="text" id="email" name="email" class="form-control" placeholder="Title">
							</div>
							
							<label>상태 : </label>
							<div class="form-group search-cm-ahope">
								<select id="answerYn" name="postYn" class="form-control">
									<option value="">전체</option>
									<option value="Y">답변완료</option>
									<option value="N">대기</option>
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

			<!-- list table -->
			<table id="inquiry_list" class="table table-link-ahope">
				<caption></caption>
     			<!-- list table header -->
				<thead id="sms-list-title" style="height:1px;">
					<tr>
						<th scope="col" style="width:10%"><strong>No</strong></th>
						<th scope="col" ><strong>문의유형</strong></th>
						<th scope="col" ><strong>작성자</strong></th>
						<th scope="col" ><strong>등록일</strong></th>
						<th scope="col" ><strong>상태</strong></th>
					</tr>
				</thead>
			</table>
			
		</div>
	</div>
	
</form>
</body>
</html>