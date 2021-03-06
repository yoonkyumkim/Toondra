<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <% response.setContentType("text/html; charset=utf-8"); %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
$(document).ready(function() {
	
	if("${result}" == "success"){
		cAlert("등록 성공",function() {
			var work_seq = "${work_seq}";
			post_to_url("${pageContext.request.contextPath }/admin/content/contentListView",{'work_seq' : work_seq });
		})
	} 
	$("input[name=paid_yn]").change(function(){
		var radioValue = $(this).val();
		
		if(radioValue == 'Y') {
			$("#coin1").attr("disabled",false);
			$("#coin2").attr("disabled",false);
			$("#coin3").attr("disabled",false);
		}
		else {
			$("#coin1").attr("disabled",true);
			$("#coin2").attr("disabled",true);
			$("#coin3").attr("disabled",true);
		}
	});
	$("input[name=coin]").change(function() {
		var radioValue = $(this).val();
		if(radioValue == '0') {
			$("#insert_coin").attr("readonly",false);
		}
		else {
			$("#insert_coin").attr("readonly",true);
		}
	});

});



function content_listView() {
	var work_seq = "${work_seq}";
	post_to_url("${pageContext.request.contextPath }/admin/content/contentListView",{'work_seq' : work_seq });
}

function content_insert() {
	var form = document.getElementById("content_form");
	form.submit();
}
$.fn.multiFile = function(_options) {
	var _this = this;
	
	var totalSize = 0;

	var targetFileId = (typeof _options.targetFileId === 'undefined')? "ahopeFile": _options.targetFileId;
	var targetFileName = (typeof _options.targetFileName === 'undefined')? "ahopeFile": _options.targetFileName;
	
	var hiddenDivName = 'ahope_hidden_file_div';
	var showDivName = (typeof _options.fileListDivId === 'undefined')? "ahope_show_file": _options.fileListDivId;;

	var inputDivName = 'ahope_input_file_div';
	var inputFileName = 'ahope_input_file';
	var inputFileStr = '<input type="file" id="'+inputFileName+'" name="'+inputFileName+'">';
	
	$(this).append('<div id="'+hiddenDivName+'" style="display:none;"></div>');
	if(typeof $('#'+showDivName).html() === 'undefined') {
	}
	
	$('#fileInputBtn').click(function() {
		$('#'+inputFileName).remove();
		var inputFile = document.createElement("input");  
		inputFile.setAttribute('type', 'file');  
		inputFile.setAttribute('id', inputFileName);  
		inputFile.setAttribute('style', 'display: none;');
		inputFile.setAttribute('value', 'test');
	
		$('#fileUpload').append(inputFile);
		$('#'+inputFileName).bind('change', function() {
			
			_this.fileClickEvent(this);
			
		});
		$('#'+inputFileName).click()
	})
	var cnt = 0;
	var appendStr = "";
	var fileId = "";
	
	this.fileClickEvent = function(thisObj) {
		var _URL = window.URL || window.webkitURL;
		var file, img;
		file = thisObj.files[0] 
		var fileSize = thisObj.files[0].size / 1024;
		fileSize = (Math.round((fileSize/1024)*100)/100);
	    img = new Image();
	    img.onload = function() {
	    	if(this.width > 690) {
	    		cAlert("가로의 크기는 690px을 넘을 수 없습니다.");
	    		return;
	    	} else {
	    		var $_this = $(thisObj);
	    		var src = getFileExtension(thisObj);
	    		if (src == "") {
	    			cAlert('올바른 파일을 입력하세요');
	    	        return;
	    	    } else if ( !((src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg")) ) {
	    	        cAlert('gif 와 jpg 파일만 지원합니다.');
	    	        return;
	    	    }
	    		if(fileSize > 2) {
	    			cAlert("2MB 이상 파일은 올릴 수 없습니다.");
	    		} else {
	    	    	totalSize += fileSize;
	    			if(totalSize > 20) {
	    				cAlert("최대 업로드 용량을 초과하였습니다.");
	    				totalSize -= fileSize;
	    				return;
	    			}
	    	    	$('#fileSize').html(totalSize.toFixed(2)+'/20MB');
	    		}
	    		if($_this.val() != 'undefined' && $_this.val() != '') {

	    			fileId = targetFileId;
	    			$_this.attr('id',fileId).attr('name', targetFileName).appendTo('#'+hiddenDivName);
	    			$("#contentFiles").append('<option></option>');
	    			$('#contentFiles option:eq('+cnt+')').text($_this.val().split('\\').pop());
	    			cnt++;
	    		}
	    	}
	    };
	    img.onerror = function() {
	    	cAlert( "이미지 파일이 아닙니다. ");
	    };
	    img.src = _URL.createObjectURL(file);
		
	}
	
	$("#delFile").click(function() {
		var index = $("#contentFiles option").index($("#contentFiles option:selected"));
		$('#ahope_hidden_file_div').children().eq(index).remove();
		cnt--;
		$("#contentFiles option:selected").remove();
	});
	
	return this;
}

$(function(){
	
	$('#fileUpload').multiFile({
		fileListDivId:"showFile"
		, targetFileId:"upload_file"
		, targetFileName:"upload_file"
	});
	
});
function content_insert() {
	if($('#title').val().trim() == '') {
		cAlert('제목을 선택하세요');
		return;
	}
	if($('#content_order').val().trim() == '') {
		cAlert('순번을 선택하세요');
		return;
	}
	if(!$('input:radio[name="paid_yn"]').is(':checked')) {
		cAlert('유료 여부를 선택하세요')
		return;
	}
	if($('input[name=paid_yn]:checked').val() == 'Y'){
		if(!$('input[name=coin]').is(':checked')) {
			cAlert('코인을 선택하세요');
			return;
		}
		if($('input[name=coin]:checked').val() == '0' ) {
			if($('#insert_coin').val() == '') {
				cAlert('코인 값을 입력하세요')
				return;
			}
		}
	}
	if($('#contentFiles').children().length == 0) {
		cAlert("컨텐츠를 업로드 하세요");
		return;
	}
	
	$('#content_form').submit();
}

function getFileExtension( filePath )
{
	var path = filePath
    var lastIndex = -1;
    lastIndex = path.value.lastIndexOf('.');
    var extension = "";

if ( lastIndex != -1 )
{
    extension = path.value.substring( lastIndex+1, path.value.length );
} else {
    extension = "";
}
    return extension;
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Work Insert</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.js" ></script>
</head>
<body>
<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">컨텐츠 관리 > 컨텐츠 등록</h3>
			<h5 class="page-header page-header-desc-ahope">컨텐츠를 등록합니다.</h5>
		</div>
</div>
<div class="row">
	<div class="col-lg-9" >
		<form class="form-horizontal" id="content_form" name="content_form" action="${pageContext.request.contextPath}/admin/content/insertContent" method="post" enctype="multipart/form-data">
			<input type="hidden" name="work_seq" id="work_seq"  value="${authorList[0].work_seq }">
			<input type="hidden" name="imgWidth">
			<input type="hidden" name="imgHeight">
			<div class="form-group">
				<label class="col-sm-2 control-label">작품명</label>
				<div class="col-sm-5">
					<p class="form-control-static">${authorList[0].work_name }</p>
				</div>
			</div>
			<div>
				<c:forEach var="list" items="${authorList }">
					<div class="form-group">
						<label class="col-sm-2 control-label">작가ID/작가명</label>
						<div class="col-sm-5">
							<p class="form-control-static">${list.author_id } / ${list.author_name }</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" maxlength="200" name="title" id="title" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">순번</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" maxlength="3" name="content_order" id="content_order" >
				</div>
			</div>
			<div class="form-group">
			    <label class="col-sm-2 control-label">코인 설정</label>
			    <div class="col-sm-2">
			    	<input type="radio" name="paid_yn" id="paid_yn" value="N" >무료
			    	<input type="radio" name="paid_yn" id="paid_yn" value="Y" >유료
			    </div>
			    <div class="col-sm-3" style="width:205px;">
			    	<input type="radio" name="coin" id="coin1" value="2" disabled="disabled">2코인 
			    	<input type="radio" name="coin" id="coin2" value="3" disabled="disabled">3코인
			   		<input type="radio" name="coin" id="coin3" value="0" disabled="disabled">직접입력 
			    </div>
		    	<div class="col-sm-2">
		    		<input type="text" class="form-control" name="insert_coin" id="insert_coin" readonly="readonly">
		    	</div>
		    	코인
			</div>
			<div class="form-group">
		    	<label class="col-sm-2 control-label">썸네일 이미지</label>
		    	<div class="col-sm-4">
			    	<input type="file" class="form-control col-sm-5"  name="thumbnail_img_name" id="thumbnail_img_name">
		    	</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">서비스 상태</label>
				<div class="col-sm-3">
					<select class="form-control" name="service_state"  id="serivce_state" >
						<option value="Y">서비스중</option>
						<option value="N" selected="selected">서비스중지</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">컨텐츠 등록</label>
				<div class="col-sm-6" style="width:430px">
					<div class="fl">
						<select size="11" name="contentFiles" id="contentFiles" title="만화등록" class="commentSelect" style="width:421px;height:138px;">
															
						</select>
					</div>
					<div class="commentInfo">
						<div class="col-sm-3">
							<div id="fileUpload">
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2" style="height:140px;width:130px;">
					<div style="position:absolute;bottom:0;" >
						<div id="fileSize">
							0/20MB
						</div>
						<button type="button" class="btn btn-default" id="fileInputBtn" >작성</button>
						<button type="button" class="btn btn-default" id="delFile" >삭제</button>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-6" style="width:430px">
					<span>가로사이즈 690 픽셀 이하이며, 세로 사이즈는 제한 없습니다. 
					총 용량은 20MB이하이며, 파일 1개의 용량제한은 2MB입니다. 
					파일 형태는 gif, jpg입니다</span>
				</div>
			</div>
			<div class="form-horizontal" align="center">
				<div class="col-lg-offset-2 col-lg-10 btn-center">
					<button type="button" class="btn btn-default" id="list_btn" onclick="content_listView()">목록</button>
					<button type="button" class="btn btn-ahope" id="insert_btn" onclick="content_insert()">작성</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>