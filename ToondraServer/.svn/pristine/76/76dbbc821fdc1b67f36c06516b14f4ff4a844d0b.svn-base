<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인</title>
	</head>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ahope.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.2.min.js"></script>
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ahope.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cookie.js"></script>
    
	<script type="text/javascript">
		function login(){
			if($("#id").val() == "") {
				cAlert("아이디를 입력하세요");
				return;
			}
			if($("#password").val() == "") {
				cAlert("비밀번호를 입력하세요");
				return;
			}
			saveId();
			
			var url = $('#loginForm').attr('action');
			var data = $('#loginForm').serialize();
			ajaxP(url, data, function(data){
				if(data.result == false) {
					cAlert("아이디 또는 비밀번호가 틀립니다.");
				} else {
					location.href = "${pageContext.request.contextPath }/admin";
				}
			});
		}
	
		$(function(){
			getLogin();
			
			$("#id").keydown(function(e) {
				if (e.keyCode == 13) {
					login();
				}		
			});
			
			$("#password").keydown(function(e) {
				if (e.keyCode == 13) {
					login();
				}		
			});
		});
	
	  	function setsave(name, value, expiredays) {
	        var today = new Date();
	        today.setDate(today.getDate() + expiredays);
	        document.cookie = name + "=" + escape(value) + "; path=/; expires="
	                + today.toGMTString() + ";";
	        
	    }
	    
	    function saveId(){
	        if (document.getElementById("idSaveCheck").checked) {
	            saveLogin(document.getElementById("id").value);
	        } else {
	            saveLogin("");
	        }
	    }

	    function saveLogin(id) {
	        if (id != "") {
	            // userid 쿠키에 id 값을 7일간 저장
	            setsave("id", id, 7);
	        } else {
	            // userid 쿠키 삭제
	            setsave("id", id, -1);
	        }
	    }
	    
	    function getLogin() {
	        
	        var cook = document.cookie + ";";
	        var idx = cook.indexOf("id", 0);
	        var val = "";

	        if (idx != -1) {
	            cook = cook.substring(idx, cook.length);
	            begin = cook.indexOf("=", 0) + 1;
	            end = cook.indexOf(";", begin);
	            val = unescape(cook.substring(begin, end));
	        }

	        if (val != "") {
	            document.getElementById("id").value = val;
	            document.getElementById("idSaveCheck").checked = true;
	            $("#password").focus();
	        } else {
	        	$("#id").focus();
	        }
	    }

	    function cAlert(msg, func) {
			$('#ahopeAlertMsg').html(msg);
			$('#ahopeAlert').on('hide.bs.modal', function (e) {
				if(typeof func !== 'undefined')	func();
			});
			$('#ahopeAlert').modal('show');
		}
	    
	</script>
<body>
	
	
	<!-- alert -->
	<div class="modal fade alert-ahope" id="ahopeAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header alert-header-ahope">
					<h4 class="modal-title" id="myModalLabel">확 인</h4>
				</div>
				<div class="modal-body alert-body-ahope" id="ahopeAlertMsg"></div>
				<div class="modal-footer btn-center">
					<button type="button" class="btn btn-ahope" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="login-bg">
		<div class="container">
		
			<form class="form-signin" id="loginForm" method="post" action="${pageContext.request.contextPath }/admin/login/loginDo">
				<h1 class="form-signin-heading login-title-ahope">Toondra Admin</h1>
				<input type="text" class="form-control" name="id" id="id" placeholder="id">
				<input type="password" class="form-control" name="password" id="password" placeholder="password" >
				<input type="button" class="btn btn-lg btn-ahope btn-block" onclick="login()" value="Log In">
				<div class="login-save-id">
					<input type="checkbox" id="idSaveCheck" > SAVE ID
				</div>
			</form>
		
		</div>
	</div>

</body>
</html>