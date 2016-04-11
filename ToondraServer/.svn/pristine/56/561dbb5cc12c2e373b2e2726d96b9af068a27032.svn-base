function setCookie(cookieName ,value, saveday){
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + saveday);
	var cookieValue = escape(value) + ((saveday==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1 );
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
	cookieName = cookieName + "=";
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = "";
	
	if(start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1) end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}