<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ahope.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ahope.popup.css" >
		
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ahope.js" ></script>

<script type="text/javascript">
function search_author() {
	if($("#author_id").val() == ''){
		alert("작가 ID를 입력해주세요");
		return;
	}
	
	ajaxG("${pageContext.request.contextPath}/admin/work/searchAuthor", $("#authorForm").serialize(), function(result) {
		$("#author").children().remove();
		if(result.data.length > 0 ){
			for(var i = 0 ; i < result.data.length; i++) {
				var contents = "";
				var author_seq = result.data[i].author_seq;
				var author_name = result.data[i].author_name;
				var author_id = result.data[i].author_id;
				contents += "<tr onclick=\"javascript:selectAuthor('" + author_id + ","+ author_name + "," + author_seq + "')\">"
				contents += "<td width=\"310px\" align=\"center\">" + author_id + " - "+ author_name +"</td>"
				contents += "</tr>"
				$("#author").append(contents);
			}
		} else {
			contents += "<tr>"
			contents += "<td align=\"center\"><div>검색 결과가 없습니다.</div></td>"
			contents += "</tr>"
			$("#author").append(contents);
		}
	});
}
function selectAuthor(name) {
	var strArray = name.split(",");
	console.log(name);
	$("#selected").html(strArray[0]);
	$("#name").val(strArray[0]);
	$("#id").val(strArray[1]);
	$("#author_seq").val(strArray[2]);
	var search = "";
	search += "<div class=\"form-group\">"
	search += "<button class=\"btn btn-default btn-sm\" onclick=\"javascript:write_cancel()\">취소</button> "
	search += "<button class=\"btn btn-ahope btn-sm\" onclick=\"javascript:write_ok()\">확인</button> "
	search += "</div>"
	$("#select_name").html(search);
}
function write_ok() {22
	window.opener.document.getElementById("author_seq"+$("#author_cnt").val()).value = $("#author_seq").val();
	window.opener.document.getElementById("author_id"+$("#author_cnt").val()).value = $("#id").val();
	window.opener.document.getElementById("author_name"+$("#author_cnt").val()).value = $("#name").val();
	window.close();
}
function write_cancel(){
	window.close();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form id="authorForm" onsubmit="return false;">
	<input type="hidden" id="id" name="id" >
	<input type="hidden" id="name" name="name" >
	<input type="hidden" id="author_seq" name="author_seq" >
	<input type="hidden" id="author_cnt" name="author_cnt" value="${author_cnt }">
	
	<div class="popup_title">
		<strong>작가 ID 검색</strong>
	</div>

	<div class="form-horizontal post-wrapper-ahope">
		<div>
			<div class="form-group">작가ID <input type="text" size="20" name="author_id" id="author_id">
				<button class="btn btn-ahope btn-sm"  onclick="search_author()">
					<i class="fa fa-search"></i> 검색
				</button>
			</div>
		</div>

		<div>
			<table class="table table-hover author-table-ahope" align="center" width="400px">
				<thead>
					<tr>
						<th class="popup-thead-ahope">작가 ID - 작가명</th>
					</tr>
				</thead>
				<tbody id="author" class="popup-tbody-ahope">
				</tbody>
			</table>
		</div>
	</div>

	<div class="popup_result">
		<div id="selected"></div>
		<div class="form-horizontal" id="select_name"  align="center"></div>
	</div>
</form>
</body>
</html>
