<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% response.setContentType("text/html; charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var	authorCnt = 0;
var genreCnt = 0;
$(document).ready(function(){
	
	if("${result}" == "success"){
		workSwitch(function() {
			location.href="${pageContext.request.contextPath }/admin/work/workListView";
		}, function() {
			var work_seq = "${work_seq}";
			post_to_url("${pageContext.request.contextPath }/admin/content/contentListView",{'work_seq' : work_seq });
		});
	} 
	<c:forEach items="${genreInfo}" var="item" >
		$("#genre_seq${item.genre_seq}").val("${item.genre_seq}");
	</c:forEach>
	<c:forEach items="${dayInfo}" var="item" >
		$('#day'+'${item.day}').attr('checked', true);
	</c:forEach>
	
});

function work_listView() {
	location.href="${pageContext.request.contextPath }/admin/work/workListView";
}

function add_author(){
	authorCnt++;
	$("#authorCnt").val(authorCnt);
	var contents = "";
	
	contents += "<div class=\"authorList\" id=\"author"+authorCnt+"\">";
	contents += "<div class=\"form-group\">";
	contents += "    <label class=\"col-sm-2 control-label\">작가ID</label>";
	contents += "    <input type=\"hidden\" class=\"authorSeq\" name=\"author_seq\" id=\"author_seq"+authorCnt+"\" >";
	contents += "	 <div class=\"col-lg-20\">";
	contents += "	 <div class=\"col-sm-3\">";
	contents += "    	<input type=\"text\" class=\"form-control\" id=\"author_id"+authorCnt+"\" placeholder=\"ID\" readonly=\"readonly\">";
	contents += "    </div>";
	contents += "    <div class=\"col-sm-2\" style=\"text-align:right;\">";
	contents += "    <label class=\"control-label\">작가 명</label>";
	contents += "    </div>";
	contents += "	 <div class=\"col-sm-3\">";
	contents += "    	<input type=\"text\" class=\"form-control\" id=\"author_name"+authorCnt+"\" placeholder=\"NAME\" readonly=\"readonly\">";
	contents += "    </div>";
	contents += "<a href=\"javascript:void(0)\" class=\"btn btn-default\" onclick=\"javascript:author_popup('"+authorCnt+"')\">검색</a>";
	contents += "<button id=\"del_author\" class=\"btn btn-default\" type=\"button\" style=\"margin-left: 4px;\">";
	contents += "	<i class=\"fa fa-minus-circle fa-lg minus-circle-ahope\"></i>";
	contents += "</button>";
	contents += "</div>";
	contents += "</div>";
	contents += "</div>";
	
	$("#author_list").append(contents);
}
function del_before_author(index) {
	var len = $("#author_list").find(".authorList");
	if(len.length <= 1) {
		cAlert("하나 이상의 작가가 필요합니다.");
		return;
	}	
	$("#author"+index).remove();
	$("#delAuthor"+index).val(index);
}

$(document).on('click','#del_author',function(){
	var len = $("#author_list").find(".authorList");
	if(len.length <= 1) {
		cAlert("하나 이상의 작가가 필요합니다.");
		return;
	}	
	authorCnt--;
	$("#authorCnt").val(authorCnt);
	$(this).parent().parent().parent().remove();
});


function add_genre() {
	genreCnt++;
	$("#genreCnt").val(genreCnt);
	var genre_seq = new Array();
	var genre_name = new Array();
	<c:forEach items="${genreList}" var="item" >
		genre_seq.push("${item.genre_seq}");
		genre_name.push("${item.genre_name}");
	</c:forEach>
	var contents = "";
	contents += "<div class=\"form-group\" id=\"genre"+genreCnt+"\">";
	contents += "	<label class=\"col-sm-2 control-label\">장르</label>";
	contents += "	<div class=\"col-sm-3\">"
	contents += "		<select class=\"form-control\" name=\"genre_seq\">";
	for(var i = 0 ; i <genre_seq.length; i++) {
	contents += "			<option value=\""+genre_seq[i]+"\">"+genre_name[i]+"</option>";
	}	
	contents += "		</select>"
	contents += "	</div>"
	contents += "	<button id=\"del_genre\" class=\"btn btn-default\"  type=\"button\" onclick=\"javascript:del_genre('"+genreCnt+"')\">"
	contents += "		<i class=\"fa fa-minus-circle fa-lg minus-circle-ahope\"></i>"
	contents += "	</button>"
	contents += "</div>"
	contents += "</div>"
	
	$("#genre_list").append(contents);
} 


$(document).on('click','#del_genre',function(){
	var len = $("#genre_list").find("select");
	if(len.length <= 1) {
		cAlert("하나 이상의 장르가 필요합니다.");
		return;
	}	
	genreCnt--;
	$("#genreCnt").val(genreCnt);
	$(this).parent().remove();
});



function del_before_genre(index) {
	var len = $("#genre_list").find("select");
	if(len.length <= 1) {
		cAlert("하나 이상의 장르가 필요합니다.");
		return;
	}	
	$("#genre"+index).remove();
	$("#delGenre"+index).val(index);
	
}
function author_popup(author_cnt){
	var url = "${pageContext.request.contextPath}/admin/work/popup/authorPopup?author_cnt=" + author_cnt;
	LeftPosition = (screen.width) ? (screen.width-600)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-280)/2 : 0;
	
	settings = 'height=345,width=400,top='+parseInt(TopPosition)+',left='+parseInt(LeftPosition)+',scrollbars=no';

	var popup = window.open(url, 'popup', settings);
	
	if (popup == null) {
		cAlert("팝업 차단 기능이 설정되어 있습니다. \n\n팝업을 허용해 주시고 다시 시도해 주세요");
	}
	popup.focus();
	
}

