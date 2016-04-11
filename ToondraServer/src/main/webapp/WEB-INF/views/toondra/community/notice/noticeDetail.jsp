<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Notice</title>

<script type="text/javascript">
	$(function(){
		
		$('.btn-toggle').click(function() {
			$(this).find('.btn').toggleClass('active');
		    if ($(this).find('.btn-info').size()>0) {
		    	$(this).find('.btn').toggleClass('btn-info');
		    }
			$('#postYn').val($(this).find('.active').attr('postYn'));
		});
		
		$('#list_btn').click(function(){
			goList();
		});
		
		$('#update_btn').click(function(){

			var url = '${pageContext.request.contextPath}/admin/community/notice/updateNotice';
			var data = $('#frm').serialize();
			ajaxP(url, data, function (data) {
				if(data.result == false) {
					if(data.msg != '') {
						cAlert(data.msg);
					} else {
						cAlert("게시물 수정에 실패하였습니다.");
					}
				} else {
					cAlert("게시물을 수정하였습니다.", goList);
				}
			});
		});
		
		$('#delete_btn').click(function(){
			var url = '${pageContext.request.contextPath}/admin/community/notice/deleteNotice';
			var data = $('#frm').serialize();
			ajaxP(url, data, function (data) {
				if(data.result == false) {
					if(data.msg != '') {
						cAlert(data.msg);
					} else {
						cAlert("게시물 삭제에 실패하였습니다.");
					}
				} else {
					cAlert("게시물을 삭제하였습니다.", goList);
				}
			});
		});
		
	});
	
	var goList = function() {
		location.href = '${pageContext.request.contextPath}/admin/community/notice/noticeListView';
	}
</script>

</head>
<body>

	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">커뮤니티 > 공지사항 > 상세	</h3>
			<h5 class="page-header page-header-desc-ahope">공지사항을 확인하고 수정 가능합니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-7">
			
			<form class="form-horizontal" id="frm" name="frm" method="post">
			
				<input type="hidden" id="noticeSeq" name="noticeSeq" value="${noticeSeq}">
				<input type="hidden" id="noticeSeqStr" name="noticeSeqStr" value="${noticeSeq}">
				<input type="hidden" id="postYn" name="postYn" value="${postYn}">
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10 detail-content-ahope">
						${id}						
					</div>
				</div>
			
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" id="title" name="title" class="form-control" placeholder="title" value="${title}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="content" name="content" rows="7" placeholder="content">${content}</textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">상태</label>
					<div class="col-sm-10">
						<div class="btn-group btn-toggle">
							<button class="btn <c:if test="${postYn eq 'Y'}">btn-info active</c:if>" type="button" postYn="Y">게시 중</button>
							<button class="btn <c:if test="${postYn eq 'N'}">btn-info active</c:if>" type="button" postYn="N">게시중지</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 btn-center">
						<button type="button" class="btn btn-default" id="list_btn">목록</button>
						<button type="button" class="btn btn-ahope" id="update_btn">수정 저장</button>
						<button type="button" class="btn btn-ahope" id="delete_btn">삭제</button>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	
</body>
</html>