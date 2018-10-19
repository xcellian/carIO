<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>차량 입/출차 등록</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/carIo.css?ver=112'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/js/jquery-ui-1.12.1/jquery-ui.min.css'/>" />
<script type="text/javascript" src="/js/jquery-3.2.1/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/jqueryBlockUI/jquery.blockUI.js"></script>
<script type="text/javaScript" defer="defer">
$(document).ready(function(){
	
	var carHtml = [
		'<td style="border-bottom: 1px solid #afafaf;"><span id="carNo"></span></td>',
		'<td style="border-bottom: 1px solid #afafaf;"><span id="carInDtm"></span></td>',
		'<td style="border-bottom: 1px solid #afafaf;"><span id="duration"></span></td>',
		'<td style="border-bottom: 1px solid #afafaf;"><span id="sttlTm"></span></td>',
		'<td style="border-bottom: 1px solid #afafaf;"><span id="amount"></span></td>',
		'<td style="border-bottom: 1px solid #afafaf;"><span id="perm"></span></td>',
		'<td><a class="button red btnNor" title="출차등록" id="regCarOut">출차</a></td>'
	];
	
	// 미출차 차량 검색
	$('#getCarInfo').click(function(){
		
		$('#tbCarList tbody tr').remove();
		$('#tbCarList').css('display', 'none');
		
		if(!$.trim($('#carNoOut').val())){
			alert('차량번호를 입력해 주십시오.');
			return false;
		}
		
		$.ajax({
			url       : '<c:url value="/car"/>',
			type      : 'POST',
			dataType  : 'json',
			data      : {'carNo': $.trim($('#carNoOut').val())},
			beforeSend: function(){
				$.blockUI({ css: { 
					border                 : 'none', 
					padding                : '15px', 
					backgroundColor        : '#000', 
					'-webkit-border-radius': '10px', 
					'-moz-border-radius'   : '10px', 
					opacity                : .5, 
					color                  : '#fff',
					'font-size'            : '10px'
				} }); 
			},
			success   : function(response, status, xhr){
				if (response.carList) {
					$('#carNoOut').val('');
					
					if(response.carList.length > 0) {
						$('#tbCarList').css('display', 'inline-block');
					}
					else {
						alert('차량 정보가 존재하지 않습니다.');
					}
					
					$(response.carList).each(function(idx, val){
						
						var $elemList = $('<tr/>', {
							'html': carHtml.join('')
						}).appendTo('#tbCarList');
						
//						$elemList.find('#carNo').text(val.CAR_NO);
//						$elemList.find('#carInDtm').text(val.IN_DTM);
//						$elemList.find('#duration').text(val.DURATION);
//						$elemList.find('#sttlTm').text(val.STTL_TM);
//						$elemList.find('#amount').text(val.AMOUNT);
//						$elemList.find('#perm').text(val.IS_PERM);
//						if (val.IN_DTM) {
//							$elemList.find('#regCarOut').click(function(){
//								fnRegCarOut(val.SEQ);
//							});
//						}
//						else {
//							$elemList.find('#regCarOut').remove();
//						}

						$elemList.find('#carNo').text(val.CAR_NO? decodeURIComponent(escape(window.atob(val.CAR_NO))): '');
						$elemList.find('#carInDtm').text(val.IN_DTM? decodeURIComponent(escape(window.atob(val.IN_DTM))): '');
						$elemList.find('#duration').text(val.DURATION);
						$elemList.find('#sttlTm').text(val.STTL_TM);
						$elemList.find('#amount').text(val.AMOUNT);
						$elemList.find('#perm').text(val.IS_PERM? decodeURIComponent(escape(window.atob(val.IS_PERM))): '');
						if (val.IN_DTM) {
							$elemList.find('#regCarOut').click(function(){
								fnRegCarOut(val.SEQ);
							});
						}
						else {
							$elemList.find('#regCarOut').remove();
						}
					});
				}
				else {
					alert('차량 정보 조회에 실패했습니다.');
				}
			},
			error     : function(xhr, status, error){
				alert('차량 정보 조회에 실패했습니다.');
			},
			complete  : function(xhr, status){
				$.unblockUI();
			}
		});
	});
	
	// 출차 정보 등록
	var fnRegCarOut = function(seq){
		
		$.ajax({
			url       : '<c:url value="/out"/>',
			type      : 'POST',
			dataType  : 'json',
			data      : {'seq': seq},
			beforeSend: function(){
				$.blockUI({ css: { 
					border                 : 'none', 
					padding                : '15px', 
					backgroundColor        : '#000', 
					'-webkit-border-radius': '10px', 
					'-moz-border-radius'   : '10px', 
					opacity                : .5, 
					color                  : '#fff',
					'font-size'            : '10px'
				} }); 
			},
			success   : function(response, status, xhr){
				if (response.message == 'SUCCESS') {
					$('#tbCarList tbody tr').remove();
					$('#tbCarList').css('display', 'none');
					alert('출차 정보를 등록하였습니다.');
				}
				else {
					alert('출차 정보 등록에 실패했습니다.');
				}
			},
			error     : function(xhr, status, error){
				alert('출차 정보에 실패했습니다.');
			},
			complete  : function(xhr, status){
				$.unblockUI();
			}
		});
	};
	
	//입차 정보 등록
	$('#regCarIn').click(function(){
		
		if(!$.trim($('#carNoIn').val())){
			alert('차량번호를 입력해 주십시오.');
			return false;
		}
		
		if(!confirm($.trim($('#carNoIn').val()) + ' 차량을 등록합니다.')) {
			return false;
		}
		
		$.ajax({
			url       : '<c:url value="/in"/>',
			type      : 'POST',
			dataType  : 'json',
			data      : {'carNo': $.trim($('#carNoIn').val())},
			beforeSend: function(){
				$.blockUI({ css: { 
					border                 : 'none', 
					padding                : '15px', 
					backgroundColor        : '#000', 
					'-webkit-border-radius': '10px', 
					'-moz-border-radius'   : '10px', 
					opacity                : .5, 
					color                  : '#fff',
					'font-size'            : '10px'
				} }); 
			},
			success   : function(response, status, xhr){
				if (response.message == 'SUCCESS') {
					if (response.perm) {
						alert('입차 정보를 등록하였습니다. \n\n정기권 차량입니다.');
					}
					else {
						alert('입차 정보를 등록하였습니다.');
					}
					$('#carNoIn').val('');
				}
				else {
					alert('입차 정보 등록에 실패했습니다.');
				}
			},
			error     : function(xhr, status, error){
				alert('입차 정보 등록에 실패했습니다.');
			},
			complete  : function(xhr, status){
				$.unblockUI();
			}
		});
	});
	
	$('#carNoIn').keypress(function(e){
		if (e.keyCode == 13){
			$('#regCarIn').click();
		}
	});
	
	$('#carNoOut').keypress(function(e){
		if (e.keyCode == 13){
			$('#getCarInfo').click();
		}
	});
});
</script>
</head>