function work_update() {
	if($("#work_name").val() == ''){
		cAlert("작품명을 입력하세요");
			$("#work_name").focus();
		return;
	}
	var ad = $('#author_list').find('input[type=text]')
	for(var i = 0; i<ad.length; i++) {
		if(ad[i].value.trim() == ''){
			cAlert("작가를 선택하세요");
			ad[i].focus();
			return;
		}
	}
	
	if($('#work_desc').val() == ''){
		cAlert("작품 설명을 입력해주세요");
		$('#work_desc').focus();
		return;
	}
	var gen = $('#author_list').find('.authorSeq')
	for(var i = 0; i<gen.length-1; i++) {
		for(var j = i + 1; j < gen.length; j++) {
			if(gen[i].value == gen[j].value) {
				cAlert("같은 작가를 가질수 없습니다.");
				return;
			}
		}
	}
	var gen = $('#genre_list').find('select')
	for(var i = 0; i<gen.length-1; i++) {
		for(var j = i + 1; j < gen.length; j++) {
			if(gen[i].value == gen[j].value) {
				cAlert("같은 장르를 가질수 없습니다.");
				return;
			}
		}
	}
	var gen = $('#genre_list').find('select')
	for(var i = 0; i<gen.length-1; i++) {
		for(var j = i + 1; j < gen.length; j++) {
			if(gen[i].value == gen[j].value) {
				cAlert("같은 장르를 가질수 없습니다.");
				return;
			}
		}
	}
	var form = document.getElementById("work_form");
	form.submit();
}

