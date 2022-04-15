<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.resSignUpDiv{
		width:1200px;
		margin:0 auto;
		margin-top:100px;
		height:1700px;
	}
	.resSignUpDiv input{
		background-color:inherit;
		border:none;
		border-bottom:1px solid black;
		box-sizing:border-box;
		height:30px;
		margin-bottom:20px;
	}
	.topText{
		font-size:1.5em;
		
	}
	.text{
		font-size:1em;
		font-weight:normal;
	}
	span{
		font-size:1.2em;
		font-weight:bold;
		margin-bottom:20px;
		display:inline-block;
	}
	button{
		background-color:#ddd;
		border:none;
		width:100px;
	}
	button:hover{
		box-shadow:0px 0px 5px 1px;
	}
	#conputerImg{
		width:50%;
		position:relative;
		left:550px;
		top:-450px;
	}
</style>
<script>	
	$(()=>{
		
		//광고 최소 입력 가능일 설정 (초기 세팅 = 현재 날짜 +7일)
		var date = new Date();
		//console.log(formatDate(date))
		$('#startdate').attr('min',formatDate(date));
		$('#enddate').attr('min',formatDate(date));
		
		$('#adFrm').submit(function(){
			if($('#resno').val()==""){
				alert('매장 등록 번호를 입력하세요.');
				$('#resno').focus();
				return false;
			}
			if($("#bennerimg").val()==""){
				alert("배너 이미지를 입력하세요.")
				$("#bennerimg").focus();
				return false;
			}
			if($('#startdate').val()==""){
				alert('광고 개재일을 입력하세요.');
				$('#startdate').focus();
				return false;
			}
			if($('#enddate').val()==""){
				alert('광고 종료일을 입력하세요.');
				$('#enddate').focus();
				return false;
			}
			var startdateMilli = new Date($('#startdate').val()).getTime()
			var enddateMilli = new Date($('#enddate').val()).getTime()
			
			if(startdateMilli>=enddateMilli){
				alert('개재일이 종료일보다 빠를수 없습니다.');
				$('#startdate').focus();
				return false;
			}
			return true;
		});
	});
	
	function formatDate(date){
		var M = date.getMonth()+1;
		var D = date.getDate()+7;
		var Y = date.getFullYear();
		M = M<10 ? '0'+M : M;
		D = D<10 ? '0'+D : D;
		var format = Y+'-'+M+'-'+D;
		return format
	}
</script>
<div class='resSignUpDiv'>
	<span class="topText">광고 등록 신청</span><br/>
	<hr style='margin-bottom:40px;'/> 
	<form method='post' action='/restaurantAdApplicationWriteOk' enctype="multipart/form-data" id='adFrm'>
		<span>매장 등록 번호</span><br/>
		<input type='text' name ='resno' placeholder='매장 등록 번호를 입력하세요.' id='resno'><br/>
		<span class='text'>*등록 번호는 내 업체 정보에서 확인하실 수 있습니다.</span><br/>
		<span>배너 광고 이미지</span><br/>
		<input type='file' name ='bennerimg1' id='bennerimg'><br/>
		<span>광고 개재일</span><br/>
		<input type="date" name ='startdate' id='startdate'><br/>
		<span>광고 종료일</span><br/>
		<input type='date' name ='enddate' id='enddate'><br/>
		<input type='hidden' name ='status' value='apply'>
		<button>신청</button>
	</form>
	<img src='/img/conputer.png' id='conputerImg'/>
</div>
</body>
</html>