<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<title>Push</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">

	$(function(){

		$("#sendDate").datepicker({
			showOn: "both", 
			buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>'
		});
		
		$('#list_btn').click(function(){
			goList();
		});
		
		$('#now_btn').click(function(){
			var date = new Date();

			var month = date.getMonth()+1;
			var day = date.getDate();
			var hour = date.getHours();
			
			var minutes = date.getMinutes();

			var output = date.getFullYear() + '-' +
			    (month<10 ? '0' : '') + month + '-' +
			    (day<10 ? '0' : '') + day;
			
			$('#sendDate').val(output);
			$('#sendHH').val((hour<10 ? '0' : '')+hour);
			$('#sendMM').val((minutes<10 ? '0' : '')+minutes);
		});
		
		$('#update_btn').click(function(){
			updatePush();
		});
		
		$('#delete_btn').click(function(){
			deletePush();
		})
	});
	
	function validChk() {

		if(!valid('title','제목을 입력해 주세요.')){return false;};
		if(!valid('content','내용을 입력해 주세요.')){return false;};
		if(!valid('sendDate','알림 날짜를 설정을 해 주세요.')){return false;};
		if(!valid('sendHH','알림 시간을 설정을 해 주세요.')){return false;};
		if(!valid('sendMM','알림 분을 설정을 해 주세요.')){return false;};

		var inputDate = new Date($('#sendDate').val() + " " + $('#sendHH').val()+":"+$('#sendMM').val()+":59");
		var nowDate = new Date();

		if(inputDate < nowDate) {
			cAlert("현재시간 이후로 선택해 주세요.");
			return false;
		}
		
		return true;
	}
	
	//push 입력
	function updatePush(){
		if(validChk()){
			$('#sendDateTime').val($('#sendDate').val() + " " + $('#sendHH').val()+":"+$('#sendMM').val()+":00");
			var url = '${pageContext.request.contextPath}/admin/community/push/updatePush';
			var data = $('#frm').serialize();
			ajaxP(url, data, function (data) {
				if(data.result == false) {
					if(data.msg != '') {
						cAlert(data.msg);
					} else {
						cAlert("알림 수정에 실패하였습니다.");
					}
				} else {
					cAlert("알림을 수정하였습니다.", goList);
				}
			});
		}
	}

	function deletePush(){
		var url = '${pageContext.request.contextPath}/admin/community/push/deletePush';
		var data = $('#frm').serialize();
		ajaxP(url, data, function (data) {
			if(data.result == false) {
				if(data.msg != '') {
					cAlert(data.msg);
				} else {
					cAlert("알림 삭제에 실패하였습니다.");
				}
			} else {
				cAlert("알림을 삭제하였습니다.", goList);
			}
		});		
	}
	
	var goList = function() {
		location.href = '${pageContext.request.contextPath}/admin/community/push/pushListView';
	}
</script>


</head>
<body>


	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">커뮤니티 > 알림 관리 > 상세 
			</h3>
			<h5 class="page-header page-header-desc-ahope">알림 상세 내역입니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-7">
			
			<form class="form-horizontal" id="frm" name="frm" method="post">
			
				<input type="hidden" id="pushSeq" name="pushSeq" value="${pushSeq}">
				<input type="hidden" id="pushSeqStr" name="pushSeqStr" value="${pushSeq}">
				<input type="hidden" id="sendDateTime" name="sendDateTime" value="">
			
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">등록일</label>
					<div class="col-sm-10 detail-content-ahope">
						${regDate}
					</div>
				</div>
		
			<c:if test="${sendState ne '00'}">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">알림일</label>
					<div class="col-sm-10 detail-content-ahope">
						${sendDateTime}
					</div>
				</div>
			</c:if>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<c:choose>
							<c:when test="${sendState eq '00'}">
								<input type="text" id="title" name="title" class="form-control" placeholder="title" value="${title }">
							</c:when>
							<c:otherwise>
								<div class="detail-content-ahope">
									${title }
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<c:choose>
							<c:when test="${sendState eq '00'}">
								<textarea class="form-control" id="content" name="content" rows="3" placeholder="content">${content }</textarea>
							</c:when>
							<c:otherwise>
								<div class="detail-content-ahope">
									<c:out value="${fn:replace(content, newLineChar, '<br>')}" escapeXml="false"/>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			<c:if test="${sendState eq '00'}">
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">알림 설정</label>
					<div class="col-sm-10">
						<input type="text" id="sendDate" name="sendDate" class="form-control input-ahope-wd-sm inline-ahope " value="${sendDate}">
						<select id="sendHH" name="sendHH" class="form-control input-ahope-wd-sm inline-ahope ">
							<c:forEach begin="0" end="23" varStatus="status" step="1">
								<fmt:formatNumber value="${status.index }" minIntegerDigits="2" var="sendhh"/>
								<option value="${sendhh }" <c:if test="${sendhh eq sendHH}">selected</c:if>>${sendhh}시</option>
							</c:forEach>
						</select>
						<select id="sendMM" name="sendMM" class="form-control input-ahope-wd-sm inline-ahope ">
							<c:forEach begin="0" end="59" varStatus="status" step="1">
								<fmt:formatNumber value="${status.index }" minIntegerDigits="2" var="sendmm"/>
								<option value="${sendmm }" <c:if test="${sendmm eq sendMM}">selected</c:if>>${sendmm}분</option>
							</c:forEach>
						</select>
						<button type="button" class="btn btn-default" id="now_btn">현재시간</button>
					</div>
				</div>
			</c:if>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 btn-center">
						<button type="button" class="btn btn-default" id="list_btn">목록</button>
					<c:if test="${sendState eq '00'}">
						<button type="button" class="btn btn-ahope" id="update_btn">수정 저장</button>
						<button type="button" class="btn btn-ahope" id="delete_btn">삭제</button>
					</c:if>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	
</body>
</html>