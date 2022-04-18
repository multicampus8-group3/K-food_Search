<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="/css/memberEdit.css" type="text/css" />
<link rel="stylesheet" href="/css/memberReserv.css" type="text/css" />
<link rel="stylesheet" href="/css/memberReview.css" type="text/css" />
<link rel="stylesheet" href="/css/memberFavor.css" type="text/css" />

<script>
	// 탭메뉴설정
	$(document).ready(function() {
		$(".mypage_menu>span").click(function() {
			var idx = $(this).index();
			$(".mypage_menu>span").removeClass("on");
			$(".mypage_menu>span").eq(idx).addClass("on");
			$(".mypage_container>div").hide();
			$(".mypage_container>div").eq(idx).show();
		});
		
		$("#pwdChk").click(function() {
			if($('#userpwd1').val()==""){
				alert("비밀번호 입력하세요.");
				return false;
			}
			if($('#userpwd1').val()!="${vo.userpwd}"){
				alert("비밀번호가 틀렸습니다.");
				return false;
			}
			$(".mypage_container>div:nth-child(1)").hide();
			$(".mypage_container>div:nth-child(2)").show();
			return true;
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
		
		$("#chgbtn").click(function(){
			if($("#usertype").val() == "owner(jin)"){
				alert("이미 사업주등록을 신청하였습니다.\n수정하기버튼을 눌러주세요.");
				return;
			}
			$("#usertype").val("owner(jin)");
			alert("사업주등록을 신청하였습니다.\n수정하기버튼을 눌러주세요.");
			return true;
		});
		
		$("#signDelBtn").click(function(){
			if(confirm("정말 탈퇴하시겠습니까?") == true){
				$("#signDel").submit();
			}else{
				return false;
			}
		});

		$("#mFrm").submit(function(){
			var regular = /^[a-zA-Z0-9]{6,16}$/;
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
			var data = $("#mFrm").serialize();
			console.log(decodeURIComponent(data))
			return true;
		});
	});	
	$(function(){
		// 리뷰목록
		function memberReview() {
			var url = "/review/memberReviewList";
			$.ajax({
				url: url,
				success: function(result) {
					var $result = $(result);
					var cnt = 0;
					var tag = "";
					$result.each(function(idx, vo){
						cnt++;
						tag += '<div id="memberReviewList"><a href="#">';
						tag += '<img id="resimg" name="resimg" src="/img/noImg.jpg"/>';
						tag += '<div id="a"><span>'+vo.resname+'</span><br/></div>';
						tag += '<div id="b"><span class="wrdate">'+vo.writedate+'</span><b class="adrr">'+vo.resadress+'</b></div>';
						tag += '<div id="c"><b>★'+parseFloat(vo.grade).toFixed(1)+'</b><br/><span>'+vo.content+'</span></div>';
						tag += '</a></div>'
					});
					$("#memberReview").html(tag);
					$("#reviewcnt").html(cnt);
					
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		}
		memberReview();
	});
	
	$(function(){
		// 즐겨찾기
		function memberFavor() {
			var url = "/memFavor/memFavorList";
			$.ajax({
				url: url,
				success: function(result) {
					var $result = $(result);
					var cnt = 0;
					var now = new Date();
					var realnow = now.getHours()*60 + now.getMinutes();
										
					var tag = '<ul class="memFavorList">';
					$result.each(function(idx, vo){
						cnt++;
						
						var open = parseInt(vo.reshour.split(':')[0]*60) + parseInt(vo.reshour.split(':')[1]);
						var close = parseInt(vo.reshourend.split(':')[0]*60) + parseInt(vo.reshourend.split(':')[1]);
					
						tag += '<li><a href="#"><div><span class="heart">♥</span></div>';
						tag += '<div><span><b>'+vo.resname+'</b><br/></span>';
						tag += '<span>★'+parseFloat(vo.resgrade).toFixed(1)+'</span><br/>';
						tag += '<span><b>'+vo.restype + '</b>&nbsp;·&nbsp;' + vo.resadress+'<br/></span><br/>';
						
						if(realnow < open || realnow > close) {
							tag += '<span class="favon">영업 중</span></div>';
						}else{
							tag += '<span class="favoff">영업 종료</span></div>';
						}
						
						tag += '<div><img src="/img/noImg.jpg"/></div></a></li>';
					});
					tag += '</ul>';
					
					$("#memberFavor").html(tag);
					$("#favorcnt").html(cnt);
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		}
		//즐겨찾기 취소
		$(document).on("click", ".heart", function(){
			console.log("no= "+$(this).attr('value'));
			var params = "no= "+$(this).attr('value');
			var url = "/memFavor/memFavorDelete";
			$.ajax({
				url: url,
				data: params,
				type: "get",
				success: function(result){
					memberFavor();				
				},
				error: function(e){
					console.log(e.responseText);
				}
			});
		});
		memberFavor();	
	});

	$(function(){
		// 예약현황
		function memberReserv() {
			var url = "/memReserv/memReservList";
			$.ajax({
				url: url,
				success: function(result) {
					var $result = $(result);
					
					var tag ="";
					
					$result.each(function(idx, vo){
						if(vo.status == "ok"){
							tag += '<div class="memberReservListOk">'; <!-- 반복될부분 -->
							tag += '<div class="memberReservInfoOk">'; <!-- 예약정보 -->
							tag += '<ul class="memok">';
							tag += '<li>예약이 <b>승인</b>되었습니다.</li>';
							tag += '<li>&nbsp;만약 예약을 취소하시려면 아래 문의 이메일로 연락주시길바랍니다.</li>';
							tag += '<li class="resname"><b>'+vo.resname+'</b></li>';
							tag += '<li><hr/></li>';
							tag += '<li>일정: <span>'+vo.reservdate+'&nbsp'+vo.reservtime+'</span></li>';
							tag += '<li>인원: <span>'+vo.reservp+'명</span></li>';
							tag += '<li>문의: <span>'+vo.website+'</span></li>';
							tag += '</ul>';
							tag += '</div>';
							tag += '<div class="writedateOk">'+vo.writedate+'</div>';
							tag += '</div>';
						}else {
							tag += '<div class="memberReservList">'; <!-- 반복될부분 -->
							tag += '<div class="memberReservInfo">'; <!-- 예약정보 -->
							if(vo.status == "apply"){
								tag += '<ul class="memapply">';
								tag += '<li>예약 가능여부를 <b>확인중</b> 입니다.</li>';
								tag += '<li>&nbsp;['+vo.resname+']에서 확인하는대로 빠른 시간내 결과를 안내해 드리겠습니다.</li>';
								tag += '<form method="post">';
								tag += '<input type="hidden" name="no" value="'+vo.no+'" readonly>';
								tag += '<input type="hidden" name="status" value="cancel" readonly>';
							};
							if(vo.status == "reject"){
								tag += '<ul class="memreject">';
								tag += '<li>예약이 <b>거부</b>되었습니다.</li>';
								tag += '<li>&nbsp;자세한 문의사항은 아래 문의 이메일로 연락주시길바랍니다.</li>';
							};
							if(vo.status == "cancel"){
								tag += '<ul class="memcancel">';
								tag += '<li>예약을 <b>취소</b>하셨습니다.</li>';
								tag += '<li>&nbsp;예약 취소가 완료되었습니다.</li>';
							};
							tag += '<li class="resname"><b>'+vo.resname+'</b></li>';
							tag += '<li><hr/></li>';
							tag += '<li>일정: <span>'+vo.reservdate+'&nbsp'+vo.reservtime+'</span></li>';
							tag += '<li>인원: <span>'+vo.reservp+'명</span></li>';
							tag += '<li>문의: <span>'+vo.website+'</span></li>';
							if(vo.status == "apply"){
								tag += '<li><input type="submit" class="resevDel" value="예약취소" onclick=""></li>';
								tag += '</form>';
							};
							tag += '</ul>';
							tag += '</div>';
							tag += '<div class="writedate">'+vo.writedate+'</div>';
							tag += '</div>';
						}
						
					});
					
					$("#memberReserv").html(tag);
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		}
		
		//예약취소처리
		$(document).on('submit', '#memberReserv form', function(){
		event.preventDefault();
		var params = $(this).serialize();
		var url = "/memReserv/memReservCancel";
		$.ajax({
			url: url,
			data: params,
			type: "post",
			success: function(result){
				memberReserv();				
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	});

		$("#reservFt").change(function(){
			if($("#reservFt option:selected").val() == "전체보기"){
 				$(".memberReservListOk").css("display", "block");
 				$(".memberReservList").css("display", "block");
 			}
 			if($("#reservFt option:selected").val() == "apply"){
 				$(".memberReservListOk").css("display", "none");
 				$(".memberReservList").css("display", "none");
 				$(".memapply").parents('div.memberReservList').css("display", "block");
 			}
 			if($("#reservFt option:selected").val() == "ok"){
 				$(".memberReservListOk").css("display", "none");
 				$(".memberReservList").css("display", "none");
 				$(".memok").parents('div.memberReservListOk').css("display", "block");
 			}
 			if($("#reservFt option:selected").val() == "reject"){
 				$(".memberReservListOk").css("display", "none");
 				$(".memberReservList").css("display", "none");
 				$(".memreject").parents('div.memberReservList').css("display", "block");
 			}
 			if($("#reservFt option:selected").val() == "cancel"){
 				$(".memberReservListOk").css("display", "none");
 				$(".memberReservList").css("display", "none");
 				$(".memcancel").parents('div.memberReservList').css("display", "block");
 			}
			
		});
		
		memberReserv();
	});
</script>
<div class="hello">
	<div>
		<div class="hellotext">
			"안녕하세요 <b>${username }</b>님📖 <br/>
			마이페이지에 오신걸 환영합니다."	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="revStarCnt">☆&nbsp;<span id="reviewcnt"></span>&nbsp;리뷰</span> &nbsp;&nbsp;&nbsp;
			<span id="favHeartCnt">♡&nbsp;<span id="favorcnt"></span>&nbsp;즐겨찾기</span>
		</div>
	</div>
</div>
<div class='container'>	
	<div class='mypage_container'>
		<div class="memEdit on">
			<h3>개인정보변경</h3>
			<div id="memberEdit">
				<!-- <form method="post" action="/member/memberEdit2" id="mFrm"> -->
				<ul>
					<li>고객님의 소중한 개인정보보호를 위해서 본인확인을 진행합니다.</li>
					<li><input type="hidden" name="userid" id="userid1" value="${vo.userid}" readonly></li>
					<li>비밀번호</li>
					<li><input type="password" name="userpwd" id="userpwd1" placeholder="비밀번호입력"></li>
					<li><input type="button" id="pwdChk" value="확인"></li>
				</ul>
			</div>
		</div>

		<div class="memEdit edit" >
			<h3>개인정보변경</h3>
			<div id="memberEdit2">
				<div style="display: block" id="content1">
					<form method="post" action="/member/memberEditOk" id="mFrm">
						<ul>
							<li class="inforName">아이디
								<input type="text" name="usertype" id="usertype" value="${vo.usertype}" style="display: none">
								<c:if test="${vo.usertype=='owner'}"></c:if>
								<c:if test="${vo.usertype=='owner(jin)'}"></c:if>
								<c:if test="${vo.usertype=='normal'}"><input id="chgbtn"type="button" value="사업주등록신청"></c:if>
							</li>
							<li><input class="inputStyle" type="text" name="userid" value="${vo.userid}" readonly style="all:none"></li>
							<li class="inforName">*&nbsp;국적</li>
							<li>
     							 <select class="inputStylenation"  id="usernation" name="usernation" >
        							 <option value="">국가선택</option>
        							 <c:forEach items="${countrylist}" var="item">
        							 	<option value="${item.nation}" <c:if test="${vo.usernation == item.nation}">selected</c:if>>${item.nation}</option>
        							 </c:forEach>
     							 </select>
      						</li>
							<li class="inforName">*&nbsp;여행 선호 국가</li>
							<li>
								<select class="inputStylenation"  id="favornation" name="favornation" >
        							 <option value="">국가선택</option>
        							 <c:forEach items="${countrylist}" var="item">
        							 	<option value="${item.nation}" <c:if test="${vo.favornation == item.nation}">selected</c:if>>${item.nation}</option>
        							 </c:forEach>
     							</select>
     							<select class="inputStylestate" id="favorstate" name="favorstate">
									<option value="${vo.favorstate}" selected>${vo.favorstate}</option>
									
								</select>
							</li>
							<li class="inforName">*&nbsp;이름</li>
							<li><input class="inputStyle" type="text" name="username" value="${vo.username}"></li>
							<li class="inforName">*&nbsp;연락처</li>
							<li>
								<select class="inputStyletel1" name='telArray' id='tel1'>
									<option value="010" <c:if test="${vo.tel1=='010'}">selected</c:if>>010</option>
									<option value="011" <c:if test="${vo.tel1=='011'}">selected</c:if>>011</option>
									<option value="016" <c:if test="${vo.tel1=='016'}">selected</c:if>>016</option>
									<option value="017" <c:if test="${vo.tel1=='017'}">selected</c:if>>017</option>
									<option value="018" <c:if test="${vo.tel1=='018'}">selected</c:if>>018</option>
									<option value="019" <c:if test="${vo.tel1=='019'}">selected</c:if>>019</option>
								</select>
								  &nbsp; - &nbsp;<input class="inputStyletel2" type="text" name="telArray" id="tel2" value='${vo.tel2}'/>
								  &nbsp; - &nbsp;<input class="inputStyletel2" type="text" name="telArray" id="tel3" value='${vo.tel3}'/>
							 </li>
							 <li><input type="submit" value="수정하기" id="signEditBtn">&nbsp;<input type="button" value="탈퇴하기" id="signDelBtn"/></li>
							</ul>
					</form>
					<form method="get" action="/member/memberDelete" id='signDel'>
						<input type="text" name="userid" value="${vo.userid}" readonly style="display: none">
					</form>
				</div>
			</div>
		</div>

		
		<div class="memberRes">
			<h3>예약현황</h3>
			<select id='reservFt'>
				<option value="전체보기" selected>전체보기</option>
				<option value="apply" >확인중</option>
				<option value="ok" >승인</option>
				<option value="reject" >거절</option>
				<option value="cancel" >취소</option>
			</select>
			<div id="memberReserv">
			</div>
		</div>

		<div class="memberRev">
			<h3>내리뷰보기</h3>
			<div id="memberReview">
			</div>
		</div>
		
		<div class="memberFav">
			<h3>즐겨찾기</h3>
			<div id="memberFavor">
			</div>
		</div>
	</div>
	</div>
</div>
