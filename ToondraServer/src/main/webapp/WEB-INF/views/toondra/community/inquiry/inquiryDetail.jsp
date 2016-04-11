<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<title>Inquiry</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">

	$(function(){

		$('#list_btn').click(function(){
			goList();
		});
		
		$('#answer_btn').click(function(){
			answerInquiry();
		});
		
	});
	
	function answerInquiry(){
		var url = '${pageContext.request.contextPath}/admin/community/inquiry/answerInquiry';
		var data = $('#frm').serialize();
		ajaxP(url, data, function (data) {
			if(data.result == false) {
				if(data.msg != '') {
					cAlert(data.msg);
				} else {
					cAlert("답변 등록에 실패하였습니다.");
				}
			} else {
				cAlert("답변을 등록하였습니다.", goList);
			}
		});		
	}
	
	var goList = function() {
		location.href = '${pageContext.request.contextPath}/admin/community/inquiry/inquiryListView';
	}
</script>


</head>
<body>

	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">커뮤니티 > 문의 답변 > 상세 
			</h3>
			<h5 class="page-header page-header-desc-ahope">회원이 문의한 상세 내용입니다. <c:if test="${answerYn eq 'N'}">답변을 보낼 수 있습니다. </c:if></h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-7">
			
			<form class="form-horizontal" id="frm" name="frm" method="post">
			
				<input type="hidden" id="inquirySeq" name="inquirySeq" value="${inquirySeq}">

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10 detail-content-ahope">
						${email}
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">등록일</label>
					<div class="col-sm-10 detail-content-ahope">
						${regDate}
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">문의유형</label>
					<div class="col-sm-10 detail-content-ahope">
						${categoryCodeName}
					</div>
				</div>
								
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10 detail-content-ahope">
						<c:out value="${fn:replace(content, newLineChar, '<br>')}" escapeXml="false"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">관리자 답변</label>
					<div class="col-sm-10">
						<c:choose>
							<c:when test="${answerYn eq 'N'}">
								<textarea class="form-control" id="answer" name="answer" rows="7" placeholder="answer">${answer }</textarea>
							</c:when>
							<c:otherwise>
								<c:out value="${fn:replace(answer, newLineChar, '<br>')}" escapeXml="false"/>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 btn-center">
						<button type="button" class="btn btn-default" id="list_btn">목록</button>
						<c:if test="${answerYn eq 'N'}">
							<button type="button" class="btn btn-ahope" id="answer_btn">보내기</button>
						</c:if>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	
</body>
</html>