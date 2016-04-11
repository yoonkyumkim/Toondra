<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>ContentList</title>

<style type="text/css">
.on-mouse {
	background-color: #eeeeee;
}
.on-click {
	background-color: #006dcc;
	  background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
	  background-image: -ms-linear-gradient(top, #0088cc, #0044cc);
	  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
	  background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
	  background-image: -o-linear-gradient(top, #0088cc, #0044cc);
	  background-image: linear-gradient(top, #0088cc, #0044cc);
	  background-repeat: repeat-x;
	  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088cc', endColorstr='#0044cc', GradientType=0);
	  border-color: #0044cc #0044cc #002a80;
	  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	  color: #fff;
	  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.standalone.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" >

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>

<script type="text/javascript">
var datepick = '<input type="hidden" class="span2" id="weekpicker" required="required" readonly="readonly" />';
var mode="";
var currentTime = new Date();
var currentYear = currentTime.getFullYear();
var currentMonth = currentTime.getMonth()+1;
var current = ""; 
var arr;
	$(function(){
		var d = new Date();

		var s = dateFormat(d);
		$('#startDate').html(s);
		$("input[name='startRegDate']").val(s);
		
		switchDay(s);
		current = s;
	    
		$('#excel_btn').click(function(){
			excelDown();
		});
		$('#dayBtn').click(function(){
			daypicker();
		});
		$('#weekBtn').click(function(){
			weekpicker();
		});
		$('#monthBtn').click(function(){
			monthpicker();
		});
		/* $('#testBtn').click(function(){
			testpicker();
		});
		$('#testBtn2').click(function(){
			testpicker2();
		});
		$('#testBtn3').click(function(){
			testpicker3();
		}); */
		
		tableInit();
	});
	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
		
		if (n.length < digits) {
		  for (i = 0; i < digits - n.length; i++)
		    zero += '0';
		}
		return zero + n;
	}
	function dateFormat(date) {
		var d = new Date(date);
		var result;
		result =
		leadingZeros(d.getFullYear(), 4) + '-' +
		leadingZeros(d.getMonth() + 1, 2) + '-' +
		leadingZeros(d.getDate(), 2);
		return result;
	}
	
	/* function testpicker() {
		if(mode!="test" || mode=="") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>');
			$('#date').append('<input type="hidden" class="span2" id="weekpicker" readonly="readonly">&nbsp<span class="add-on"><i class="fa fa-calendar cal-btn-ahope"></i></span>');
			$("#date").datetimepicker({
				format : "yyyy-mm-dd",
				endDate: "today",
			}).on('changeDate', function(){
				var date = new Date($('#weekpicker').val());
				var s =
					leadingZeros(date.getFullYear(), 4) + '-' +
					leadingZeros(date.getMonth() + 1, 2) + '-' +
					leadingZeros(date.getDate(), 2);
				$('#startRegDate').val(s);
				$('#endRegDate').val('');
				switchTest(s);
				bindTable();
		    });
			mode="test";
		}
		$('.add-on').click();
	}
	function testpicker2(){
		 var selectCurrentWeek = function() {
		        window.setTimeout(function () {
		        	
		        	$('.datepicker-days tbody').on('mouseover', 'td', function() {
		        		$(this).parents('tr').find('td').addClass('on-mouse');
		        	});
		        	$('.datepicker-days tbody').on('mouseleave', 'td', function() {
		        		$(this).parents('tr').find('td').removeClass('on-mouse');
		        	});
		        	$('.datepicker-days tbody').on('click', 'td', function() {
		        		//alert("click");
		        		//$('.datepicker-days tbody').find('td').removeClass('on-click');
		        		$(this).parents('tr').find('td').addClass('on-click');
		        	});
		            
		        }, 1);
		 }
		if(mode!="test2") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$('#date').append('<input type="hidden" class="span2" id="weekpicker" readonly="readonly">&nbsp<span class="add-on"><i class="fa fa-calendar cal-btn-ahope"></i></span>')
			var startDate;
		    var endDate;
		   
			$("#date").datetimepicker({
				format : "yyyy-mm-dd",
				endDate: "today",
		        beforeShow: function() {
		            selectCurrentWeek();
		        },
		        beforeShowDay: function(date) {
		            var cssClass = '';
		            if(date >= startDate && date <= endDate)
		                cssClass = 'active';
		            
		            return [true, cssClass];
		        },
		    }).on('changeDate', function(e){
		    	console.log(e);
		    	console.log(this);
		    	
		    	
		    	
		    	
	            var date = new Date($('#weekpicker').val());
	            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
	            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
	            var s =
					leadingZeros(startDate.getFullYear(), 4) + '-' +
					leadingZeros(startDate.getMonth() + 1, 2) + '-' +
					leadingZeros(startDate.getDate(), 2);
				$('#startRegDate').val(s);
				var e =
					leadingZeros(endDate.getFullYear(), 4) + '-' +
					leadingZeros(endDate.getMonth() + 1, 2) + '-' +
					leadingZeros(endDate.getDate(), 2);
				$('#endRegDate').val(e);
				switchTest2(s,e);
	            bindTable();
		});
		mode="test2";
		}
		$('.add-on').click();
		selectCurrentWeek();
	} */
	

	function daypicker() {
		if(mode!="day" || mode=="") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$("#date").append(datepick);
			$("#weekpicker").datepicker({
				showOn: "both", 
				buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>',
				defaultDate: new Date(),
		        maxDate: "today",
		        selectOtherMonths:true,
		        showOtherMonths : true,
				onSelect: function(dateText, inst) { 
					var date = $(this).datepicker('getDate');
		            startDate = new Date(date);
		            var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
		            $('#startRegDate').val($.datepicker.formatDate( dateFormat, startDate, inst.settings ))
		            $('#endRegDate').val('');
		            switchDay($.datepicker.formatDate( dateFormat, startDate, inst.settings ));
		            bindTable();
				}
			});
            $('#startRegDate').val(current)
            $('#endRegDate').val('');
            switchDay(current);
			mode="day";
			$(".ui-datepicker-today").click();
		}
		$(".ui-datepicker-trigger").click();
	}
	function weekpicker(){
		if(mode!="week") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$("#date").append(datepick);
			var startDate;
		    var endDate;
		    
		    var selectCurrentWeek = function() {
		        window.setTimeout(function () {
		            $('#weekpicker').datepicker('widget').find('.ui-datepicker-current-day a').addClass('ui-state-active')
	
		            $('.ui-datepicker-calendar tbody').on('mouseover', 'a', function() {
		            	$(this).parents('tr').find('a').addClass('ui-state-hover-ahope');
		            	$(this).parents('tr').find('span').addClass('ui-state-hover-ahope').parent().removeClass('ui-state-disabled');
		            });
		            
		            $('.ui-datepicker-calendar tbody').on('mouseleave', 'a', function() {
		            	$(this).parents('tr').find('a').removeClass('ui-state-hover-ahope');
		            	$(this).parents('tr').find('span').removeClass('ui-state-hover-ahope').parent().addClass('ui-state-disabled');
		            });
					/* $(".ui-datepicker-calendar tbody").on('click', 'a', function () {
						alert($(this).parents('tr').find('a').length);
						$(this).parents('tr').find('a').addClass('ui-state-active');
					}); */
		            
		        }, 1);
		    }
			$("#weekpicker").datepicker({
				showOtherMonths: false,
			    selectOtherMonths: false,
				showOn: "both", 
				buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>',
				defaultDate: new Date(),
		        maxDate: "today",
		        selectOtherMonths:true,
		        showOtherMonths : true,
			    onSelect: function(dateText, inst) { 
		            var date = $(this).datepicker('getDate');
		            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
		            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
		            var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
		            $('#startRegDate').val($.datepicker.formatDate( dateFormat, startDate, inst.settings ));
		            $('#endRegDate').val($.datepicker.formatDate( dateFormat, endDate, inst.settings ));
		            switchWeek($.datepicker.formatDate( dateFormat, startDate, inst.settings), $.datepicker.formatDate( dateFormat, endDate, inst.settings ));
		            selectCurrentWeek();
		            bindTable();
		        },
		        beforeShow: function() {
		            selectCurrentWeek();
		        },
		        beforeShowDay: function(date) {
		            var cssClass = '';
		            if(date >= startDate && date <= endDate)
		                cssClass = 'ui-datepicker-current-day';
		            
		            return [true, cssClass];
		        },
		        onChangeMonthYear: function(year, month, inst) {
		            selectCurrentWeek();
		        }
		    }).datepicker('widget').addClass('ui-weekpicker');
			mode="week";
			startDate = dateFormat(new Date(currentTime.getFullYear(), currentTime.getMonth(), currentTime.getDate() - currentTime.getDay()));
	        endDate = dateFormat(new Date(currentTime.getFullYear(), currentTime.getMonth(), currentTime.getDate() - currentTime.getDay() + 6));
	        switchWeek(startDate,endDate);
	        $(".ui-state-highlight").click();
		}
		$(".ui-datepicker-trigger").click();
	}
	function monthpicker() {
		if(mode!="month" || mode=="") {
			$('#date').unbind();
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$('#picker').append('<button type="button" class="ui-datepicker-trigger" id="btn_monthpicker"><i class="fa fa-calendar cal-btn-ahope"></i></button>')
			$("#date").append(datepick);
			
		    var year2 = parseInt(currentYear);
		    arr = new Array();
		    var m = currentTime.getMonth() + 1
		    for(var i = m; i < 12; i++){
		    	arr.push(i+1);
		    }
		    var op = {
					selectedYear:currentYear,
					selectedMonth: currentTime.getMonth() + 1,
					pattern: 'yyyy-mm',
					finalYear: year2,
					monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					disabledMonths : arr
		        };
		    $("#date").monthpicker(op);
			mode="month";
			$('#date').monthpicker().on('monthpicker-click-month', function (e, month) {
				$('#startRegDate').val($('#date').val());
				$('#endRegDate').val('');
				switchMonth($('#date').val());
				bindTable();
			});
			var m =
			leadingZeros(currentTime.getFullYear(), 4) + '-' +
			leadingZeros(currentTime.getMonth() + 1, 2);
			switchMonth(m);
	        $.each(arr,function(index, value) {
	        	$('.mtz-monthpicker-month[data-month="'+value +'"]').addClass('ui-state-disabled');
	        });
		}
		$('#btn_monthpicker').click(function () {
	        $('#date').monthpicker('show');
	    });
		$('.mtz-monthpicker tbody').not('.ui-state-disabled').on('mouseover', 'td', function() {
        	$(this).not('.ui-state-disabled').addClass('ui-state-hover-ahope');
        });
        $('.mtz-monthpicker tbody').not('.ui-state-disabled').on('mouseleave', 'td', function() {
        	$(this).not('.ui-state-disabled').removeClass('ui-state-hover-ahope');
        });
        $('.mtz-monthpicker-year').change(function (){
        	if($("select").val() <currentTime.getFullYear()) {
        		$("#date").monthpicker("disabledMonths",[]);
        	} else {
        		$("#date").monthpicker("disabledMonths",arr);
        		$.each(arr,function(index, value) {
    	        	$('.mtz-monthpicker-month[data-month="'+value +'"]').addClass('ui-state-disabled');
    	        });
        	}
        });
        $(".ui-datepicker-trigger").click();
		
	}
	/* function monthpicker(){
		if(mode != "month") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$('#date').append('<input type="hidden" class="span2" id="weekpicker" readonly="readonly">&nbsp<span class="add-on"><i class="fa fa-calendar cal-btn-ahope"></i></span>')
			$("#date").datetimepicker({
				format : "yyyy-mm",
				minViewMode: 1,
				endDate: "today",
			}).on('changeDate', function(){
				$('#startRegDate').val($('#weekpicker').val());
				$('#endRegDate').val('');
				switchMonth($('#weekpicker').val());
				bindTable();
		    });
			mode="month";
		}
		$('.add-on').click();
	} */
	
	//목록 테이블 이벤트
	var oTable;
	function tableInit() {
		oTable = $("#stats_list").dataTable({
			"aoColumnDefs": [
			                 	{
				                	"sDefaultContent": "",
				                	"aTargets": [ "_all" ]
								}
			               ],
			"bLengthChange": true,
   			"bFilter":false,
   			"sPaginationType": "bootstrap",
   			"order": [],
   			"bLengthChange" : false,
   			"bProcessing": true,
   			"oLanguage": {
				"sInfo" : "",
				"sInfoEmpty" : ""
			},
   			"bServerSide": true,
			"aoColumns": [
					{"bSortable": false, "sClass": "center"},
					{ "mDataProp": "amount", "bSortable": false, "sClass": "center" }
			],
			"sAjaxSource": "${pageContext.request.contextPath}/admin/stats/statsList" ,
			"sServerMethod": "GET",
			"fnServerParams": function ( aoData ) {
				aoData.push( { "name":"startRegDate", "value":$("#startRegDate").val()} );
				aoData.push( { "name":"endRegDate", "value":$("#endRegDate").val()} );
			},
			"fnDrawCallback": function( oSettings) {
			},
			"fnCreatedRow": function (nRow, aData, iDataIndex) {
				var totalCnt = oTable.fnSettings().fnRecordsTotal();
				var startIndex = oTable.fnSettings()._iDisplayStart;
				$(nRow).find('td').css({'vertical-align' : 'middle'});
				$(nRow).find('td').eq(0).html(startIndex+iDataIndex + 1);
				$("#sales").html(aData.total);
			},
			"fnServerData": function ( sSource, aoData, fnCallback ) {
	            $.getJSON( sSource, aoData, function (json) { 
	                fnCallback(json);
	                if(json.iTotalRecords == 0) {
	                	$("#sales").html("0");
	                	
	                }
	            });
			}
		});
	}
	function excelDown(){
		var startRegDate = $("input[name='startRegDate']").val();
		var endRegDate = $("input[name='endRegDate']").val();
		post_to_url("${pageContext.request.contextPath}/admin/stats/statsExcel",{startRegDate:startRegDate,endRegDate:endRegDate});
	}
	
	function bindTable() {
		var startRegDate = $("input[name='startRegDate']").val();
		var endRegDate = $("input[name='endRegDate']").val();
		$('#startDate').html(startRegDate);
		if(endRegDate != "") {
			$('#endDate').html(' ~ '+ endRegDate);
		} else {
			$('#endDate').html('');
		}
		oTable.fnDestroy();
		tableInit();
		oTable.fnSettings()._iDisplayStart = 0;
	}
	/* function switchTest(da) {
		$('#switchDate').html(da);
		$('#prevBtn').unbind();
		$('#prevBtn').bind('click',function() {
			var date = new Date(da);
			date.setDate(date.getDate()-1);
			$("#weekpicker").datetimepicker("setDate", date);
			$('.day .active').click();
		});
		$('#nextBtn').unbind();
		$('#nextBtn').bind('click',function() {
			var date = new Date(da);
			date.setDate(date.getDate()+1);
			$("#weekpicker").datetimepicker("setDate", date);
			$('.day .active').click();
		});
	}
	function switchTest2(start, end) {
		$('#switchDate').html(start + " ~ " + end);
		$('#prevBtn').unbind();
		$('#prevBtn').bind('click',function() {
			var date = new Date(start);
			date.setDate(date.getDate()-7);
			$("#weekpicker").datetimepicker("setDate", date);
			$('.day .active').click();
		});
		$('#nextBtn').unbind();
		$('#nextBtn').bind('click',function() {
			var date = new Date(end);
			date.setDate(date.getDate()+7);
			$("#weekpicker").datetimepicker("setDate", date);
			$('.day .active').click();
		});
	} */
	function switchDay(da) {
		$('#switchDate').html(da);
		$('#prevBtn').unbind();
		$('#prevBtn').bind('click',function() {
			var date = new Date(da);
			date.setDate(date.getDate()-1);
			$("#weekpicker").datepicker("setDate", date);
			$('.ui-datepicker-current-day').click();
		});
		$('#nextBtn').unbind();
		$('#nextBtn').bind('click',function() {
			var date = new Date(da);
			date.setDate(date.getDate()+1);
			$("#weekpicker").datepicker("setDate", date);
			$('.ui-datepicker-current-day').click();
		});
	}
	function switchWeek(start, end) {
		$('#switchDate').html(start + " ~ " + end);
		$('#prevBtn').unbind();
		$('#prevBtn').bind('click',function() {
			var date = new Date(start);
			date.setDate(date.getDate()-7);
			$("#weekpicker").datepicker("setDate", date);
			$('.ui-datepicker-current-day:first').click();
		});
		$('#nextBtn').unbind();
		$('#nextBtn').bind('click',function() {
			var date = new Date(end);
			date.setDate(date.getDate()+7);
			$("#weekpicker").datepicker("setDate", date);
			$('.ui-datepicker-current-day:last').click();
		});
	}
	function switchMonth(month) {
		var Day = new Date(month);
		var startDay = month + "-01";
		var lastDay = new Date( Day.getYear(), Day.getMonth() + 1, "");
		var endDay = month + "-" + lastDay.getDate();
		$('#switchDate').html(startDay + " ~ " + endDay);
		$('#prevBtn').unbind();
		$('#prevBtn').bind('click',function() {
			var date = new Date(month);
			date.setMonth(date.getMonth()-1);
			var year = date.getFullYear();
			var mon = date.getMonth()+1;
			if(year < 2005) {
				return;
			}
			$("#date").monthpicker("setValue", {
				pattern: 'yyyy-mm',
				selectedMonth: mon,
				selectedYear :year,
			});
			if(year < currentYear){
				$("#date").monthpicker("disabledMonths",[]);
			}
			$('.mtz-monthpicker td').removeClass('ui-state-active');
			$('.mtz-monthpicker-year').val(year);
			$('.mtz-monthpicker td[data-month="'+mon+'"]').addClass('ui-state-active');
			$('.mtz-monthpicker .ui-state-active').click();
		});
		$('#nextBtn').unbind();
		$('#nextBtn').bind('click',function() {
			var date = new Date(month);
			date.setMonth(date.getMonth()+1);
			var year = date.getFullYear();
			var mon = date.getMonth()+1;
			
			$("#date").monthpicker("setValue", {
				pattern: 'yyyy-mm',
				selectedMonth: mon,
				selectedYear :year
			});
			if(year == currentYear){
				$("#date").monthpicker("disabledMonths",arr);
			}
			if(mon < currentMonth+1 || year < currentYear) {
				$('.mtz-monthpicker td').removeClass('ui-state-active');
				$('.mtz-monthpicker-year').val(year);
				$('.mtz-monthpicker td[data-month="'+mon+'"]').addClass('ui-state-active');
				$('.mtz-monthpicker .ui-state-active').click();
			}
		});
	}
	
	
</script>


</head>
<body>


<form id="frm" name="frm" method="post" >
	
	<input type="hidden" id="work_seq" name="work_seq" value="${workInfo.work_seq }">
	<input type="hidden" id="content_seq" name="content_seq" value="">
	<input type="hidden" id="startRegDate" name="startRegDate">
	<input type="hidden" id="endRegDate" name="endRegDate">
	
	<!-- Title -->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header page-header-ahope">통계 > 매출 통계</h3>
			<h5 class="page-header page-header-desc-ahope">매출 통계 내역을 볼 수 있습니다.</h5>
		</div>
	</div>

	<!-- Main -->
	<div class="row">
		<div class="col-lg-12">
		
			<!-- Searchbox -->
			
			<div id="filter-panel" class="filter-panel collapse in" style="height: auto;">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="navbar-form" role="search">
							<div class="col-sm-3" style="width:200px">
	  							<button type="button" id="dayBtn" class="btn btn-default">일별</button>
	  							<button type="button" id="weekBtn" class="btn btn-default">주간</button>
	  							<button type="button" id="monthBtn" class="btn btn-default">월간</button>
	  							<!-- <button type="button" id="testBtn" class="btn btn-default">임시</button>
	  							<button type="button" id="testBtn2" class="btn btn-default">임시2</button>
	  							<button type="button" id="testBtn3" class="btn btn-default">임시3</button>
	  							<input type="text" class="monthPick" > -->
							</div>
							<div class="col-sm-3">
								<div id="picker">
									<div class="input-append date" id="date">
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<a href="#" id="prevBtn"><i class="glyphicon glyphicon-menu-left"></i></a>&nbsp
								<strong id="switchDate"></strong>&nbsp
								<a href="#" id="nextBtn"><i class="glyphicon glyphicon-menu-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
						
			<div>
				<div class="btn-right">
						<button type="button" class="btn btn-default" id="excel_btn">Excel 다운로드</button>
				</div>		
			</div>
		
			
			<!-- list table -->
			<table id="stats_list" class="table">
				<caption>
					<strong id="startDate"></strong><strong id="endDate"></strong>&nbsp매출액 : <strong id="sales"></strong>  원
				</caption>
	     			<!-- list table header -->
				<thead id="sms-list-title" style="height:1px;">
					<tr>
						<th scope="col" style="width:20%"><strong>순위</strong></th>
						<th scope="col" style="width:70%"><strong>회원</strong></th>
					</tr>
				</thead>
			</table>
			
		</div>
	</div>
	
</form>
</body>
</html>