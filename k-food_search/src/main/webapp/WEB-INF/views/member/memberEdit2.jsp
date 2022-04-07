<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<link rel="stylesheet" href="/css/memberEdit2.css" type="text/css"/>
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
}
$(()=>{
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
});
</script>

<div class='container'>
<%@ include file="mypage.jsp" %>
<div class='mypage_container'>
	<h1>회원정보 수정2</h1>
	<div style="display: block" id="content1">
	<form id="mFrm">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" value="${vo.userid}" readonly style="all:none"></li>
			<li>국적</li>
			<li>
      <select id="nation" name="nation" >
         <script>
      DrDw2("~국가선택~AF~Afghanistan~AL~Albania~DZ~Algeria~AS~American Samoa~AD~Andorra~AO~Angola~AI~Anguilla~AQ~Antarctica~AG~Antigua and Barbuda~AR~Argentina~AM~Armenia~AW~Aruba~AC~Ascension Island~AU~Australia~AT~Austria~AZ~Azerbaijan~BS~Bahamas~BH~Bahrain~BD~Bangladesh~BB~Barbados~BY~Belarus~BE~Belgium~BZ~Belize~BJ~Benin~BM~Bermuda~BT~Bhutan~BO~Bolivia~BA~Bosnia and Herzegovina~BW~Botswana~BV~Bouvet Island~BR~Brazil~IO~British Indian Ocean Territory~BN~Brunei~BG~Bulgaria~BF~Burkina Faso~BI~Burundi~KH~Cambodia~CM~Cameroon~CA~Canada~CV~Cape Verde~KY~Cayman Islands~CF~Central African Republic~TD~Chad~CL~Chile~CN~China~CX~Christmas Island~CC~Cocos (Keeling) Islands~CO~Colombia~KM~Comoros~CG~Congo~CD~Congo (DRC)~CK~Cook Islands~CR~Costa Rica~HR~Croatia~CU~Cuba~CY~Cyprus~CZ~Czech Republic~DK~Denmark~DJ~Djibouti~DM~Dominica~DO~Dominican Republic~EC~Ecuador~EG~Egypt~SV~El Salvador~GQ~Equatorial Guinea~ER~Eritrea~EE~Estonia~ET~Ethiopia~FK~Falkland Islands (Islas Malvinas)~FO~Faroe Islands~FJ~Fiji Islands~FI~Finland~FR~France~GF~French Guiana~PF~French Polynesia~TF~French Southern and Antarctic Lands~GA~Gabon~GM~Gambia, The~GE~Georgia~DE~Germany~GH~Ghana~GI~Gibraltar~GR~Greece~GL~Greenland~GD~Grenada~GP~Guadeloupe~GU~Guam~GT~Guatemala~GG~Guernsey~GN~Guinea~GW~Guinea-Bissau~GY~Guyana~HT~Haiti~HM~Heard Island and McDonald Islands~HN~Honduras~HK~Hong Kong SAR~HU~Hungary~IS~Iceland~IN~India~ID~Indonesia~IR~Iran~IQ~Iraq~IE~Ireland~IM~Isle of Man~IL~Israel~IT~Italy~JM~Jamaica~JP~Japan~JE~Jersey~JO~Jordan~KZ~Kazakhstan~KE~Kenya~KI~Kiribati~KR~Korea~KW~Kuwait~KG~Kyrgyzstan~LA~Laos~LV~Latvia~LB~Lebanon~LS~Lesotho~LR~Liberia~LY~Libya~LI~Liechtenstein~LT~Lithuania~LU~Luxembourg~MO~Macao SAR~MK~Macedonia, Former Yugoslav Republic of~MG~Madagascar~MW~Malawi~MY~Malaysia~MV~Maldives~ML~Mali~MT~Malta~MH~Marshall Islands~MQ~Martinique~MR~Mauritania~MU~Mauritius~YT~Mayotte~MX~Mexico~FM~Micronesia~MD~Moldova~MC~Monaco~MN~Mongolia~MS~Montserrat~MA~Morocco~MZ~Mozambique~MM~Myanmar~NA~Namibia~NR~Nauru~NP~Nepal~NL~Netherlands~AN~Netherlands Antilles~NC~New Caledonia~NZ~New Zealand~NI~Nicaragua~NE~Niger~NG~Nigeria~NU~Niue~NF~Norfolk Island~KP~North Korea~MP~Northern Mariana Islands~NO~Norway~OM~Oman~PK~Pakistan~PW~Palau~PS~Palestinian Authority~PA~Panama~PG~Papua New Guinea~PY~Paraguay~PE~Peru~PH~Philippines~PN~Pitcairn Islands~PL~Poland~PT~Portugal~PR~Puerto Rico~QA~Qatar~RE~Reunion~RO~Romania~RU~Russia~RW~Rwanda~WS~Samoa~SM~San Marino~ST~S? Tom?and Pr?cipe~SA~Saudi Arabia~SN~Senegal~YU~Serbia and Montenegro~SC~Seychelles~SL~Sierra Leone~SG~Singapore~SK~Slovakia~SI~Slovenia~SB~Solomon Islands~SO~Somalia~ZA~South Africa~GS~South Georgia and the South Sandwich Islands~ES~Spain~LK~Sri Lanka~SH~St. Helena~KN~St. Kitts and Nevis~LC~St. Lucia~PM~St. Pierre and Miquelon~VC~St. Vincent and the Grenadines~SD~Sudan~SR~Suriname~SJ~Svalbard and Jan Mayen~SZ~Swaziland~SE~Sweden~CH~Switzerland~SY~Syria~TW~Taiwan~TJ~Tajikistan~TZ~Tanzania~TH~Thailand~TP~Timor-Leste~TG~Togo~TK~Tokelau~TO~Tonga~TT~Trinidad and Tobago~TA~Tristan da Cunha~TN~Tunisia~TR~Turkey~TM~Turkmenistan~TC~Turks and Caicos Islands~TV~Tuvalu~UG~Uganda~UA~Ukraine~AE~United Arab Emirates~UK~United Kingdom~US~United States~UM~United States Minor Outlying Islands~UY~Uruguay~UZ~Uzbekistan~VU~Vanuatu~VA~Vatican City~VE~Venezuela~VN~Vietnam~VI~Virgin Islands~VG~Virgin Islands, British~WF~Wallis and Futuna~YE~Yemen~ZM~Zambia~ZW~Zimbabwe","");
		</script>
      </select>
      		</li>
			<li>여행 선호 국가</li>
			<li>
			<select id="favornation" name="favornation" >
         <script>
      DrDw2("~국가선택~AF~Afghanistan~AL~Albania~DZ~Algeria~AS~American Samoa~AD~Andorra~AO~Angola~AI~Anguilla~AQ~Antarctica~AG~Antigua and Barbuda~AR~Argentina~AM~Armenia~AW~Aruba~AC~Ascension Island~AU~Australia~AT~Austria~AZ~Azerbaijan~BS~Bahamas~BH~Bahrain~BD~Bangladesh~BB~Barbados~BY~Belarus~BE~Belgium~BZ~Belize~BJ~Benin~BM~Bermuda~BT~Bhutan~BO~Bolivia~BA~Bosnia and Herzegovina~BW~Botswana~BV~Bouvet Island~BR~Brazil~IO~British Indian Ocean Territory~BN~Brunei~BG~Bulgaria~BF~Burkina Faso~BI~Burundi~KH~Cambodia~CM~Cameroon~CA~Canada~CV~Cape Verde~KY~Cayman Islands~CF~Central African Republic~TD~Chad~CL~Chile~CN~China~CX~Christmas Island~CC~Cocos (Keeling) Islands~CO~Colombia~KM~Comoros~CG~Congo~CD~Congo (DRC)~CK~Cook Islands~CR~Costa Rica~HR~Croatia~CU~Cuba~CY~Cyprus~CZ~Czech Republic~DK~Denmark~DJ~Djibouti~DM~Dominica~DO~Dominican Republic~EC~Ecuador~EG~Egypt~SV~El Salvador~GQ~Equatorial Guinea~ER~Eritrea~EE~Estonia~ET~Ethiopia~FK~Falkland Islands (Islas Malvinas)~FO~Faroe Islands~FJ~Fiji Islands~FI~Finland~FR~France~GF~French Guiana~PF~French Polynesia~TF~French Southern and Antarctic Lands~GA~Gabon~GM~Gambia, The~GE~Georgia~DE~Germany~GH~Ghana~GI~Gibraltar~GR~Greece~GL~Greenland~GD~Grenada~GP~Guadeloupe~GU~Guam~GT~Guatemala~GG~Guernsey~GN~Guinea~GW~Guinea-Bissau~GY~Guyana~HT~Haiti~HM~Heard Island and McDonald Islands~HN~Honduras~HK~Hong Kong SAR~HU~Hungary~IS~Iceland~IN~India~ID~Indonesia~IR~Iran~IQ~Iraq~IE~Ireland~IM~Isle of Man~IL~Israel~IT~Italy~JM~Jamaica~JP~Japan~JE~Jersey~JO~Jordan~KZ~Kazakhstan~KE~Kenya~KI~Kiribati~KR~Korea~KW~Kuwait~KG~Kyrgyzstan~LA~Laos~LV~Latvia~LB~Lebanon~LS~Lesotho~LR~Liberia~LY~Libya~LI~Liechtenstein~LT~Lithuania~LU~Luxembourg~MO~Macao SAR~MK~Macedonia, Former Yugoslav Republic of~MG~Madagascar~MW~Malawi~MY~Malaysia~MV~Maldives~ML~Mali~MT~Malta~MH~Marshall Islands~MQ~Martinique~MR~Mauritania~MU~Mauritius~YT~Mayotte~MX~Mexico~FM~Micronesia~MD~Moldova~MC~Monaco~MN~Mongolia~MS~Montserrat~MA~Morocco~MZ~Mozambique~MM~Myanmar~NA~Namibia~NR~Nauru~NP~Nepal~NL~Netherlands~AN~Netherlands Antilles~NC~New Caledonia~NZ~New Zealand~NI~Nicaragua~NE~Niger~NG~Nigeria~NU~Niue~NF~Norfolk Island~KP~North Korea~MP~Northern Mariana Islands~NO~Norway~OM~Oman~PK~Pakistan~PW~Palau~PS~Palestinian Authority~PA~Panama~PG~Papua New Guinea~PY~Paraguay~PE~Peru~PH~Philippines~PN~Pitcairn Islands~PL~Poland~PT~Portugal~PR~Puerto Rico~QA~Qatar~RE~Reunion~RO~Romania~RU~Russia~RW~Rwanda~WS~Samoa~SM~San Marino~ST~S? Tom?and Pr?cipe~SA~Saudi Arabia~SN~Senegal~YU~Serbia and Montenegro~SC~Seychelles~SL~Sierra Leone~SG~Singapore~SK~Slovakia~SI~Slovenia~SB~Solomon Islands~SO~Somalia~ZA~South Africa~GS~South Georgia and the South Sandwich Islands~ES~Spain~LK~Sri Lanka~SH~St. Helena~KN~St. Kitts and Nevis~LC~St. Lucia~PM~St. Pierre and Miquelon~VC~St. Vincent and the Grenadines~SD~Sudan~SR~Suriname~SJ~Svalbard and Jan Mayen~SZ~Swaziland~SE~Sweden~CH~Switzerland~SY~Syria~TW~Taiwan~TJ~Tajikistan~TZ~Tanzania~TH~Thailand~TP~Timor-Leste~TG~Togo~TK~Tokelau~TO~Tonga~TT~Trinidad and Tobago~TA~Tristan da Cunha~TN~Tunisia~TR~Turkey~TM~Turkmenistan~TC~Turks and Caicos Islands~TV~Tuvalu~UG~Uganda~UA~Ukraine~AE~United Arab Emirates~UK~United Kingdom~US~United States~UM~United States Minor Outlying Islands~UY~Uruguay~UZ~Uzbekistan~VU~Vanuatu~VA~Vatican City~VE~Venezuela~VN~Vietnam~VI~Virgin Islands~VG~Virgin Islands, British~WF~Wallis and Futuna~YE~Yemen~ZM~Zambia~ZW~Zimbabwe","");
		</script>
     		 </select>
     		 <select id="favorstate" name="favorstate">
				<option value='' selected>지역선택</option>
			</select>
			</li>
			<li>이름</li>
			<li><input type="text" name="userid" value="${vo.username}"></li>
			<li>연락처</li>
			<li>
			<select class="inputStyletel1" name='telArray' id='tel1'>
				<option value="010" selected>010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
			 - <input class="inputStyletel2" type="text" name="telArray" id="tel2" placeholder='휴대전화번호를 -없이 입력해 주세요.'/>
			 </li>
			 <li><input type="submit" value="수정하기"></li>
		</ul>
	</form>
	</div>
</div>
</div>