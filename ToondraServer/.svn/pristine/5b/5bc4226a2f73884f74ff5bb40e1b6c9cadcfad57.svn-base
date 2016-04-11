<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<script type="text/javascript">
	var iLength = 10;
function author_insert() {
	location.href="${pageContext.request.contextPath}/admin/author/insertView"
}
$(document).ready(function() {
	if("${result}" == "success") {
		cAlert("삭제 완료");
	}
	if("${result}" == "fail") {
		cAlert("작품 등록이 있는 작가는 삭제가 불가능합니다.");
	}
	tableInit();
	
	$('#search_btn').click(function(){
		bindTable();
	});
});

function author_delete() {
	var authors = $("input:checkbox[name=del_list]:checked").length;
	if(authors == "0"){
		cAlert("삭제할 작가를 선택하세요")
		return;
	}
	cConfirm(authors+"명의 작가를 목록에서 삭제 하시겠습니까?", function() {
		var form = document.getElementById("author_form");
		form.action = "${pageContext.request.contextPath}/admin/author/deleteAuthor";
		form.submit();
	})
	
}

$(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		} else {
			$("input[type=checkbox]").prop("checked",false);
		}
	})
})
//리스트를 Table 에 바인드 시켜 화면에 내용을 표시하는 함수
function tableInit() {
	oTable = $("#authorList").dataTable({
		"bLengthChange": false,
		"sPaginationType": "bootstrap",
		"aoColumnDefs": [
		                 	{
			                	"sDefaultContent": "",
			                	"aTargets": [ "_all" ]
							}
		               ],
		"bProcessing": true,
		"iDisplayLength": iLength,
		"oLanguage": {
			"oPaginate": {
				"sFirst":    "<<",
				"sPrevious": "<",
				"sNext":     ">",
				"sLast":     ">>"
			}
		},
		
		"bServerSide": true,
		"aoColumns": [
			{ "mData": "author_seq", "bSortable": false, "sClass": "center" },
			{ "mData": "author_seq", "bSortable": false, "sClass": "center" },
			{ "mData": "author_id", "bSortable": false, "sClass": "center" },
			{ "mData": "author_name", "bSortable": false, "sClass": "center" },
			{ "mData": "phone_num", "bSortable": false, "sClass": "center" },
			{ "mData": "email", "bSortable": false, "sClass": "center" },
			{ "mData": "reg_date", "bSortable": false, "sClass": "center" }
		],
		"sAjaxSource": "${pageContext.request.contextPath}/admin/author/authorList" ,
		"sServerMethod": "POST",
		"sDom": '<"top"l>rt<"bottom"p><"clear">',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name":"search_param", "value":$("#search_param").val()} );
			aoData.push( { "name":"gubun", "value":$("#gubun").val()} );
		},
		"fnDrawCallback": function( oSettings ) {
		},
		"fnCreatedRow": function (nRow, aData, iDataIndex) {
			
			var totalCnt = oTable.fnSettings().fnRecordsTotal();
			var startIndex = oTable.fnSettings()._iDisplayStart;
			var check = "<input type=\"checkbox\" name=\"del_list\" value=\""+aData.author_seq+"\">"
			$(nRow).find('td').eq(0).html(check);
			$(nRow).find('td').eq(1).html(totalCnt-(startIndex+iDataIndex));
			$(nRow).find('td').css({'vertical-align' : 'middle'});
			
			
			$(nRow).find('td:not(:first-child)').unbind("click").bind("click", function(){
				viewDetail(aData.author_seq);
			});
		}
	});
}
function viewDetail(author_seq) {
	post_to_url("${pageContext.request.contextPath}/admin/author/authorDetail",{'author_seq':author_seq });
}

function bindTable(){
	oTable.fnDestroy();
	tableInit();
	oTable.fnSettings()._iDisplayStart = 0;
}

</script>
</head>
<body>
<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">작가 관리</h3>
			<h5 class="page-header page-header-desc-ahope">작가를 관리합니다.</h5>
		</div>
	</div>
	
<form id="author_form" method="post" onsubmit="return false;">
<div class="row">
		<div class="col-lg-12">
			<div id="filter-panel" class="filter-panel collapse in" style="height: auto;">
				<div class="panel panel-default">
					<div class="panel-body">
					
						<div class="navbar-form navbar-left" role="search">
							<select id="gubun" class="form-control">
								<option value="author_id">작가ID</option>
								<option value="author_name">작가명</option>
								<option value="phone_num">연락처</option>
								<option value="email">이메일</option>
							</select>
							<div class="form-group">
								<input type="text" id="search_param" name="search_param" class="form-control" placeholder="Search">
							</div>
						</div>

						<div class="search-btn-ahope">
							<button class="btn btn-ahope" type="button" id="search_btn"  >
								<i class="fa fa-search"></i> 검색
							</button>
						</div>
						
					</div>
				</div>
			</div>		
			<div>
				<div class="btn-right">
					<button type="button" class="btn btn-default" id="insert_btn" onclick="author_insert()">등록</button>
					<button type="button" class="btn btn-ahope" id="delete_btn" onclick="author_delete()">삭제</button>
				</div>
			</div>
			<div class="data_tables">
						<table id="authorList" class="table table-link-ahope">
							<thead id="sms-list-title" style="height:1px;">
								<tr>
									<th scope="col" width="5%"><input type="checkbox" id="allCheck"></th>
									<th scope="col" width="5%">번호</th>
									<th scope="col" width="10%" style="text-align: center;">작가ID</th>
									<th scope="col" width="10%">작가명</th>
									<th scope="col" width="10%">연락처</th>
									<th scope="col" width="20%">이메일</th>
									<th scope="col" width="10%">등록일</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
				</div>
		</div>
</div>
</form>
</body>
</html>