function work_delete() {
	
	var msg = "작품을 삭제하시겠습니까?";
	cConfirm(msg, function(){
		var url = '${pageContext.request.contextPath}/admin/work/deleteWork';
		var workSeqStr = $("#work_seq").val();
		
		
		var data = 'workSeqStr='+workSeqStr;
		ajaxP(url, data, function (data) {
			if(data.result == false) {
				if(data.msg != '') {
					cAlert(data.msg);
				} else {
					cAlert("작품 삭제에 실패하였습니다.");
				}
			} else {
				cAlert("작품을 삭제하였습니다.", function() {
					location.href="${pageContext.request.contextPath}/admin/work/workListView"
				});
			}
		});
	});
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Work Detail</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.js" ></script>
</head>
<body>
<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">작품 관리 > 작품 상세</h3>
			<h5 class="page-header page-header-desc-ahope">작품 상세를 확인하고 수정 가능합니다.</h5>
		</div>
</div>
<div class="row">
	<div class="col-lg-7" >
		<form class="form-horizontal" id="work_form" name="work_form" action="${pageContext.request.contextPath}/admin/work/updateWork" method="post" enctype="multipart/form-data">
			<input type="hidden" name="work_seq" id="work_seq" value="${workInfo.work_seq }">
			<c:forEach var="delAuthor" items="${authorInfo }">
				<input type="hidden" name="del_author" id="delAuthor${delAuthor.author_seq }"  >
			</c:forEach>
			<c:forEach var="delGenre" items="${genreInfo }">
				<input type="hidden" name="del_genre" id="delGenre${delGenre.genre_seq }" >
			</c:forEach>
			<div class="form-group">
				<label class="col-sm-2 control-label">작품명</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" maxlength="30" name="work_name" id="work_name" value="${workInfo.work_name }">
				</div>
				<label class="col-sm-3 control-label" style="font-size: x-small;text-align: left;">띄어쓰기 포함 최대 30자</label>
			</div>
			<div class="form-horizontal" id="author_list">
				<c:forEach items="${authorInfo}" var="author">
					<input type="hidden" name="before_author_seq" id="before_author_seq" value="${author.author_seq }">
					<div class="authorList" id="author${author.author_seq }">
						<div class="form-group">
						    <label class="col-sm-2 control-label">작가ID</label>
					    	<input type="hidden" class="authorSeq" name="update_author_seq" id="author_seq${author.author_seq }" value="${author.author_seq }">
					    	<div class="col-lg-20">
						    	<div class="col-sm-3">
							    	<input type="text" class="form-control" maxlength="8" id="author_id${author.author_seq }" placeholder="ID" readonly="readonly" value="${author.author_id }">
						    	</div>
						    	<div class="col-sm-2" style="text-align:right;">
							   		<label class="control-label">작가 명</label>
						    	</div>
							   	<div class="col-sm-3">
							    	<input type="text" class="form-control" id="author_name${author.author_seq }" placeholder="NAME" readonly="readonly" value="${author.author_name }">
							   	</div>
								<a href="javascript:void(0)" class="btn btn-default" onclick="javascript:author_popup('${author.author_seq }')">검색</a>
								<button class="btn btn-default" type="button" onclick="javascript:del_before_author('${author.author_seq }')">
									<i class="fa fa-minus-circle fa-lg minus-circle-ahope"></i>
								</button>
					    	</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div >
				<label class="col-sm-2 control-label"></label>
				<button class="btn btn-info btn-circle"  type="button" onclick="add_author()">
					<i class="fa fa-plus"></i>
				</button>작가추가
			</div><br/>
			<div class="form-group">
				 <label class="col-sm-2 control-label">작품 설명</label>
			    <div class="col-sm-7">
			   		<input type="text" class="form-control" maxlength="100" id="work_desc" name="work_desc" value="${workInfo.work_desc }">
			    </div>
			    <label class="col-sm-3 control-label" style="font-size: x-small;text-align: left;">띄어쓰기 포함 최대 100자</label>
			</div>
			<div class="form-group" id="day_list">
			    <label class="col-sm-2 control-label">요일</label>
			    <div class="col-sm-7 detail-content-ahope">
			    	<input type="checkbox" name="day" id="day1" value="1">월
			    	<input type="checkbox" name="day" id="day2" value="2">화
			    	<input type="checkbox" name="day" id="day3" value="3">수
			    	<input type="checkbox" name="day" id="day4" value="4">목
			    	<input type="checkbox" name="day" id="day5" value="5">금
			    	<input type="checkbox" name="day" id="day6" value="6">토
			    	<input type="checkbox" name="day" id="day7" value="7">일
			    </div>
			</div>
			<div id="genre_list" >
				<c:forEach var="genreInfo" items="${genreInfo }">
					<input type="hidden" name="before_genre_seq" id="before_genre_seq" value="${genreInfo.genre_seq }">
					<div class="form-group" id="genre${genreInfo.genre_seq }">
							<label class="col-sm-2 control-label">장르</label>
							<div class="col-sm-3">
								<select class="form-control" name="update_genre_seq"  id="genre_seq${genreInfo.genre_seq }">
									<c:forEach var="genre" items="${genreList }">
										<option value="${genre.genre_seq }">${genre.genre_name }</option>
									</c:forEach>
								</select>
							</div>
							<button class="btn btn-default"  type="button" onclick="javascript:del_before_genre('${genreInfo.genre_seq }')">
								<i class="fa fa-minus-circle fa-lg minus-circle-ahope"></i>
							</button>
						</div>
				</c:forEach>
			</div>
			<div>
				<label class="col-sm-2 control-label"></label>
				<button class="btn btn-info btn-circle"  type="button" onclick="add_genre()">
					<i class="fa fa-plus"></i>
				</button>장르추가
			</div><br/>
			<div class="form-group">
		    	<label class="col-sm-2 control-label">썸네일 이미지</label>
		    	<div class="col-sm-2">
		    		<input type="hidden" name="before_thumbnail_img_name" id="before_thumbnail_img_name" value="${workInfo.thumbnail_img_name}">
		    		<img id="file" src="${workInfo.thumbnail_img_url}"  width="100px" height="80px" class="img-thumbnail"/>
		    	</div>
		    	<div class="col-sm-4">
			    	<input type="file" class="form-control col-sm-5"  name="thumbnail_img_name" id="thumbnail_img_name">
		    	</div>
		    	<label class="col-sm-3 control-label" style="font-size: x-small;text-align: left;">이미지 사이즈 202 x 164</label>
			</div>
			<div class="form-group">
			    <label class="col-sm-2 control-label">작품 완료</label>
			    <div class="col-sm-3 detail-content-ahope">
			  	<c:if test="${workInfo.fin_yn == 'Y'}">
			   		<input type="checkbox" name="fin_yn" id="fin_yn" value="Y" checked="checked">완료
			  	</c:if>
			  	<c:if test="${workInfo.fin_yn == 'N'}">
			   		<input type="checkbox" name="fin_yn" id="fin_yn" value="Y" >완료
			  	</c:if>
			    </div>
			</div>
			<div class="form-horizontal" align="center">
				<div class="col-lg-offset-2 col-lg-10 btn-center">
					<button type="button" class="btn btn-default" onclick="work_listView()">목록</button>
					<button type="button" class="btn btn-ahope" id="insert_btn" onclick="work_update()">수정</button>
					<button type="button" class="btn btn-ahope" id="delete_btn" onclick="work_delete()">삭제</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>