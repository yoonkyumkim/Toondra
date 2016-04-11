<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>SalesStatsList</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" >

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>

<script type="text/javascript">
var datepick = '<input type="hidden" class="span2" id="weekpicker" required="required" readonly="readonly" />';
var mode="";
var currentTime = new Date();
var currentYear = currentTime.getFullYear();
var currentMonth = currentTime.getMonth()+1;
var current = ""; 
var arr;
var cnt = 0;
var selectDate = new Date();
	$(function(){
		tableInit();
		var d = new Date();

		var s = dateFormat(d);
		$('#startDate').html(s);
		$("input[name='startRegDate']").val(s);
		
		current = s;
		switchDay(current);
		daypicker();
	    
		$('#excel_btn').click(function(){
			excelDown();
		});
		$('#dayBtn').click(function(){
			$('.active').removeClass('active');
			$('#dayBtn').addClass('active');
			daypicker();
		});
		$('#weekBtn').click(function(){
			$('.active').removeClass('active');
			$('#weekBtn').addClass('active');
			weekpicker();
		});
		$('#monthBtn').click(function(){
			$('.active').removeClass('active');
			$('#monthBtn').addClass('active');
			monthpicker();
		});
		
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
	function daypicker() {
		if(mode!="day" || mode=="") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$("#date").append(datepick);
			$("#weekpicker").datepicker({
				showOn: "both", 
				buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>',
		        maxDate: "today",
		        selectOtherMonths:true,
		        showOtherMonths : true,
				onSelect: function(dateText, inst) { 
					var date = $(this).datepicker('getDate');
		            var startDate = new Date(date);
		            selectDate = new Date(date);
		            var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
		            $('#startRegDate').val($.datepicker.formatDate( dateFormat, startDate, inst.settings ))
		            $('#endRegDate').val('');
		            switchDay($.datepicker.formatDate( dateFormat, startDate, inst.settings ));
		            bindTable();
				}
			});
            $('#startRegDate').val(current)
            $('#endRegDate').val('');
			mode="day";
			$("#weekpicker").datepicker('setDate', new Date(selectDate) );
			$(".ui-datepicker-current-day").click();
		}
		if(cnt == 0){
			cnt++;
			return;
		}
		$(".ui-datepicker-trigger").click();
	}
	function weekpicker(){
		if(mode!="week" || mode=="") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$("#date").append(datepick);
			var startDate;
		    var endDate;
		    
		    var selectCurrentWeek = function() {
		        window.setTimeout(function () {
		            $('#weekpicker').datepicker('widget').find('.ui-datepicker-current-day a').addClass('ui-state-active')
		            $('#weekpicker').datepicker('widget').find('.ui-datepicker-current-day span').addClass('ui-state-active')
	
		            $('.ui-datepicker-calendar tbody').on('mouseover', 'a', function() {
		            	$(this).parents('tr').find('a').addClass('ui-state-hover-ahope');
		            	$(this).parents('tr').find('span').addClass('ui-state-hover-ahope').parent().removeClass('ui-state-disabled');
		            });
		            
		            $('.ui-datepicker-calendar tbody').on('mouseleave', 'a', function() {
		            	$(this).parents('tr').find('a').removeClass('ui-state-hover-ahope');
		            	$(this).parents('tr').find('span').removeClass('ui-state-hover-ahope').parent().addClass('ui-state-disabled');
		            });
		        }, 1);
		    }
			$("#weekpicker").datepicker({
				showOn: "both", 
				buttonText: '<i class="fa fa-calendar cal-btn-ahope"></i>',
				//defaultDate: new Date(),
		        maxDate: "today",
		        selectOtherMonths:true,
		        showOtherMonths : true,
			    onSelect: function(dateText, inst) { 
		            var date = $(this).datepicker('getDate');
		            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
		            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
		            selectDate = new Date(dateText);
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
		    });
			mode="week";
			startDate = dateFormat(new Date(currentTime.getFullYear(), currentTime.getMonth(), currentTime.getDate() - currentTime.getDay()));
	        endDate = dateFormat(new Date(currentTime.getFullYear(), currentTime.getMonth(), currentTime.getDate() - currentTime.getDay() + 6));
	        switchWeek(startDate,endDate);
	        $("#weekpicker").datepicker('setDate',selectDate );
	        $(".ui-datepicker-current-day").click();
		}
		$(".ui-datepicker-trigger").click();
	}
	function monthpicker() {
		if(mode!="month" || mode=="") {
			$('#picker').empty();
			$('#picker').append('<div class="input-append date" id="date"></div>')
			$('#picker').append('<button type="button" class="ui-datepicker-trigger" id="btn_monthpicker"><i class="fa fa-calendar cal-btn-ahope"></i></button>')
			$("#date").append(datepick);
			
		    var year2 = parseInt(currentYear);
		    arr = new Array();
		    var m = currentTime.getMonth() + 1
		    if(selectDate.getFullYear() == currentYear) {
		    	for(var i = m; i < 12; i++){
			    	arr.push(i+1);
			    }
		    }
		    var op = {
					selectedYear:selectDate.getFullYear(),
					selectedMonth: selectDate.getMonth() + 1,
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
				selectDate = new Date($('#date').val());
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
		var disable = new Array();
	    for(var i = currentTime.getMonth() + 1; i < 12; i++){
	    	disable.push(i+1);
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
        $('.mtz-monthpicker-year').unbind();
        $('.mtz-monthpicker-year').change(function (){
        	if(this.value < currentYear) {
        		$("#date").monthpicker("disabledMonths",[]);
        	} else {
        		$("#date").monthpicker("disabledMonths",disable);
        		$.each(disable,function(index, value) {
    	        	$('.mtz-monthpicker-month[data-month="'+value +'"]').addClass('ui-state-disabled');
    	        });
        	}
        	if(this.value == selectDate.getFullYear()) {
        		$('.mtz-monthpicker-month[data-month="'+(selectDate.getMonth() + 1)+'"]').addClass('ui-state-active');
        	} else {
        		$('.ui-state-active').removeClass('ui-state-active');
        	}
        });
      	$('.mtz-monthpicker .ui-state-active').click();
        $(".ui-datepicker-trigger").click();
		
	}
	
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
			"sAjaxSource": "${pageContext.request.contextPath}/admin/stats/purchase/statsList" ,
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
	  							<button type="button" id="dayBtn" class="btn btn-default active">일별</button>
	  							<button type="button" id="weekBtn" class="btn btn-default">주간</button>
	  							<button type="button" id="monthBtn" class="btn btn-default">월간</button>
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