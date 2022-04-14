<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
<script>
	$(()=>{
		stateSet();
		
		$('#acordian div').mouseenter(function(){
			$(this).css('width','50%').css('transition-duration','0.5s');
		});
		$('#acordian div').mouseleave(function(){
			$(this).css('width','10%').css('transition-duration','0.5s');
		});
		
		ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        });
		
		$("#resnation").change(function(){
			stateSet()
		});
		
		var qna = "<span><select name='faqno'><c:forEach var='item' items='${faqList }'><option value='${item.no }'>${item.content }</option></c:forEach></select>";
		qna += "<input type='text' name='content'/><input type='button' value='x' onclick='faqDel()'/><br/></span>"
		$("#qna").click(function(){
			$("#qnaDiv").append(qna);
		});

		for(var i=0; i<document.querySelectorAll('#restype option').length; i++){
			if(document.querySelectorAll('#restype option')[i].value=='${vo.restype}'){
				document.querySelectorAll('#restype option')[i].setAttribute("selected", "true");
			}	
		}

	});
	
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
	
	function faqDel(){
		$(event.target).parent().remove();
	}
	
	function stateSet(){
		//console.log($("#favornation option:selected").val())
		//console.log($("#favornation option:selected").text())
		console.log('실행')
		var idx = $("#resnation option").index( $("#resnation option:selected") );
		var state = new Array();
		var target = document.querySelector("#resstate");
		
		//state[0] = ['테스트1','테스트2','테스트3'];
		state[114] = ['서울', '경기도', '마산'];
		target.options.length=1;
		
		for(i in state[idx]){
			var opt = document.createElement("option");
			opt.value = state[idx][i];
			opt.innerHTML = state[idx][i];
			if(opt.value =='${vo.resstate }'){
				opt.setAttribute("selected", "true");
			}
			target.appendChild(opt);
		}
	}
	
	function changeView(){
		$(event.target).parent().css('display','none');
		$('#resfile').css('display','block');
		$('#resimg').css('display','none');
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
				<script>
					DrDw2("~국가선택~AF~Afghanistan~AL~Albania~DZ~Algeria~AS~American Samoa~AD~Andorra~AO~Angola~AI~Anguilla~AQ~Antarctica~AG~Antigua and Barbuda~AR~Argentina~AM~Armenia~AW~Aruba~AC~Ascension Island~AU~Australia~AT~Austria~AZ~Azerbaijan~BS~Bahamas~BH~Bahrain~BD~Bangladesh~BB~Barbados~BY~Belarus~BE~Belgium~BZ~Belize~BJ~Benin~BM~Bermuda~BT~Bhutan~BO~Bolivia~BA~Bosnia and Herzegovina~BW~Botswana~BV~Bouvet Island~BR~Brazil~IO~British Indian Ocean Territory~BN~Brunei~BG~Bulgaria~BF~Burkina Faso~BI~Burundi~KH~Cambodia~CM~Cameroon~CA~Canada~CV~Cape Verde~KY~Cayman Islands~CF~Central African Republic~TD~Chad~CL~Chile~CN~China~CX~Christmas Island~CC~Cocos (Keeling) Islands~CO~Colombia~KM~Comoros~CG~Congo~CD~Congo (DRC)~CK~Cook Islands~CR~Costa Rica~HR~Croatia~CU~Cuba~CY~Cyprus~CZ~Czech Republic~DK~Denmark~DJ~Djibouti~DM~Dominica~DO~Dominican Republic~EC~Ecuador~EG~Egypt~SV~El Salvador~GQ~Equatorial Guinea~ER~Eritrea~EE~Estonia~ET~Ethiopia~FK~Falkland Islands (Islas Malvinas)~FO~Faroe Islands~FJ~Fiji Islands~FI~Finland~FR~France~GF~French Guiana~PF~French Polynesia~TF~French Southern and Antarctic Lands~GA~Gabon~GM~Gambia, The~GE~Georgia~DE~Germany~GH~Ghana~GI~Gibraltar~GR~Greece~GL~Greenland~GD~Grenada~GP~Guadeloupe~GU~Guam~GT~Guatemala~GG~Guernsey~GN~Guinea~GW~Guinea-Bissau~GY~Guyana~HT~Haiti~HM~Heard Island and McDonald Islands~HN~Honduras~HK~Hong Kong SAR~HU~Hungary~IS~Iceland~IN~India~ID~Indonesia~IR~Iran~IQ~Iraq~IE~Ireland~IM~Isle of Man~IL~Israel~IT~Italy~JM~Jamaica~JP~Japan~JE~Jersey~JO~Jordan~KZ~Kazakhstan~KE~Kenya~KI~Kiribati~KR~Korea~KW~Kuwait~KG~Kyrgyzstan~LA~Laos~LV~Latvia~LB~Lebanon~LS~Lesotho~LR~Liberia~LY~Libya~LI~Liechtenstein~LT~Lithuania~LU~Luxembourg~MO~Macao SAR~MK~Macedonia, Former Yugoslav Republic of~MG~Madagascar~MW~Malawi~MY~Malaysia~MV~Maldives~ML~Mali~MT~Malta~MH~Marshall Islands~MQ~Martinique~MR~Mauritania~MU~Mauritius~YT~Mayotte~MX~Mexico~FM~Micronesia~MD~Moldova~MC~Monaco~MN~Mongolia~MS~Montserrat~MA~Morocco~MZ~Mozambique~MM~Myanmar~NA~Namibia~NR~Nauru~NP~Nepal~NL~Netherlands~AN~Netherlands Antilles~NC~New Caledonia~NZ~New Zealand~NI~Nicaragua~NE~Niger~NG~Nigeria~NU~Niue~NF~Norfolk Island~KP~North Korea~MP~Northern Mariana Islands~NO~Norway~OM~Oman~PK~Pakistan~PW~Palau~PS~Palestinian Authority~PA~Panama~PG~Papua New Guinea~PY~Paraguay~PE~Peru~PH~Philippines~PN~Pitcairn Islands~PL~Poland~PT~Portugal~PR~Puerto Rico~QA~Qatar~RE~Reunion~RO~Romania~RU~Russia~RW~Rwanda~WS~Samoa~SM~San Marino~ST~S? Tom?and Pr?cipe~SA~Saudi Arabia~SN~Senegal~YU~Serbia and Montenegro~SC~Seychelles~SL~Sierra Leone~SG~Singapore~SK~Slovakia~SI~Slovenia~SB~Solomon Islands~SO~Somalia~ZA~South Africa~GS~South Georgia and the South Sandwich Islands~ES~Spain~LK~Sri Lanka~SH~St. Helena~KN~St. Kitts and Nevis~LC~St. Lucia~PM~St. Pierre and Miquelon~VC~St. Vincent and the Grenadines~SD~Sudan~SR~Suriname~SJ~Svalbard and Jan Mayen~SZ~Swaziland~SE~Sweden~CH~Switzerland~SY~Syria~TW~Taiwan~TJ~Tajikistan~TZ~Tanzania~TH~Thailand~TP~Timor-Leste~TG~Togo~TK~Tokelau~TO~Tonga~TT~Trinidad and Tobago~TA~Tristan da Cunha~TN~Tunisia~TR~Turkey~TM~Turkmenistan~TC~Turks and Caicos Islands~TV~Tuvalu~UG~Uganda~UA~Ukraine~AE~United Arab Emirates~UK~United Kingdom~US~United States~UM~United States Minor Outlying Islands~UY~Uruguay~UZ~Uzbekistan~VU~Vanuatu~VA~Vatican City~VE~Venezuela~VN~Vietnam~VI~Virgin Islands~VG~Virgin Islands, British~WF~Wallis and Futuna~YE~Yemen~ZM~Zambia~ZW~Zimbabwe","${vo.resnation }");
				</script>
			</select><br/>
			<span>매장 소속 지역</span><br/> 
			<select class="inputStylenation" id="resstate" name="resstate">
				<option value='' >지역선택</option>
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
			<span>${vo.resimg } <input type='button' value='x' onclick='changeView()'/></span>
			<input type='file' name='resimg1' id='resfile' style='display:none;'/><br/>
			<input type='hidden' name='resimgOrg' value='${vo.resimg}'/>
			<span>영업 시간</span><br/>
			<input type="time" name='reshour' value='${vo.reshour }'/><br/>
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