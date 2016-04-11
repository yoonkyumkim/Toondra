<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>GegnreList</title>

<script type="text/javascript">
	$(function(){
		tableInit();
		
		$('#search_btn').click(function(){
			bindTable();
		});
	});
	
	var oTable;
	function tableInit() {
		oTable = $("#member_list").dataTable({
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
					{ "mDataProp": "email", "bSortable": false, "sClass": "center" },
					{ "mDataProp": "regDate", "bSortable": false, "sClass": "center" }
			],
			"sAjaxSource": "${pageContext.request.contextPath}/admin/member/memberList" ,
			"sServerMethod": "GET",
			"fnServerParams": function ( aoData ) {
				aoData.push( { "name":"searchParam", "value":$("#searchParam").val()} );
			},
			"fnDrawCallback": function( oSettings ) {
			},
			"fnCreatedRow": function (nRow, aData, iDataIndex) {
				var totalCnt = oTable.fnSettings().fnRecordsTotal();
				var startIndex = oTable.fnSettings()._iDisplayStart;
				$(nRow).find('td').eq(0).html(totalCnt-(startIndex+iDataIndex));
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


<form onsubmit="return false;" >
	
	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">회원 관리</h3>
			<h5 class="page-header page-header-desc-ahope">등록된 회원을 조회합니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-12">
		
			<!-- Searchbox -->
			<div id="filter-panel" class="filter-panel collapse in" style="height: auto;">
				<div class="panel panel-default">
					<div class="panel-body">
					
						<div class="navbar-form navbar-left" role="search">
							<label>E-Mail : </label>
							<div class="form-group">
								<input type="text" id="searchParam" name="searchParam" class="form-control" placeholder="Search">
							</div>
						</div>

						<div class="navbar-form search-btn-ahope">
							<div class="form-group">
								<button class="btn btn-ahope" type="button" id="search_btn" >
									<i class="fa fa-search"></i> 검색
								</button>
							</div>
						</div>
						
					</div>
				</div>
			</div>		
		
			<!-- list table -->
			<table id="member_list" class="table">
				<caption></caption>
	     			<!-- list table header -->
				<thead id="sms-list-title" style="height:1px;">
					<tr>
						<th scope="col" style="width:10%"><strong>No</strong></th>
						<th scope="col" ><strong>E-Mail</strong></th>
						<th scope="col" ><strong>등록일</strong></th>
					</tr>
				</thead>
			</table>
			
		</div>
	</div>
	
</form>
</body>
</html>