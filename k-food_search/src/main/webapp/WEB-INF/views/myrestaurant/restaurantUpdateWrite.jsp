<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
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
		qna += "<input type='text' name='content'/><input type='button' value='x' onclick='faqDel()'/><br/></span>"
		$("#qna").click(function(){
			$("#qnaDiv").append(qna);
		});
		
		$('#acordian div').mouseenter(function(){
			$(this).css('width','50%').css('transition-duration','0.5s');
		});
		$('#acordian div').mouseleave(function(){
			$(this).css('width','10%').css('transition-duration','0.5s');
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
<style>
	.ck.ck-editor{
		width:1000px;
	}
	.resSignUpDiv{
		width:1200px;
		margin:0 auto;
		margin-top:100px;
		height:1700px;
	}
	.resSignUpDiv span{
		display:block;
		font-size:1.2em;
		font-weight:bold;
		margin-bottom:10px;
	}
	.resSignUpDiv input, .resSignUpDiv select{
		background-color:inherit;
		border:none;
		border-bottom:1px solid black;
		box-sizing:border-box;
		height:30px;
		margin-bottom:20px;
	}
	#acordian{
		width:1200px;
		height:300px;
		overflow:hidden;
		background-image:url('img/acorImg/acorback.jpg');
		background-size:600px;
		margin:0 auto;
		margin-top:50px;
		margin-bottom:50px;
	}
	#acordian div{
		width:10%;
		height:100%;
		float:left;
		overflow:hidden;
	}
	#acordian img{
		width:600px;
	}
	.mainText{
		font-size:2em !important;
	}
</style>
	<div id='acordian'>
		<div>
			<img src='img/acorImg/acor1.jpg'/>
		</div>
		<div>
			<img src='img/acorImg/acor2.jpg'/>
		</div>
		<div>
			<img src='img/acorImg/acor3.jpg'/>
		</div>
		<div>
			<img src='img/acorImg/acor4.jpg'/>
		</div>
		<div>
			<img src='img/acorImg/acor5.jpg'/>
		</div>
	</div>
	<div class='resSignUpDiv'>
		<form method='post' action='/restaurantUpdateOk' enctype="multipart/form-data">
			<input type='hidden' name='resno' value='${vo.resno}'/>
			<span class='mainText'>업체등록</span><br/>
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
				<option>타입선택</option>
				<option>타입1</option>
				<option>타입2</option>
				<option>타입3</option>
			</select><br/>
			<span>매장 메인 이미지</span><br/>
			<span id='resimg'><img src='/resImg/${vo.resimg}' title='현재 등록 중인 이미지' style='width:100px; height:100px; border-radius:50px;'/><br/></span>
			<span>${vo.resimg } &nbsp;<input type='button' value='이미지 교체' onclick='changeView()'/></span>
			<input type='file' name='resimg1' id='resfile' style='display:none;'/><br/>
			<input type='hidden' name='resimgOrg' value='${vo.resimg}'/>
			<span>영업 시작 시간</span><br/>
			<input type="time" name='reshour' value='${vo.reshour }'/><br/>
			<span>영업 종료 시간</span><br/>
			<input type="time" name='reshourend' value='${vo.reshourend }'/><br/>
			<span>가게 홈페이지 *(선택 사항)</span><br/>
			<input type="text" name='website' value='${vo.website }'/><br/>
			<img src='/img/qna.png' width='50px' id='qna'/><br/>
			<div id='qnaDiv'>
				<c:forEach var="item" items="${faqAnsList }">
					<span style='font-weight:normal;'>
						${item.faqcontent2 }
						${item.content2 }
						<input type='hidden' name='faqno' value='${item.faqno2 }'/>
						<input type='hidden' name='content' value='${item.faqcontent2 }'/>
						<input type='button' value='x' onclick='faqDel()'/><br/>
					</span>
				</c:forEach>
			</div>
			<button>등록</button>
		</form>
	</div>
</body>
</html>