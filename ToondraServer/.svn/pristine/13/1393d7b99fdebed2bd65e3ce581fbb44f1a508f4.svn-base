<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>GegnreList</title>

<script type="text/javascript">

	$(function(){
		
		var genreCnt = parseInt('${fn:length(genreList)}', 0);
		
		//추가 버튼 이벤트
		$("#plus_btn").click(function() {
			var plusInput = $('#plus_input_btn').clone();

			plusInput.attr('id', 'genre_div_'+genreCnt);
			plusInput.find(':input').attr('id', 'genre_'+genreCnt).attr('name', 'genre_name');
			plusInput.find(':button').attr('id', 'genre_remove_"'+genreCnt).attr('cnt', genreCnt).attr('onclick', 'removeEvnet(this)');
			++genreCnt;
			
			$('#genre_list').append(plusInput);
			plusInput.show();
		});
		
		//확인 버튼 이벤트
		$('#submit_btn').click(function(){
			var url = "${pageContext.request.contextPath}/admin/service/updateGenre";
			var data = "genreInfos=";
			
			var genreFlag = true;
			$('input[name="genre_name"]').each(function(idx){
				if($(this).val() == '') {
					genreFlag = false;
					$(this).focus();
					return false;
				}
				
				if(idx > 0) {
					data += ","
				}
				data += $(this).val()+'|'+ ((typeof $(this).attr('genre_seq') === 'undefined')?'':$(this).attr('genre_seq'));
			});
			if(!genreFlag) {
				cAlert("장르 정보를 입력해 주세요.");
				return false;
			}
			
			ajaxP(url, data, function(data){
				if(data.result == false) {
					if(data.msg != '') {
						cAlert(data.msg);
					} else {
						cAlert("장르정보 적용에 실패하였습니다.");
					}
				} else {
					cAlert("장르정보가 적용되었습니다.");
				}
			});
		});
	});
	
	function removeEvnet(_this){
		var genreCnt = $(_this).attr('cnt');
		$('#genre_div_'+genreCnt).remove();
	}
</script>


</head>
<body>


<form onsubmit="return false;" >
	
	<div class="form-group" style="display: none;" id="plus_input_btn">
		<div class="input-group">
			<input type="text" class="form-control">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">
					<i class="fa fa-minus-circle fa-lg minus-circle-ahope"></i>
				</button>
			</span>
		</div>
	</div>

	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">서비스 장르</h3>
			<h5 class="page-header page-header-desc-ahope">장르를 관리합니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-7">
			<div class="panel panel-default">
			
				<!-- /.panel-heading -->
				<div class="panel-heading">
					이 페이지를 벗어나면 마지막 저장 후 수정된 내용은 저장되지 않습니다. 
				</div>
				
				<!-- /.panel-body -->
				<div class="panel-body">
					<div id="genre_list" class="form-group">
						<c:forEach items="${genreList}" var="gerne" varStatus="status" >
							<div class="form-group" id="genre_div_${status.index}">
								<div class="input-group">
									<input type="text" class="form-control" id="genre_${status.index}" name="genre_name" value="${gerne.genreName}" genre_seq="${gerne.genreSeq}">
									<span class="input-group-btn">
										<button class="btn btn-default" id="genre_remove_${status.index}" cnt="${status.index}" type="button" onclick="removeEvnet(this)">
											<i class="fa fa-minus-circle fa-lg minus-circle-ahope"></i>
										</button>
									</span>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<div style="text-align: right;">
						<button type="button" id="plus_btn" class="btn btn-info btn-circle">
							<i class="fa fa-plus"></i>
						</button>
						장르 추가
					</div>
					
					<div style="text-align: center;">
						<button type="button" id="submit_btn" class="btn btn-ahope">
							수정 저장
						</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
</form>
</body>
</html>