<body>
<div class="tabset">
	<!-- Tab 1 -->
	<input type="radio" name="tabset" id="tab1" aria-controls="in" checked>
	<label for="tab1">입차 등록</label>
	<!-- Tab 2 -->
	<input type="radio" name="tabset" id="tab2" aria-controls="out">
	<label for="tab2">출차 등록</label>
	
	<div class="tab-panels">
		<section id="in" class="tab-panel">
			<input type="text" id="carNoIn" name="carNoIn" autocomplete="off" />
			<a class="button blue btnNor" title="입차등록" id="regCarIn">입차</a>
		</section>
		<section id="out" class="tab-panel">
			<input type="text" id="carNoOut" name="carNoOut" autocomplete="off" />
			<a class="button blue btnNor" title="조회" id="getCarInfo">조회</a>
			<br/>
			<div style="display: inline-block; position: relative; width: 100%; margin-top: 30px;">
				<table class="inner" id="tbCarList" style="display:none;">
					<colgroup>
						<col width="80"/>
						<col width="150"/>
						<col width="90"/>
						<col width="90"/>
						<col width="90"/>
						<col width="90"/>
						<col width="80"/>
					</colgroup>
					<thead>
						<tr>
							<th style="border-bottom: 1px solid #afafaf;">차량번호</th>
							<th style="border-bottom: 1px solid #afafaf;">입차시간</th>
							<th style="border-bottom: 1px solid #afafaf;">주차시간(분)</th>
							<th style="border-bottom: 1px solid #afafaf;">정산시간(분)</th>
							<th style="border-bottom: 1px solid #afafaf;">요금(원)</th>
							<th style="border-bottom: 1px solid #afafaf;">정기권여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</section>
	</div>
</div>

</body>
</html>