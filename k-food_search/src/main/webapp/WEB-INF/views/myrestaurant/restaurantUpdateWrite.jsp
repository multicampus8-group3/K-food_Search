<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
<script src="/js/backjs/resCheck.js"></script>
<link rel="stylesheet"  href='/css/backCSS/restaurantUpdateWrite.css' type="text/css"/>
<link rel="stylesheet"  href='/css/backCSS/hanokback.css' type="text/css"/>
<link rel="stylesheet"  href='/css/backCSS/inputButton.css' type="text/css"/>
<script>
$(()=>{
	
	setState();
	
	$("#resnation").change(function(){
		setState();
	});
	
	ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
        console.error( error );
    });

	var qna = "<span><select name='faqno'><c:forEach var='item' items='${faqList }'><option value='${item.no }'>${item.content }</option></c:forEach></select>";
	qna += "<br/><input type='text' name='content' placeholder='답변 내용을 입력하세요.'/><input type='button' value='삭제' onclick='faqDel()'/><br/></span>"
	$("#qna").click(function(){
		$("#qnaDiv").append(qna);
	});
	
	for(var i=0; i<document.querySelectorAll('#restype option').length; i++){
		if(document.querySelectorAll('#restype option')[i].value=='${vo.restype}'){
			document.querySelectorAll('#restype option')[i].setAttribute("selected", "true");
		}	
	}
	
});

function setState(){
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
				if(vo.state=='${vo.resstate}'){
					tag += "<option value="+vo.state+" selected>"+vo.state+"</option>";						
				}else{
					tag += "<option value="+vo.state+">"+vo.state+"</option>";													
				}
			});				
			$("#resstate").html(tag);
		},
		error: function(e) {
			console.log(e.responseText);
		}
	});
}

function faqDel(){
	$(event.target).parent().remove();
}

function changeView(){
	$(event.target).parent().css('display','none');
	$('#resfile').css('display','block');
}
</script>
	﻿<%@ include file="acordian.jspf" %>
	<div class='resSignUpDiv'>
		<form method='post' action='/myrestaurant/restaurantUpdateOk' enctype="multipart/form-data" id='resSignUpFrm'>
			<input type='hidden' name='resno' value='${vo.resno}'/>
			<span class='mainText'>업체 정보 수정</span><br/>
			<hr style='margin-bottom:40px;'/> 
			<span>매장명</span><br/>
			<input type='text' name='resname' id='resmane' value="${vo.resname }"/><br/>
			<span>매장 주소</span><br/>
			<input type='text' name='resadress' id='resadress' value="${vo.resadress }"/><br/>
			<span>매장 소개글</span><br/>
			<textarea id="editor" name='rescontent'>${vo.rescontent }</textarea><br/>
			<span>매장 소속 국가</span><br/>
			<select id="resnation" name="resnation">
				<option value="">국가선택</option>
        		<c:forEach items="${countrylist}" var="item">
        			<option value="${item.nation}" <c:if test="${vo.resnation == item.nation}">selected</c:if>>${item.nation}</option>
        		</c:forEach>
			</select><br/>
			<span>매장 소속 지역</span><br/> 
			<select class="inputStylenation" id="resstate" name="resstate">
			</select><br/>
			<span>업종 분류</span><br/> 
			<select name='restype' id='restype'>
				<option value=''>타입선택</option>
				<option>떡복이</option>
				<option>전</option>
				<option>백반</option>
				<option>치킨</option>
				<option>삼겹살</option>
				<option>비빔밥</option>
				<option>국밥</option>
			</select><br/>
			<span>매장 메인 이미지</span><br/>
			<span id='resimg'><img src='/resImg/${vo.resimg}' title='현재 등록 중인 이미지' style='width:100px; height:100px; border-radius:50px;'/><br/></span>
			<span>${vo.resimg } &nbsp;<input type='button' id='btn' value='이미지 교체' onclick='changeView()'/></span>
			<input type='file' name='resimg1' id='resfile' style='display:none;' accept=".gif, .jpg, .png"/><br/>
			<input type='hidden' name='resimgOrg' value='${vo.resimg}'/>
			<span>영업 시작 시간</span><br/>
			<input type="time" name='reshour' value='${vo.reshour }' id='reshour'/><br/>
			<span>영업 종료 시간</span><br/>
			<input type="time" name='reshourend' value='${vo.reshourend }' id='reshourend'/><br/>
			<span>가게 홈페이지 *(선택 사항)</span><br/>
			<input type="text" name='website' value='${vo.website }'/><br/>
			<img src='/img/qna.png' width='50px' id='qna'/><br/>
			<div id='qnaDiv'>
				<c:forEach var="item" items="${faqAnsList }">
					<span style='font-weight:normal;'>
						${item.faqcontent2 }&nbsp;&nbsp;&nbsp;
						${item.content2 }
						<input type='hidden' name='faqno' value='${item.faqno2 }'/>
						<input type='hidden' name='content' value='${item.faqcontent2 }'/>
						<input type='button' value='삭제' onclick='faqDel()'/><br/>
					</span>
				</c:forEach>
			</div>
			<button id='inBtn'>등록</button>
		</form>
	</div>
</body>
</html>