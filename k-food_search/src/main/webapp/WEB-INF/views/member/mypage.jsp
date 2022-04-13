<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="/css/memberReview.css" type="text/css" />
<link rel="stylesheet" href="/css/memberFavor.css" type="text/css" />
<link rel="stylesheet" href="/css/memberReserv.css" type="text/css" />
<script>
	function DrDw2(F,b){
		var aCL=F.split("~");
		var iC=aCL.length;
		if(aCL[iC-1]=="")iC--;
		var i=0;
		while(i<iC){
			document.write("<option value=\""+aCL[i]+"\""+(b==aCL[i]?" selected":"")+">"+aCL[i+1]);
			i=i+2;
		}
	};
	// 탭메뉴설정
	$(document).ready(function() {
		$(".mypage_menu li").click(function() {
			var idx = $(this).index();
			$(".mypage_menu li").removeClass("on");
			$(".mypage_menu li").eq(idx).addClass("on");
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
			$(".mypage_menu li:nth-child(1)").removeClass("on");
			$(".mypage_menu li:nth-child(2)").addClass("on");
			$(".mypage_container>div:nth-child(1)").hide();
			$(".mypage_container>div:nth-child(2)").show();
			return true;
		});
		
		$("#favornation").change(function(){
			//console.log($("#favornation option:selected").val())
			//console.log($("#favornation option:selected").text())
			
			var idx = $("#favornation option").index( $("#favornation option:selected") );
			var state = new Array();
			var target = document.querySelector("#favorstate");
			
			//state[0] = ['테스트1','테스트2','테스트3'];
			state[114] = ['서울', '경기도', '마산'];
			
			target.options.length=1;
			
			for(i in state[idx]){
				var opt = document.createElement("option");
				opt.value = state[idx][i];
				opt.innerHTML = state[idx][i];
				opt.selected;
				target.appendChild(opt);
			}
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
			regular=/^[0-9]{6,16}$/;
			if(!regular.test($("#tel2").val())){
				alert("전화번호 입력 양식이 잘못되었습니다.\n*6~15자리 숫자만 입력가능.");
				$("#tel2").focus();
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
					
					var tag = "";
					$result.each(function(idx, vo){
						tag += '<div id="memberReviewList">';
						tag += '<img id="resimg" name="resimg" src="/img/noImg.jpg"/>';
						tag += '<span id="a">★'+vo.resgrade+'&nbsp<a href="#">'+vo.resname+'</a><br/></span>';
						tag += '<span id="b">'+vo.writedate+'<br/></span>';
						tag += '<div id="c">★'+vo.grade+'&nbsp'+vo.content+'</div>';
						tag += '</div>'
					});
					
					
					$("#memberReview").html(tag);
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
					
					var tag = '<ul class="memFavorList">';
					$result.each(function(idx, vo){
						tag += '<li><a href="#"><img src="/img/noImg.jpg">';
						tag += '<span>'+vo.resname+'<br/></span>';
						tag += '<span>'+vo.resnation+'&nbsp'+vo.resstate+'<br/></span>';
						tag += '<span>★'+vo.resgrade+'</span></a></li>';
					});
					tag += '</ul>';
					
					$("#memberFavor").html(tag);
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		}
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
						tag += '<div id="memberReservList">'; <!-- 반복될부분 -->
						tag += '<div id="memberReserv">'; <!-- 예약정보 -->
						tag += '<ul>';
						if(vo.status == "apply"){
						tag += '<li>예약 가능여부를 확인중 입니다.</li>';
						tag += '<li>['+vo.resname+']에서 확인하는대로 빠른 시간내 결과를 안내해 드리겠습니다.</li>';
						};
						if(vo.status == "reject"){
						tag += '<li>예약이 거부되었습니다.</li>';
						tag += '<li>자세한 문의사항은 아래 문의 이메일로 연락주시길바랍니다.</li>';
						};
						if(vo.status == "cancel"){
						tag += '<li>예약을 취소하셨습니다.</li>';
						tag += '<li>예약 취소가 완료되었습니다.</li>';
						};
						if(vo.status == "ok"){
						tag += '<li>예약이 승인되었습니다.</li>';
						tag += '<li>만약 예약을 취소하시려면 아래 문의 이메일로 연락주시길바랍니다.</li>';
						};
						tag += '<li>'+vo.resname+'</li>';
						tag += '<li><hr/></li>';
						tag += '<li>예약날짜: <span>'+vo.reservdate+'&nbsp'+vo.reservtime+'</span></li>';
						tag += '<li>인원: <span>'+vo.reservp+'명</span></li>';
						tag += '<li>문의: <span>'+vo.website+'</span></li>';
						if(vo.status == "apply"){
						tag += '<li id="btn"><input type="button" value="예약취소"></li>';
						};
						if(vo.status == "cancel" || vo.status == "reject"){
						tag += '<li id="btn"><input type="button" value="삭제"></li>';
						};
						tag += '</ul>';
						tag += '</div>';
						tag += '<div id="writedate">'+vo.writedate+'</div>';
						tag += '</div>';
					});
					$("#memberReserv").html(tag);
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		}
		memberReserv();
	});
