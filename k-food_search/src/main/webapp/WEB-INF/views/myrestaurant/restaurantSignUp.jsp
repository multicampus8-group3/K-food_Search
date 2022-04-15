<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
<script src="/js/backjs/resCheck.js"></script>
<script>
	$(()=>{
		ClassicEditor
		.create(document.querySelector( '#editor' ), {
		    language: 'ko'
		  })
        .catch( error => {
            console.error( error );
        });
		
		$("#resnation").change(function(){
 			var url = "/country/stateList"
 			var params = $("#resnation option:selected").val();
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
					$("#resstate").html(tag);
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		});
		
		var qna = "<span><select name='faqno'><c:forEach var='item' items='${faqList }'><option value='${item.no }'>${item.content }</option></c:forEach></select>";
		qna += "<input type='text' name='content'/><input type='button' value='x' onclick='faqDel()'/><br/></span>"
		$("#qna").click(function(){
			$("#qnaDiv").append(qna);
		});
	});
	
	function faqDel(){
		$(event.target).parent().remove();
	}
	
</script>
<style>
	.ck.ck-editor{
		width:1000px;
	}
	.resSignUpDiv{
		width:1200px;
		margin:0 auto;
		margin-top:100px;
		height:1500px;
	}
	.resSignUpDiv input, .resSignUpDiv select{
		background-color:inherit;
		border:none;
		border-bottom:1px solid black;
		box-sizing:border-box;
		height:30px;
		margin-bottom:20px;
	}

	.resSignUpDiv span{
		display:block;
		font-size:1.2em;
		font-weight:bold;
		margin-bottom:10px;
	}
	.mainText{
		font-size:2em !important;
	}
</style>
	﻿<%@ include file="acordian.jspf" %>
	<div class='resSignUpDiv'>
		<form method='post' action='/resSignUp' enctype="multipart/form-data" id='resSignUpFrm'>
			<span class='mainText'>업체등록</span><br/>
			<hr style='margin-bottom:40px;'/> 
			<span>매장명</span><br/>
			<input type='text' name='resname' id='resmane' placeholder='가게명을 입력하세요'/><br/>
			<span>매장 주소</span><br/>
			<input type='text' name='resadress' id='resadress' placeholder='가게주소를 입력하세요'/><br/>
			<span>매장 소개글</span><br/>
			<textarea id="editor" name='rescontent' id='rescontent'></textarea><br/>
			<span style='font-weight:normal;'>* 원활한 검색을 위해 매장이 위치한 국가와 지역을 입력해주세요.</span><br/>
			<span>매장 소속 국가</span><br/>
			<select id="resnation" name="resnation">
				<option value=''>지역선택</option>
				<c:forEach items="${countrylist}" var="item">
        			<option value="${item.nation}">${item.nation}</option>
        		</c:forEach>
			</select><br/>
			<span>매장 소속 지역</span><br/>
			<select class="inputStylenation" id="resstate" name="resstate">
				<option value=''>지역선택</option>
			</select><br/>
			<span>업종 분류</span><br/>
			<select name='restype' id='restype'>
				<option value=''>타입선택</option>
				<option>타입1</option>
				<option>타입2</option>
				<option>타입3</option>
			</select><br/>
			<span>매장 메인 이미지</span><br/>
			<input type='file' name='resimg1'/><br/>
			<span>영업 시작 시간</span><br/>
			<input type="time" name='reshour' id='reshour'/><br/>
			<span>영업 종료 시간</span><br/>
			<input type="time" name='reshourend' id='reshourend'/><br/>
			<span>가게 홈페이지 *(선택 사항)</span><br/>
			<input type="text" name='website'/><br/>
			<img src='/img/qna.png' width='50px' id='qna' style='cursor:pointer'/><br/>
			<div id='qnaDiv'></div>		
			<button>등록</button>
		</form>
	</div>
</body>
</html>
