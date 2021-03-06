<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Notice</title>

<script type="text/javascript">

	$(function(){
		
		$('#cancel_btn').click(function(){
			goList();
		});
		
		$('#insert_btn').click(function(){
			insertNotice('N');
		});
		
		$('#insert_direct_btn').click(function(){
			insertNotice('Y');
		});
		
	});
	
	function insertNotice(postYn){
		$('#postYn').val(postYn);
		var url = '${pageContext.request.contextPath}/admin/community/notice/insertNotice';
		var data = $('#frm').serialize();
		ajaxP(url, data, function (data) {
			if(data.result == false) {
				if(data.msg != '') {
					cAlert(data.msg);
				} else {
					cAlert("공지사항 등록에 실패하였습니다.");
				}
			} else {
				cAlert("공지사항을 등록하였습니다.", goList);
			}
		});
	}

	var goList = function() {
		location.href = '${pageContext.request.contextPath}/admin/community/notice/noticeListView';
	}
</script>


</head>
<body>


	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">커뮤니티 > 공지사항 > 등록</h3>
			<h5 class="page-header page-header-desc-ahope">공지사항을 등록합니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-7">
			
			<form class="form-horizontal" id="frm" name="frm" method="post">
			
				<input type="hidden" id="postYn" name="postYn" value="">
			
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" id="title" name="title" class="form-control" placeholder="title">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="content" name="content" rows="7" placeholder="content"></textarea>
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