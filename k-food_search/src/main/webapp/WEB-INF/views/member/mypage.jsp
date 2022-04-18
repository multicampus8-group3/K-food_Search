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
 			var url = "/country/stateList"
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
						tag += '<div id="memberReviewList">';
						tag += '<img id="resimg" name="resimg" src="/img/noImg.jpg"/>';
// 지훈 ---> parseFloat().toFixed(1) 사용해서 소수점 아래 한자리까지 표시!! ///////////////////////
						tag += '<div id="a"><b>★'+parseFloat(vo.resgrade).toFixed(1)+'</b><a href="#">'+vo.resname+'</a><br/></div>';
						tag += '<div id="b">'+vo.writedate+'<br/></div>';
						tag += '<div id="c"><b>★'+parseFloat(vo.grade).toFixed(1)+'</b><br/>&nbsp;'+vo.content+'</div>';
						tag += '</div>'
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
					var tag = '<ul class="memFavorList">';
					$result.each(function(idx, vo){
						cnt++;
// 지훈 ---> 일단은 의미없는 하트 추가!! 혹시 시간이 된다면 하트눌러서 즐겨찾기에서 지울수있으면 좋을거같기도? ///////////////////////
						tag += '<li class="favorList"><span class="heart" value='+vo.no+'>♥</span>';
						tag += '<a href="#"><img src="/img/noImg.jpg"</>';
						tag += '<span>&nbsp;<b>'+vo.resname+'</b><br/></span>';
						tag += '<span>&nbsp;'+vo.resstate+',&nbsp;'+vo.resnation+'<br/></span>';
// 지훈 ---> parseFloat().toFixed(1) 사용해서 소수점 아래 한자리까지 표시!! ///////////////////////
						tag += '<span>&nbsp;★'+parseFloat(vo.resgrade).toFixed(1)+'</span></a></li>';
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
// 지훈 ---> ok일때만 따로 빼서 예약현황에서 오른쪽배치했습니다. ////////////////////////////////
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
// 지훈 ---> input 2개 hidden주고 디자인했습니다. ///////////////////////////////////////
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
<div class='container'>
	<div class="hello">"안녕하세요 <b>${username }</b>님📖 <br/>마이페이지에 오신걸 환영합니다." 
	즐겨찾기: <span id="favorcnt"></span> &nbsp; 내리뷰: <span id="reviewcnt"></span></div>
	<div class='containerWrap'>
	<div class='mypage_menu'>
			&nbsp;옛날에 나무꾼 부부가 살았습니다. 나무꾼의 부인은 수다쟁이였습니다. “이봐요! 
		<span class="on">개인정보변경</span>
			개똥이 엄마! 말똥이 엄마가 어쩌고저쩌고..” 어느 날 나무꾼은 평상시와 같이 나무를 하러 산으로 갔습니다. 
		<span style="display:none;">회원정보수정</span>
			그때, 산에서 번쩍거리는 커다란 황금을 발견했습니다. 
			“와! 신난다. 이제 나는 부자가 되는 거야!” 순간 나무꾼은 그의 부인이 수다쟁이라는 사실을 떠올렸습니다. 
			‘아차! 이를 어쩌지? 이 황금덩어리를 보면 부인은 동네방네 떠들 거고…그럼 도둑이 들어와서 이 황금 덩이를 훔쳐 갈지 몰라. 
			이를 어쩌지?’ 나무꾼은 한참을 생각해 봤습니다.
		<span>예약현황</span>
			그러다가 나무꾼에게 좋은 꾀가 떠올랐습니다. 
			‘옳지! 그러면 되겠구나’ 나무꾼은 점심 도시락으로 싸온 주먹밥을 나뭇가지 위에 꽂아두었습니다. 
			그러곤 집으로 쏜살같이 달려갔습니다. “여보! 여보!” “아니 당신이 웬일이에요? 지게는요?” “지금 지게가 문제가 아니야. 
			내가 방금 산에서 주먹밥같이 열리는 나무를 보았다오.” “네? 주먹밥이 열리는 나무요? 세상에 그런 게 어디 있어요?” 
		<span>내리뷰보기</span>
			“그럼 날 따라와 보시오. 내가 보여 줄 테니.” 나무꾼은 그의 부인을 데리고 아까 주먹밥을 꽂아둔 나무로 갔습니다. 
			“아니! 세상에 이럴 수가.. 이제 우리는 나무하지 않아도 평생 먹고 살 수 있어요. 
			가만있자. 내가 지금 이럴 때가 아니지.. 어서 가서 동네 사람들에게 알려야겠다! 
		<span>즐겨찾기</span>
			개똥이 엄마, 소똥이 엄마..” 나무꾼의 부인은 쏜살같이 마을로 내려가서 마을 사람들에게 주먹밥이 열리는 나무에 대해서 말했습니다. 
			그러나 마을 사람들은 아무도 그 말을 믿지 않았습니다. “아니, 수다쟁이 아줌마가 아무래도 어떻게 된 거 아냐?” 
			“그러게 말이에요. 세상에 주먹밥이 열리는 나무가 어디 있어요?” 
			그때를 맞춰서 나무꾼이 부인에게 황금 덩이를 보여주며 말했습니다. 
			“여보 실은 내가 아까 나무를 하다가 산에서 이 황금덩어리를 주었다오.” 
			“어머나! 정말 황금이네? 이젠 우리 부자가 됐어! 부자가! 아니지.. 
			이 기쁜 소식을 나만 알고 있으면 안 되지. 동네 사람들 내 말 좀 들어보세요…”
			나무꾼의 부인은 또다시 마을 가서 마을 사람들에게 산에서 황금 덩이를 주운 얘기를 했습니다. 
			마을 사람들은 이번에도 아무도 그 말을 믿지 않았습니다. 
			“아무래도 저 여자가 좀 미친 것 같아.. 쯧쯧..” 
			“그러게 말이야. 아까는 주먹밥이 열리는 나무가 있다고 하다니 또 지금은 산에서 황금 덩이를 주었다고 하지 않나.” 
			“아이고, 젊은 부인이 안됐구먼.. 쯧쯧..” 그런 일이 있은 후 나무꾼의 부인은 수다쟁이 버릇을 고치게 됐어요. 
			그리고 나무꾼 부부는 그 황금덩어리를 팔아 큰 부자가 돼서 행복하게 살았답니다.
			만약 나무꾼이 아내의 수다쟁이 버릇을 혼내기만 했다면 아내는 그 버릇을 고치지 못했을 것입니다. 
			다행하게도 나무꾼의 현명한 방법으로 아내와 사이가 멀어지지 않고도 버릇을 고칠 수 있었으며 
			금을 가지고 있다는 사실도 도둑들의 귀에 들어가지 않아 부유하게 살 수 있게 되었죠. 
			모든 일이 그르치기만 한다고 해서 해결되는 것이 아니라 어떻게 행동하냐에 따라 결과나 달라질 수 있음을 알 수 있는 동화였습니다.
			<hr/>
			<b>주먹밥이 열리는 나무</b>
	</div>
	<div class='mypage_container'>
		<div class="on">
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

		<div>
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

		
		<div>
			<h3>예약현황
			<select id='reservFt'>
				<option value="전체보기" selected>전체보기</option>
				<option value="apply" >확인중</option>
				<option value="ok" >승인</option>
				<option value="reject" >거절</option>
				<option value="cancel" >취소</option>
			</select>
			</h3>
			<div id="memberReserv">
			</div>
		</div>

		<div>
			<h3>내리뷰보기</h3>
			<div id="memberReview">
			</div>
		</div>
		
		<div>
			<h3>즐겨찾기</h3>
			<div id="memberFavor">
			</div>
		</div>
	</div>
	</div>
</div>
