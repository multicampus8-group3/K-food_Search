<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(()=>{
			$("#useridSignUp").keyup(function(){
				var url = '/idOk';
				var target = $(".checkForm");
				
				$.ajax({
					type:'get',
	 				dataType:'text',
	 				url:url,
	 				data:{'id':$("#useridSignUp").val()},
	 				success:function(result){
	 					//console.log(result);
	 					if(result>=1){
	 						target.css('display','block');
	 						target.html("아이디가 중복되었습니다.");
	 						target.css('color','red');
	 					}else{
	 						target.css('display','none');
	 					}
	 				},error:function(error){
	 					
	 				}
				});
			});
			
			$("#favornation").change(function(){
	 			var url = "/stateList"
	 			var params = $("#favornation option:selected").val();
	 			$.ajax({
					url: url,
					data:{
						nation:params
					},
					success: function(result) {
						var $result = $(result);
						var tag = "<option value=''>지역선택</option>";
						$result.each(function(idx, vo){
							tag += "<option value="+vo.state+">"+vo.state+"</option>";						
						});
									
						$("#favorstate").html(tag);
					},
					error: function(e) {
						console.log(e.responseText);
					}
				});
			});
			
			$("#signUpFrm").submit(function(){
				if($("#useridSignUp").val()==''){
					alert("아이디를 입력하세요.");
					$("#useridSignUp").focus();
					return false;
				}
				var regular = /^[a-zA-Z0-9]{6,16}$/;
				if(!regular.test($("#useridSignUp").val())){
					alert("아이디 입력 양식이 잘못되었습니다.\n*아이디는 영문 또는 숫자 6~16자리로 입력해 주세요.");
					$("#useridSignUp").focus();
					return false;
				}
				if($("#userpwdSignUp").val()==""){
					alert("비밀번호를 입력하세요.");
					$("#userpwdSignUp").focus();
					return false;
				}
				regular = /^[a-zA-Z0-9!@#$%^&*~?]{8,16}$/;
				if(!regular.test($("#userpwdSignUp").val())){
					alert("비밀번호 양식이 잘못 되었습니다.\n*비밀번호는 8~16자 여야 합니다.\n*사용가능 특수문자 -> !@#$%^&*~?");
					$("#userpwdSignUp").focus();
					return false;
				}
				if($("#userpwdSignUp").val()!=$("#userpwdSignUp2").val()){
					alert("비밀번호가 일치하지 않습니다.");
					$("#userpwdSignUp2").focus();
					return false;
				}
				if($("#usernation").val()==''){
					alert("국적을 선택해 주세요.")
					$("#usernation").focus();
					return false;
				}
				if($("#favornation").val()==''){
					alert("여행 선호 국가를 선택해주세요.")
					$("#favornation").focus();
					return false;
				}
				if($("#favorstate").val()==''){
					alert("여행 선호 국가를 선택해주세요.")
					$("#favorstate").focus();
					return false;
				}
				if($("#username").val()==''){
					alert("이름을 입력해주세요.")
					$("#username").focus();
					return false;
				}
				if($("#tel2").val()==''){
					alert("전화번호를 입력해주세요.");
					$("#tel2").focus();
					return false;
				}
				regular=/^[0-9]{3,5}$/;
				if(!regular.test($("#tel2").val())){
					alert("전화번호 입력 양식이 잘못되었습니다.\n*3~5자리 숫자만 입력 가능합니다.");
					$("#tel2").focus();
					return false;
				}
				regular=/^[0-9]{3,5}$/;
				if(!regular.test($("#tel3").val())){
					alert("전화번호 입력 양식이 잘못되었습니다.\n*3~5자리 숫자만 입력 가능합니다.");
					$("#tel3").focus();
					return false;
				}
				var data = $("#signUpFrm").serialize();
				console.log(decodeURIComponent(data))
				return true;
			});
		});
	</script>
	<style>
		.container{
				width: 1200px;
				margin: 0 auto;
			}
		#leftbox{
			float: left;
			width:390px;
			height: 800px;
			background-color: rgba(125, 144, 127, 0.3);
			margin-top: 0px;
			overflow: hidden;
			position: relative;
		}
		#leftbox p{
			position: absolute;
			top: 5%;
			font-size: 48px;
			font-weight: bold;
			width: 100%;
			text-align: center;
			color: #2F4858;
		}
		.leftimg{
			margin-top: 350px;
			width: 100%;
			height: 100%;
			object-fit:cover;
		}
		#centerbox{
			width:390px;
			height: 800px;
			margin: 30px auto;
			background-color: rgba(165, 166, 143, 0.3);
			overflow: hidden;
			position: relative;
		}
		#centerbox p{
			position: absolute;
			bottom: 5%;
			font-size: 32px;
			width: 100%;
			text-align: center;
			font-weight: bold;
			color: #2F4858;
		}
		.centerimg{
			margin-top: -350px;
			width: 100%;
			height: 100%;
			object-fit:cover;
		}
		#signUpDiv{
			float: right;
			margin-top: 0px;
			width:390px;
			height: 800px;
			background-color: rgba(205, 188, 168, 0.3);
		}
		#signUpFrm{
			margin: 0 auto;
			width: 80%;
		}
		.inforName{
			display:inline-block;
			width:100%;
			margin-top:35px;
			margin-bottom: 10px;
			font-size:1.1em;
			color: #2F4858;
			font-weight: 600;
		}
		#signUpDiv input,#signUpDiv select{
			background-color:inherit;
			border:none;
			border-bottom:1px solid #2F4858;
			box-sizing:border-box;
			height:30px;
			margin-left: 21px;
		}
		.inputStyle{
			width:85%;			
		}
		.inputStylenation{
			width:36%;
		}
		.inputStylestate{
			width:36%;
			margin-left: 0 !important;
		}
		.inputStyletel1{
			width:15%;
		}
		.inputStyletel2{
			margin-left: 0 !important;
			width:24%;
		}
		.submitBtn{
			width:90%;
			cursor:pointer;
			border:none;
			background-color:#3E6167;
			color:white;
			font-size: 1.1em;
			font-weight: 600;
			height:40px;
			margin: 40px auto;
			display: block;
		}
		.checkForm{
			margin-top:30px;
			padding-left:20%;
			display:none;
		}
	</style>
	<div class="container">
		<div id="leftbox">
			<p>한땀한땀</p>
			<img class='leftimg' src="/img/tteok.png"/>
		</div>
		
		<div id="signUpDiv">
			<form method="post" action="/sighUpOk" id="signUpFrm">
				<span class="inforName">아이디</span><br/>
				<input class="inputStyle" type='text' name='userid' id='useridSignUp' placeholder='아이디를 입력해 주세요.'/><br/>
				<div class="checkForm"></div>
				<span class="inforName">비밀번호</span><br/>
				<input class="inputStyle" type='password' name='userpwd' id='userpwdSignUp' placeholder='비밀번호를 입력해 주세요.'/><br/>
				<span class="inforName">비밀번호 확인</span><br/>
				<input class="inputStyle" type='password' id='userpwdSignUp2' placeholder='비밀번호를 확인해 주세요'/><br/>
				<span class="inforName">국적</span><br/>
				<select class="inputStylenation" id="usernation" name="usernation" >
					<option value=''>국가선택</option>
					<c:forEach items="${countrylist}" var="item">
        				<option value="${item.nation}">${item.nation}</option>
        			</c:forEach>
				</select><br/>
				<span class="inforName">여행 선호 국가</span><br/>
				<select class="inputStylenation" id="favornation" name="favornation">
					<option value=''>국가선택</option>
					<c:forEach items="${countrylist}" var="item">
        				<option value="${item.nation}">${item.nation}</option>
        			</c:forEach>
				</select>
				&nbsp;&nbsp;&nbsp;
				<select class="inputStylestate" id="favorstate" name="favorstate">
					<option value=''>지역선택</option>
				</select>
				<br/>
				<span class="inforName">이름</span><br/>
				<input class="inputStyle" type="text" name="username" id="username" placeholder='이름을 입력해 주세요.'/><br/>
				<span class="inforName">연락처</span><br/>
				<select class="inputStyletel1" name='telArray' id='tel1'>
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				 &nbsp; - &nbsp;<input class="inputStyletel2" type="text" name="telArray" id="tel2"/>
				&nbsp; - &nbsp;<input class="inputStyletel2" type="text" name="telArray" id="tel3"/><br/>
				<input type="hidden" name='usertype' value="normal"/>
				<button class='submitBtn'>가입하기</button>
			</form>
		</div>
		
		<div id="centerbox">
			<img class='centerimg' src="/img/bibimbap.png"/>
			<p>한식만 따로 담았다</p>
		</div>
	</div>
