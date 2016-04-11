<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% response.setContentType("text/html; charset=utf-8"); %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Author Update</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#bank_code_seq").val("${authorInfo.bank_code_seq}");
	if("${result}" == "success"){
		cAlert("수정 성공", function() {
			location.href="${pageContext.request.contextPath }/admin/author/authorListView";
		});
	} 
	
});
var addrCnt = 0;
var phoneCnt = 0;
function author_listView() {
	location.href="${pageContext.request.contextPath }/admin/author/authorListView";
}

function add_addr(index) {
	var contents = "";
	addrCnt++;
	$("#addrCnt").val(addrCnt);
	
	contents += "<div class=\"addrList\" id=\"address"+addrCnt+"\">"
			+ "<div class=\"form-group\">"
			+ "<label class=\"col-sm-2 control-label\">주소</label>"
			+ "<div class=\"col-sm-5\">"
			+ "	<input type=\"text\" maxlength=\"6\" id=\"zip_code"+addrCnt+"\" name=\"zip_code"+addrCnt+"\" class=\"form-control\" >"
			+ "</div>"
			+ "	<a href=\"javascript:void(0)\" class=\"btn btn-default\" onclick=\"javascript:post_popup('"+addrCnt+"')\">우편번호검색</a>"
			+ "</div>"
			+ "<div class=\"form-group\">"
			+ "	<label class=\"col-sm-2 control-label\"></label>"
			+ "	<div class=\"col-sm-8\">"
			+ "		<input type=\"text\" maxlength=\"50\" id=\"addr"+addrCnt+"\" name=\"addr"+addrCnt+"\" class=\"form-control\" >"
			+ "	</div>"
			+ "</div>"
			+ "<div class=\"form-group\">"
			+ "	<label class=\"col-sm-2 control-label\"></label>"
			+ "	<div class=\"col-sm-8\">"
			+ "		<input type=\"text\" maxlength=\"100\" id=\"detail_addr"+addrCnt+"\" name=\"detail_addr"+addrCnt+"\" class=\"form-control\" >"
			+ "	</div>"
			+ "		<button class='btn btn-default' type='button' onclick=\"javascript:del_addr('address"+addrCnt+"')\">"
			+ "			<i class='fa fa-minus-circle fa-lg minus-circle-ahope'></i>"
			+ "		</button>"
			+ "</div>"
			+ "</div>";
	
	$("#postTable").append(contents);
}
function del_addr(addr){
	var len = $("#postTable").find(".addrList");
	if(len.length <= 1) {
		cAlert("하나 이상의 주소가 필요합니다.");
		return;
	}	
	addrCnt--;
	$("#addrCnt").val(addrCnt);
	$("#"+addr).remove();
	
}
function del_addrList(addr){
	var len = $("#postTable").find(".addrList");
	if(len.length <= 1) {
		cAlert("하나 이상의 주소가 필요합니다.");
		return;
	}	
	$("#addrList"+addr).remove();
	
	$("#delAddrList"+addr).val(addr);
}
function add_phone() {
	var contents ="";
	phoneCnt++;
	$("#phoneCnt").val(phoneCnt);
	
	contents += "<div class=\"phoneList\" id=\"phone"+phoneCnt+"\">"
			+ "<div class=\"form-group\">"
			+ "	<label class=\"col-sm-2 control-label\">연락처</label>"
			+ "	<div class=\"col-sm-5\">"
			+ "		<input type=\"text\" maxlength=\"11\" id=\"phone_num"+phoneCnt+"\" name=\"phone_num"+phoneCnt+"\" class=\"form-control\" >"
			+ "	</div>"
			+ "		<button class='btn btn-default' type='button' onclick=\"javascript:del_phone('phone"+phoneCnt+"')\">"
			+ "			<i class='fa fa-minus-circle fa-lg minus-circle-ahope'></i>"
			+ "		</button>"
			+ "</div>"
			+ "</div>";

	
	$("#phoneTable").append(contents);
}
function del_phone(phone){
	var len = $("#phoneTable").find(".phoneList");
	if(len.length <= 1) {
		cAlert("하나 이상의 연락처가 필요합니다.");
		return;
	}	
	phoneCnt--;
	$("#phoneCnt").val(phoneCnt);
	$("#"+phone).remove();
}
function del_phoneList(phone){
	var len = $("#phoneTable").find(".phoneList");
	if(len.length <= 1) {
		cAlert("하나 이상의 연락처가 필요합니다.");
		return;
	}	
	$("#phoneList"+phone).remove();
	$("#delPhoneList"+phone).val(phone);
}

