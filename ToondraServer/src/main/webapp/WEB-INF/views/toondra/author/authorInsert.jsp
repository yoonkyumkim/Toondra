<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Author Insert</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.js" ></script>
<script type="text/javascript">
var addrCnt = 0;
var phoneCnt = 0;
$(document).ready(function(){
	if("${result}" == "success"){
		cAlert("등록 성공",function() {
			location.href="${pageContext.request.contextPath }/admin/author/authorListView";
		})
	} 
	add_addr();
	add_phone();
});


function author_listView() {
	location.href="${pageContext.request.contextPath }/admin/author/authorListView";
}

function add_addr() {
	var contents = "";
	addrCnt++;
	$("#addrCnt").val(addrCnt);
	
	contents += "<div id=\"address"+addrCnt+"\">"
				+ "<div class=\"form-group\">"
				+ "<label class=\"col-sm-2 control-label\">주소</label>"
				+ "<div class=\"col-sm-5\">"
				+ "	<input type=\"text\" maxlength=\"6\" id=\"zip_code"+addrCnt+"\" name=\"zip_code"+addrCnt+"\" class=\"form-control\">"
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
	if(addrCnt<=1){
		cAlert("하나이상의 주소가 필요합니다.");
		return;
	}
	addrCnt--;
	$("#addrCnt").val(addrCnt);
	$("#"+addr).remove();
}
function add_phone() {
	var contents ="";
	phoneCnt++;
	$("#phoneCnt").val(phoneCnt);
	contents += "<div id=\"phone"+phoneCnt+"\">"
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
	if(phoneCnt<=1){
		cAlert("하나 이상의 연락처가 필요합니다.");
		return;
	}
	phoneCnt--;
	$("#phoneCnt").val(phoneCnt);
	$("#"+phone).remove();
}
function idCheck(){
	if($("#author_id").val() == ''){
		cAlert("아이디를 입력하세요");
		$("#author_id").focus();
		return;
	}
	$("#author_form").ajaxForm({
		type : "POST"
		,async : "true"
		,url : "${pageContext.request.contextPath}/admin/author/idCheck"
		,dataType : "text"
		,cache : false
		,data : $("#author_form").serialize()
		,success : function(result) {
			$("#author_form").ajaxFormUnbind();
			var data = eval('('+ result +  ')');
			if(data.jsonData.result == "true") {
				cAlert("이미 존재하는 아이디 입니다.");
			} else{
				cAlert("사용가능");
				$("#id_chk").attr("value", 1);
			}
			
		}
	});
	$("#author_form").submit();
}

function author_create(){
	if($("#author_id").val() == ''){
		cAlert("아이디를 입력하세요");
			$("#author_id").focus();
		return;
	}
	if($("#id_chk").val() == '0'){
		cAlert("아이디 중복체크를 해주세요");
		$("#author_id").focus();
		return;
	}
	if($("#author_name").val() == ''){
		cAlert("작가명을 입력하세요");
		$("#author_name").focus();
		return;
	}else{
		var stringRegx = /[~!@\#$%<>^&*\()\-=+_\’]/gi; 
	    if(stringRegx.test($("#author_name").val())) {
			cAlert("작가명을 다시 입력해주세요");
			$("#author_name").focus();
			return false; 
	    } 
	}
	var ad = $('#postTable').find('input[type=text]')
	for(var i = 0; i<ad.length; i++) {
		if(ad[i].value.trim() == ''){
			cAlert("주소를 입력하셔야 합니다.");
			ad[i].focus();
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
		$("#email").val().focus();
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
			<h3 class="page-header page-header-ahope">작가 관리 > 작가 등록</h3>
			<h5 class="page-header page-header-desc-ahope">신규 작가를 등록합니다.</h5>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-7">
			<form class="form-horizontal" name="author_form" id="author_form" method="post" action="${pageContext.request.contextPath}/admin/author/insertAuthor">
				<input type="hidden" id="id_chk" value="0">
				<input type="hidden" name="addr_cnt" id="addrCnt">
				<input type="hidden" name="phone_cnt" id="phoneCnt">
				
				<div class="form-group">
					<label class="col-sm-2 control-label">작가 ID</label>
					<div class="col-sm-6">
						<input type="text" id="author_id" name="author_id" class="form-control" >
					</div>
						<a href="javascript:void(0)" class="btn btn-default" onclick="javascript:idCheck()">중복검사</a>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">작가명</label>
					<div class="col-sm-5">
						<input type="text" maxlength="15" id="author_name" name="author_name" class="form-control" >
					</div>
					<label class="col-sm-4 control-label" style="font-size: x-small;text-align: left;padding-left: 3px;">띄어쓰기 포함 최대 15자, 특수문자 불가</label>
				</div>
					
				<div id="postTable" class="form-horizontal">
					
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
						<input type="text" maxlength="30" id="email" name="email" class="form-control" >
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-2 control-label">은행 명</label>
					<div class="col-sm-5">
						<select class="form-control" name="bank_code_seq">
							<option value="0" selected="selected"></option>
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
						<input type="text" maxlength="30" id="depositor" name="depositor" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">계좌번호</label>
					<div class="col-sm-5">
						<input type="text" maxlength="20" id="account_num" name="account_num" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">대표 작품</label>
					<div class="col-sm-5">
						<input type="text" maxlength="200" id="major_work" name="major_work" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">비고</label>
					<div class="col-sm-8">
						<textarea class="form-control" maxlength="300"  id="remark" name="remark" rows="3"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 btn-center">
						<button type="button" class="btn btn-default" id="delete_btn" onclick="author_listView()">취소</button>
						<button type="button" class="btn btn-ahope" id="insert_btn" onclick="author_create()">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>