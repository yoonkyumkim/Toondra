function ajax(method, url, formData, callbackFun) {
	$.ajax({
		url:url,
		type:method,
		data:formData,
		success:function(result){
			callbackFun(result);
		},
		error:function(xhr,status,error)	{
			//TODO
		},
		beforeSend:function(xhr) {
			//TODO
		}
	});
}

function ajaxP(url, formData, callbackFun) {
	return ajax("POST", url, formData, callbackFun);
};

function ajaxG(url, formData, callbackFun) {
	return ajax("GET", url, formData, callbackFun);
};
function post_to_url(action, params) {
	var form = document.createElement("form");
	form.method = "post";
	form.action = action;
	
	for (var key in params) {
		var hiddenField = document.createElement("input");
		hiddenField.type = "hidden";
		hiddenField.name = key;
		hiddenField.value = params[key];
		
		form.appendChild(hiddenField);
	}
	
	document.body.appendChild(form);
	form.submit();
}

function valid(id, msg) {
	if($('#'+id).val() == '') {
		cAlert(msg);
		return false;
	}
	return true;
}

function replaceAll(str, searchStr, replaceStr) {
	return str.split(searchStr).join(replaceStr);
}