</script>
<div class='container'>
	<div class='mypage_menu'>
		<h1>마이페이지</h1>
		<ul>
			<li class="on">회원정보수정</li>
			<li style="display: none">회원정보수정</li>
			<li>예약현황</li>
			<li>내리뷰보기</li>
			<li>즐겨찾기</li>
		</ul>
	</div>
	<div class='mypage_container'>

		<div class="on">
			<h3>회원정보 수정</h3>
			<div id="memberEdit">
				<!-- <form method="post" action="/member/memberEdit2" id="mFrm"> -->
					<ul>
						<li>아이디</li>
						<li><input type="text" name="userid" id="userid1" value="${vo.userid}" readonly></li>
						<li>비밀번호</li>
						<li><input type="text" name="userpwd" id="userpwd1" placeholder="비밀번호입력"></li>
						<li><input type="button" id="pwdChk" value="확인하기"></li>
					</ul>
			</div>
		</div>

		<div>
			<h3>회원정보 수정</h3>
			<div id="memberEdit2">
				<div style="display: block" id="content1">
					<form method="post" action="/member/memberEditOk" id="mFrm">
						<ul>
							<li>아이디
								<input type="text" name="usertype" id="usertype" value="${vo.usertype}" style="display: none">
								<c:if test="${vo.usertype=='owner'}">(사업주)</c:if>
								<c:if test="${vo.usertype=='owner(jin)'}">(사업주 승인대기)</c:if>
								<c:if test="${vo.usertype=='normal'}">(일반회원) <input id="chgbtn"type="button" value="사업주등록신청"></c:if>
							</li>
							<li><input type="text" name="userid" value="${vo.userid}" readonly style="all:none"></li>
							<li>국적</li>
							<li>
     							 <select id="usernation" name="usernation" >
        							 <script>
     									 DrDw2("~국가선택~AF~Afghanistan~AL~Albania~DZ~Algeria~AS~American Samoa~AD~Andorra~AO~Angola~AI~Anguilla~AQ~Antarctica~AG~Antigua and Barbuda~AR~Argentina~AM~Armenia~AW~Aruba~AC~Ascension Island~AU~Australia~AT~Austria~AZ~Azerbaijan~BS~Bahamas~BH~Bahrain~BD~Bangladesh~BB~Barbados~BY~Belarus~BE~Belgium~BZ~Belize~BJ~Benin~BM~Bermuda~BT~Bhutan~BO~Bolivia~BA~Bosnia and Herzegovina~BW~Botswana~BV~Bouvet Island~BR~Brazil~IO~British Indian Ocean Territory~BN~Brunei~BG~Bulgaria~BF~Burkina Faso~BI~Burundi~KH~Cambodia~CM~Cameroon~CA~Canada~CV~Cape Verde~KY~Cayman Islands~CF~Central African Republic~TD~Chad~CL~Chile~CN~China~CX~Christmas Island~CC~Cocos (Keeling) Islands~CO~Colombia~KM~Comoros~CG~Congo~CD~Congo (DRC)~CK~Cook Islands~CR~Costa Rica~HR~Croatia~CU~Cuba~CY~Cyprus~CZ~Czech Republic~DK~Denmark~DJ~Djibouti~DM~Dominica~DO~Dominican Republic~EC~Ecuador~EG~Egypt~SV~El Salvador~GQ~Equatorial Guinea~ER~Eritrea~EE~Estonia~ET~Ethiopia~FK~Falkland Islands (Islas Malvinas)~FO~Faroe Islands~FJ~Fiji Islands~FI~Finland~FR~France~GF~French Guiana~PF~French Polynesia~TF~French Southern and Antarctic Lands~GA~Gabon~GM~Gambia, The~GE~Georgia~DE~Germany~GH~Ghana~GI~Gibraltar~GR~Greece~GL~Greenland~GD~Grenada~GP~Guadeloupe~GU~Guam~GT~Guatemala~GG~Guernsey~GN~Guinea~GW~Guinea-Bissau~GY~Guyana~HT~Haiti~HM~Heard Island and McDonald Islands~HN~Honduras~HK~Hong Kong SAR~HU~Hungary~IS~Iceland~IN~India~ID~Indonesia~IR~Iran~IQ~Iraq~IE~Ireland~IM~Isle of Man~IL~Israel~IT~Italy~JM~Jamaica~JP~Japan~JE~Jersey~JO~Jordan~KZ~Kazakhstan~KE~Kenya~KI~Kiribati~KR~Korea~KW~Kuwait~KG~Kyrgyzstan~LA~Laos~LV~Latvia~LB~Lebanon~LS~Lesotho~LR~Liberia~LY~Libya~LI~Liechtenstein~LT~Lithuania~LU~Luxembourg~MO~Macao SAR~MK~Macedonia, Former Yugoslav Republic of~MG~Madagascar~MW~Malawi~MY~Malaysia~MV~Maldives~ML~Mali~MT~Malta~MH~Marshall Islands~MQ~Martinique~MR~Mauritania~MU~Mauritius~YT~Mayotte~MX~Mexico~FM~Micronesia~MD~Moldova~MC~Monaco~MN~Mongolia~MS~Montserrat~MA~Morocco~MZ~Mozambique~MM~Myanmar~NA~Namibia~NR~Nauru~NP~Nepal~NL~Netherlands~AN~Netherlands Antilles~NC~New Caledonia~NZ~New Zealand~NI~Nicaragua~NE~Niger~NG~Nigeria~NU~Niue~NF~Norfolk Island~KP~North Korea~MP~Northern Mariana Islands~NO~Norway~OM~Oman~PK~Pakistan~PW~Palau~PS~Palestinian Authority~PA~Panama~PG~Papua New Guinea~PY~Paraguay~PE~Peru~PH~Philippines~PN~Pitcairn Islands~PL~Poland~PT~Portugal~PR~Puerto Rico~QA~Qatar~RE~Reunion~RO~Romania~RU~Russia~RW~Rwanda~WS~Samoa~SM~San Marino~ST~S? Tom?and Pr?cipe~SA~Saudi Arabia~SN~Senegal~YU~Serbia and Montenegro~SC~Seychelles~SL~Sierra Leone~SG~Singapore~SK~Slovakia~SI~Slovenia~SB~Solomon Islands~SO~Somalia~ZA~South Africa~GS~South Georgia and the South Sandwich Islands~ES~Spain~LK~Sri Lanka~SH~St. Helena~KN~St. Kitts and Nevis~LC~St. Lucia~PM~St. Pierre and Miquelon~VC~St. Vincent and the Grenadines~SD~Sudan~SR~Suriname~SJ~Svalbard and Jan Mayen~SZ~Swaziland~SE~Sweden~CH~Switzerland~SY~Syria~TW~Taiwan~TJ~Tajikistan~TZ~Tanzania~TH~Thailand~TP~Timor-Leste~TG~Togo~TK~Tokelau~TO~Tonga~TT~Trinidad and Tobago~TA~Tristan da Cunha~TN~Tunisia~TR~Turkey~TM~Turkmenistan~TC~Turks and Caicos Islands~TV~Tuvalu~UG~Uganda~UA~Ukraine~AE~United Arab Emirates~UK~United Kingdom~US~United States~UM~United States Minor Outlying Islands~UY~Uruguay~UZ~Uzbekistan~VU~Vanuatu~VA~Vatican City~VE~Venezuela~VN~Vietnam~VI~Virgin Islands~VG~Virgin Islands, British~WF~Wallis and Futuna~YE~Yemen~ZM~Zambia~ZW~Zimbabwe","${vo.usernation}");
									</script>
     							 </select>
      						</li>
							<li>여행 선호 국가</li>
							<li>
								<select id="favornation" name="favornation" >
        							 <script>
    								  	DrDw2("~국가선택~AF~Afghanistan~AL~Albania~DZ~Algeria~AS~American Samoa~AD~Andorra~AO~Angola~AI~Anguilla~AQ~Antarctica~AG~Antigua and Barbuda~AR~Argentina~AM~Armenia~AW~Aruba~AC~Ascension Island~AU~Australia~AT~Austria~AZ~Azerbaijan~BS~Bahamas~BH~Bahrain~BD~Bangladesh~BB~Barbados~BY~Belarus~BE~Belgium~BZ~Belize~BJ~Benin~BM~Bermuda~BT~Bhutan~BO~Bolivia~BA~Bosnia and Herzegovina~BW~Botswana~BV~Bouvet Island~BR~Brazil~IO~British Indian Ocean Territory~BN~Brunei~BG~Bulgaria~BF~Burkina Faso~BI~Burundi~KH~Cambodia~CM~Cameroon~CA~Canada~CV~Cape Verde~KY~Cayman Islands~CF~Central African Republic~TD~Chad~CL~Chile~CN~China~CX~Christmas Island~CC~Cocos (Keeling) Islands~CO~Colombia~KM~Comoros~CG~Congo~CD~Congo (DRC)~CK~Cook Islands~CR~Costa Rica~HR~Croatia~CU~Cuba~CY~Cyprus~CZ~Czech Republic~DK~Denmark~DJ~Djibouti~DM~Dominica~DO~Dominican Republic~EC~Ecuador~EG~Egypt~SV~El Salvador~GQ~Equatorial Guinea~ER~Eritrea~EE~Estonia~ET~Ethiopia~FK~Falkland Islands (Islas Malvinas)~FO~Faroe Islands~FJ~Fiji Islands~FI~Finland~FR~France~GF~French Guiana~PF~French Polynesia~TF~French Southern and Antarctic Lands~GA~Gabon~GM~Gambia, The~GE~Georgia~DE~Germany~GH~Ghana~GI~Gibraltar~GR~Greece~GL~Greenland~GD~Grenada~GP~Guadeloupe~GU~Guam~GT~Guatemala~GG~Guernsey~GN~Guinea~GW~Guinea-Bissau~GY~Guyana~HT~Haiti~HM~Heard Island and McDonald Islands~HN~Honduras~HK~Hong Kong SAR~HU~Hungary~IS~Iceland~IN~India~ID~Indonesia~IR~Iran~IQ~Iraq~IE~Ireland~IM~Isle of Man~IL~Israel~IT~Italy~JM~Jamaica~JP~Japan~JE~Jersey~JO~Jordan~KZ~Kazakhstan~KE~Kenya~KI~Kiribati~KR~Korea~KW~Kuwait~KG~Kyrgyzstan~LA~Laos~LV~Latvia~LB~Lebanon~LS~Lesotho~LR~Liberia~LY~Libya~LI~Liechtenstein~LT~Lithuania~LU~Luxembourg~MO~Macao SAR~MK~Macedonia, Former Yugoslav Republic of~MG~Madagascar~MW~Malawi~MY~Malaysia~MV~Maldives~ML~Mali~MT~Malta~MH~Marshall Islands~MQ~Martinique~MR~Mauritania~MU~Mauritius~YT~Mayotte~MX~Mexico~FM~Micronesia~MD~Moldova~MC~Monaco~MN~Mongolia~MS~Montserrat~MA~Morocco~MZ~Mozambique~MM~Myanmar~NA~Namibia~NR~Nauru~NP~Nepal~NL~Netherlands~AN~Netherlands Antilles~NC~New Caledonia~NZ~New Zealand~NI~Nicaragua~NE~Niger~NG~Nigeria~NU~Niue~NF~Norfolk Island~KP~North Korea~MP~Northern Mariana Islands~NO~Norway~OM~Oman~PK~Pakistan~PW~Palau~PS~Palestinian Authority~PA~Panama~PG~Papua New Guinea~PY~Paraguay~PE~Peru~PH~Philippines~PN~Pitcairn Islands~PL~Poland~PT~Portugal~PR~Puerto Rico~QA~Qatar~RE~Reunion~RO~Romania~RU~Russia~RW~Rwanda~WS~Samoa~SM~San Marino~ST~S? Tom?and Pr?cipe~SA~Saudi Arabia~SN~Senegal~YU~Serbia and Montenegro~SC~Seychelles~SL~Sierra Leone~SG~Singapore~SK~Slovakia~SI~Slovenia~SB~Solomon Islands~SO~Somalia~ZA~South Africa~GS~South Georgia and the South Sandwich Islands~ES~Spain~LK~Sri Lanka~SH~St. Helena~KN~St. Kitts and Nevis~LC~St. Lucia~PM~St. Pierre and Miquelon~VC~St. Vincent and the Grenadines~SD~Sudan~SR~Suriname~SJ~Svalbard and Jan Mayen~SZ~Swaziland~SE~Sweden~CH~Switzerland~SY~Syria~TW~Taiwan~TJ~Tajikistan~TZ~Tanzania~TH~Thailand~TP~Timor-Leste~TG~Togo~TK~Tokelau~TO~Tonga~TT~Trinidad and Tobago~TA~Tristan da Cunha~TN~Tunisia~TR~Turkey~TM~Turkmenistan~TC~Turks and Caicos Islands~TV~Tuvalu~UG~Uganda~UA~Ukraine~AE~United Arab Emirates~UK~United Kingdom~US~United States~UM~United States Minor Outlying Islands~UY~Uruguay~UZ~Uzbekistan~VU~Vanuatu~VA~Vatican City~VE~Venezuela~VN~Vietnam~VI~Virgin Islands~VG~Virgin Islands, British~WF~Wallis and Futuna~YE~Yemen~ZM~Zambia~ZW~Zimbabwe","${vo.favornation}");
									 </script>
     							</select>
     							<select id="favorstate" name="favorstate">
									<option value='' >지역선택</option>
									<option value='${vo.favorstate}' selected>${vo.favorstate}</option>
								</select>
							</li>
							<li>이름</li>
							<li><input type="text" name="username" value="${vo.username}"></li>
							<li>연락처</li>
							<li>
								<select class="inputStyletel1" name='telArray' id='tel1'>
									<option value="010" <c:if test="${vo.tel1=='010'}">selected</c:if>>010</option>
									<option value="011" <c:if test="${vo.tel1=='011'}">selected</c:if>>011</option>
									<option value="016" <c:if test="${vo.tel1=='016'}">selected</c:if>>016</option>
									<option value="017" <c:if test="${vo.tel1=='017'}">selected</c:if>>017</option>
									<option value="018" <c:if test="${vo.tel1=='018'}">selected</c:if>>018</option>
									<option value="019" <c:if test="${vo.tel1=='019'}">selected</c:if>>019</option>
								</select>
								 - <input class="inputStyletel2" type="text" name="telArray" id="tel2" placeholder='휴대전화번호를 -없이 입력해 주세요.' value="${vo.tel2 }"/>
							 </li>
							 <li><input type="submit" value="수정하기"></li>
							</ul>
					</form>
				</div>
			</div>
		</div>

		<div>
			<h3>예약현황</h3>
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