function author_update(){
	var ad = $('#postTable').find('input[type=text]')
	for(var i = 0; i<ad.length; i++) {
		if(ad[i].value.trim() == ''){
			cAlert("주소를 입력하셔야 합니다.");
			ad[i].focus();
			return;
		}
	}
	var zip = $('#postTable').find('input[maxlength=6]')
	for(var i = 0; i<zip.length; i++) {
		if(zip[i].value.trim().length < 6) {
			cAlert("우편번호의 길이가 짧습니다.");
			zip[i].focus();
			return;
		}
		if(isNaN(parseInt(zip[i].value.trim()))){
			cAlert("우편번호는 숫자만 입력 가능합니다");
			return;
		}
	}
	var ph = $('#phoneTable').find('input[type=text]')
	for(var i = 0; i<ph.length; i++) {
		if(ph[i].value.trim() == ''){
			cAlert("연락처를 입력 해주세요.");
			ph[i].focus();
			return;
		}
		if(isNaN(parseInt(ph[i].value.trim()))){
			cAlert("연락처는 숫자만 입력 가능합니다.");
			return;
		}
	}
	
	if($("#email").val() == ''){
		cAlert("이메일을 입력하세요");
		return;
	}
	if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($("#email").val())) {
		cAlert("이메일 주소 형식이 맞지 않습니다. 다시 확인해 주세요.");
		$("#email").focus();
		return;
	}
	var form = document.getElementById("author_form");
	form.submit();
}

function author_delete(author_seq) {
	
	var msg = "작가를 삭제하시겠습니까?";
	cConfirm(msg, function(){
		post_to_url("${pageContext.request.contextPath }/admin/author/deleteAuthor",{'del_list' : author_seq });
	});
}



function post_popup(addr_cnt){
	var url = "${pageContext.request.contextPath}/admin/author/popup/postPopup?addr_cnt=" + addr_cnt;
	LeftPosition = (screen.width) ? (screen.width-600)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-280)/2 : 0;

	settings = 'height=450,width=460,top='+parseInt(TopPosition)+',left='+parseInt(LeftPosition)+',scrollbars=no';

	var popup = window.open(url, 'popup', settings);
	
	if (popup == null) {
		cAlert("팝업 차단 기능이 설정되어 있습니다. \n\n팝업을 허용해 주시고 다시 시도해 주세요");
	}
	popup.focus();
}
</script>
</head>
<body>
<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">작가 관리 > 작가 상세</h3>
			<h5 class="page-header page-header-desc-ahope">등록된 작가 정보를 확인하고  수정 가능합니다.</h5>
		</div>
	</div>
