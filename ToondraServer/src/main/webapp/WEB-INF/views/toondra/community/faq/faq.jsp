<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>FAQ</title>

<script type="text/javascript">

	$(function(){
		
		$('#cancel_btn').click(function(){
			goList();
		});
		
		$('#insert_btn').click(function(){
			insertFAQ('N');
		});
		
		$('#insert_direct_btn').click(function(){
			insertFAQ('Y');
		});
		
	});
	
	function insertFAQ(postYn){
		$('#postYn').val(postYn);
		var url = '${pageContext.request.contextPath}/admin/community/faq/insertFAQ';
		var data = $('#frm').serialize();
		ajaxP(url, data, function (data) {
			if(data.result == false) {
				if(data.msg != '') {
					alert(data.msg);
				} else {
					cAlert("FAQ 등록에 실패하였습니다.");
				}
			} else {
				cAlert("FAQ를 등록하였습니다.", goList);
			}
		});
	}
	
	var goList = function() {
		location.href = '${pageContext.request.contextPath}/admin/community/faq/faqListView';
	}
</script>


</head>
<body>


	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">커뮤니티 > FAQ > 등록</h3>
			<h5 class="page-header page-header-desc-ahope">FAQ를 등록합니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-7">
			
			<form class="form-horizontal" id="frm" name="frm" method="post">
			
				<input type="hidden" id="postYn" name="postYn" value="">
			
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">질문</label>
					<div class="col-sm-10">
						<input type="text" id="question" name="question" class="form-control" placeholder="title">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">답변</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="answer" name="answer" rows="7" placeholder="content"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 btn-center">
						<button type="button" class="btn btn-default" id="cancel_btn">취소</button>
						<button type="button" class="btn btn-ahope" id="insert_btn">등록</button>
						<button type="button" class="btn btn-info" id="insert_direct_btn">바로 게시</button>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	
</body>
</html>