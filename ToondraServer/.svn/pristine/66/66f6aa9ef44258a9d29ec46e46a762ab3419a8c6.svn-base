<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>sample</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/DataTables/jquery.dataTables.css">
<script	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.2.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/libs/DataTables/jquery.dataTables.js"></script>

</head>
<script type="text/javascript">

	$(document).ready(function() {
		bindinit();
	});

	function bindinit() {
		oTable = $("#testList").dataTable({
			"bLengthChange": true,
			"sPaginationType": "full_numbers",
			"order": [],
			"aLengthMenu":[10,20,30,40],
			"bProcessing": false,
			"bServerSide": true,
			"oLanguage": {
				"sLengthMenu": "표시갯수 _MENU_ 개"
			},
			"aoColumns": [
					{ "mData": "name", "bSortable": false, "sClass": "center" },
					{ "mData": "age", "bSortable": false, "sClass": "center" },
			],
			"sAjaxSource" : "${pageContext.request.contextPath}/web/sample/testDatatable",
			"sServerMethod": "POST",
			"sDom": '<"top"l>rt<"bottom"p><"clear">',
			"fnServerParams": function ( aoData ) {
			},
			"fnDrawCallback": function( oSettings ) {
			},
			"fnCreatedRow": function (nRow, aData, iDataIndex) {
				
			}
		});
	}
</script>
<body>
	<!-- <form name="frm" id="frm" method="post" enctype="multipart/form-data">
			<input type="file" name="upfile_name" id="upfile_id">
			
			<input type="submit" value="전송" multiple="multiple">
			<input type="button" onclick="upGo()" value="업로드()">
		</form> -->
	<%-- <a href="${pageContext.request.contextPath}/web/sample/exelTest">엑셀다운로드</a> --%>
	<from method="post"> <input type="hidden" id="start"
		name="start"> <input type="hidden" id="start" name="start">
	<input type="hidden" id="length" name="length">
	<table id="testList">
		<thead>
			<tr>
				<th>Name</th>
				<th>age</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
</body>
</from>
</html>