<div class="row">
	<div class="col-lg-7">
		<form class="form-horizontal" id="author_form" method="post" action="${pageContext.request.contextPath}/admin/author/updateAuthor">
			<input type="hidden" name="addr_cnt" id="addrCnt">
			<input type="hidden" name="phone_cnt" id="phoneCnt">
			<input type="hidden" name="author_seq" id="author_seq" value="${authorInfo.author_seq }">
			<c:forEach var="list" items="${addrList }">
				<input type="hidden" name="del_addr_list" id="delAddrList${list.addr_seq}" >
			</c:forEach>
			<c:forEach var="list" items="${phoneList }">
				<input type="hidden" name="del_phone_list" id="delPhoneList${list.phone_num_seq}" >
			</c:forEach>
			<div class="form-group">
				<label class="col-sm-2 control-label">등록일</label>
				<div class="col-xs-10 col-sm-7 form-text board-context">
					<p class="form-control-static">${authorInfo.reg_date }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">작가 ID</label>
				<div class="col-xs-10 col-sm-7 form-text board-context">
					<p class="form-control-static">${authorInfo.author_id }</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">작가명</label>
				<div class="col-xs-10 col-sm-7 form-text board-context">
					<p class="form-control-static">${authorInfo.author_name }</p>
				</div>
			</div>
					
	
			<div id="postTable" class="form-horizontal">
			 	<c:forEach var="list" items="${addrList }" > 
					<div class="addrList" id="addrList${list.addr_seq }">
						<div class="form-group">
							<label class="col-sm-2 control-label">주소<input type="hidden" name="addr_seq" value="${list.addr_seq }"></label>
								<div class="col-sm-5">
									<input type="text" maxlength="6" class="form-control" name="update_zip_code${list.addr_seq }" id="zip_code${list.addr_seq }" value="${list.zip_code}">
								</div>
								<a href="javascript:void(0)" class="btn btn-default" onclick="javascript:post_popup('${list.addr_seq}')">우편번호검색</a>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-8">
								<input type="text" class="form-control" maxlength="50" name="update_addr${list.addr_seq }" id="addr${list.addr_seq }" value="${list.addr }" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-8">
								<input type="text" class="form-control" maxlength="100" name="update_detail_addr${list.addr_seq }" id="detail_addr${list.addr_seq }" value="${list.detail_addr }" >
							</div>
							
							<button class='btn btn-default' type='button'  onclick="javascript:del_addrList('${list.addr_seq }')">
								<i class='fa fa-minus-circle fa-lg minus-circle-ahope'></i>
							</button>
						</div>
					</div>
				</c:forEach> 
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
					<div class="col-xs-10 col-sm-7 form-text board-context">
						<button class="btn btn-info btn-circle"  type="button" onclick="add_addr()">
							<i class="fa fa-plus"></i>
						</button>
						주소추가
					</div>
			</div>
			<div id="phoneTable" class="form-horizontal">
				<c:forEach var="list" items="${phoneList }">
					<div class="phoneList" id="phoneList${list.phone_num_seq }" >
						<div class="form-group">
							<label class="col-sm-2 control-label">연락처<input type="hidden" name="phone_num_seq" value="${list.phone_num_seq }"></label>
							<div class="col-sm-5">
								<input type="text" maxlength="11" class="form-control" name="update_phone_num${list.phone_num_seq }" id="phone_num${list.phone_num_seq }" value="${list.phone_num }">
							</div>
							
							<button class='btn btn-default' type='button'  onclick="javascript:del_phoneList('${list.phone_num_seq }')">
								<i class='fa fa-minus-circle fa-lg minus-circle-ahope'></i>
							</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
					<div class="col-xs-10 col-sm-7 form-text board-context">
						<button class="btn btn-info btn-circle"  type="button" onclick="add_phone()">
							<i class="fa fa-plus"></i>
						</button>
						연락처 추가
					</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-5">
					<input type="text" id="email" name="email" class="form-control" value="${authorInfo.email }" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">은행 명</label>
				<div class="col-sm-3">
					<select class="form-control" name="bank_code_seq" id="bank_code_seq">
						<option value="0"></option>
						<option value="1">국민은행</option>
						<option value="2">농협</option>
						<option value="3">우리은행</option>
						<option value="4">SC은행</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">예금주</label>
				<div class="col-sm-5">
					<input type="text" maxlength="30" id="depositor" name="depositor" class="form-control" value="${authorInfo.depositor }" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">계좌번호</label>
				<div class="col-sm-5">
					<input type="text" maxlength="20" id="account_num" name="account_num" class="form-control" value="${authorInfo.account_num }" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">대표 작품</label>
				<div class="col-sm-5">
					<input type="text" maxlength="200" id="major_work" name="major_work" class="form-control" value="${authorInfo.major_work }" >
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">비고</label>
				<div class="col-sm-8">
					<textarea class="form-control" maxlength="300" id="remark" name="remark" rows="3">${authorInfo.remark }</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10 btn-center">
					<button type="button" class="btn btn-default" id="list_btn" onclick="author_listView()">목록</button>
					<button type="button" class="btn btn-ahope" id="delete_btn" onclick="author_update()">수정</button>
					<button type="button" class="btn btn-ahope" id="insert_btn" onclick="author_delete('${author_seq }')">삭제</button>
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</html>