<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="https://kit.fontawesome.com/d6e34900cd.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/restaurantInfo.js" defer></script>

<script>
$(document).ready(function() {
	$("#heart_in").click(function() {
		var params = "resno= "+$(this).attr('value');
		var url = "/memFavor/memFavorInsert";
		$.ajax({
			url: url,
			data: params,
			type: "get",
			success: function(result){
				history.go(0);			
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	});
	$("#heart_out").click(function() {
		var params = "no= "+$(this).attr('value');
		var url = "/memFavor/memFavorDelete";
		$.ajax({
			url: url,
			data: params,
			type: "get",
			success: function(result){
				history.go(0);			
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	});
	$('.timepicker').timepicker({
	    timeFormat: 'h:mm p',
	    interval: 30,
	    minTime: "${vo.reshour}",
	    maxTime: "${vo.reshourend}",
	    defaultTime: '9',
	    startTime: '9:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	$('#memReserv').submit(function(){
		event.preventDefault();
		if($("#reservDate").val()=="" || $("#reservTime").val()=="" || $("#reservp").val()==""){
			alert("정확한 날짜, 시간, 인원을 선택해주세요.");
			return false;
		}
		
	});
	    
});

</script>

<style>
.container{
	width: 1200px;
	margin: 0px auto;
}

.img_box{
	width: 100%;
	height: 500px;
	position: relative;
}
#ownerImage, #reviewImage{
	float: left;
	width: 50%;
	height: 100%;
	filter: brightness(50%);
}
.maininfo{
	width: 1200px;
	height: 150px;
	position: absolute;
	bottom: 0%;
	left: 50%;
	transform: translate(-50%, 0);
	color: white;
}
.resname{
	font-size: 48px;
	font-weight: 700;
	word-break: break-word !important;
    overflow-wrap: break-word !important;
}
.score{
	font-size: 18px;
    font-weight: 600;
}
.score i{
	color: red;
}
.restype{
	font-size: 18px;
	font-weight: 600;
}
.resOnOff{
	font-size: 18px;
    font-weight: 600;
    color: rgba(2,161,109,1);
}
.reshour{
	font-size: 18px;
    font-weight: 600;
}

.btn_box{
	float: left;
	width: 890px;
	margin: 30px auto;
	position: relative;
	height: 40px;
    line-height: 40px;
}
.btn_box div:first-child{
	float: left;
	margin-right: 14px;
}
.review{
	cursor: pointer;
	background-color: rgba(224,7,7,1);
	color: rgba(255,255,255,1);
	vertical-align: middle;
	border: 0;
    border-radius: 4px;
    padding: 8px 16px 8px 16px;
    font-size: 20px;
}
.reservation{
	cursor: pointer;
	background-color: transparent;
	border: 1px solid rgba(200,201,202,1);
	border-radius: 4px;
	padding: 8px 16px 8px 16px;
    color: rgba(45,46,47,1);
    font-size: 20px;
    height: 43px;
    margin-right: 10px;
}
.favorites{
	cursor: pointer;
	background-color: transparent;
	border: 1px solid rgba(200,201,202,1);
	border-radius: 4px;
	padding: 8px 16px 8px 16px;
    color: rgba(45,46,47,1);
    font-size: 20px;
    height: 43px;
}

.border{
	float: left;
	width: 890px;
	border-top: 1px solid rgba(62, 97, 103, 0.3);
	height: 30px;
}

.infoBox{
	float: right;
	width: 280px;
	height: 240px;
	line-height: 80px;
	border: 1px solid rgba(62, 97, 103, 0.3);
	border-radius: 4px;
	margin-top:-70px;
	font-size: 18px;
	padding: 10px;
}
.infoBox div:nth-child(1){
	height: 40px;
	line-height: 40px;
	color: rgba(2,122,151,1);
	font-weight: bold;
}
.infoBox div:nth-child(2){
	border-top: 1px solid rgba(62, 97, 103, 0.3);
	border-bottom: 1px solid rgba(62, 97, 103, 0.3);
	height: 120px;
	line-height: 40px;
	text-overflow: ellipsis;
	white-space: break-word;
	display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
	overflow: hidden;
}
.infoBox div:nth-child(2) span{
	color: rgba(2,122,151,1);
	font-weight: bold;
}
.infoBox div:nth-child(3){
	height: 80px;
	line-height: 40px;
}
.infoBox div:nth-child(3) span{
	color: rgba(2,122,151,1);
	font-weight: bold;
}

.faqBox, .about{
	float: left;
	width: 870px;
	line-height: 30px;
	padding: 10px;
}
.title{
	font-size: 20px;
    font-weight: 700;
    line-height: 40px;
}
.question{
	font-weight: bold;
}
.answer{
	margin-left: 15px;
}

.reviewBox{
	float: left;
	width: 870px;
	height: 350px;
	line-height: 30px;
	padding: 10px;
	margin-bottom: 50px;
}
.reviewBox form{
	border: 1px solid rgba(62, 97, 103, 0.3);
	border-radius: 4px;
	width: 870px;
	height: 300px;
}
.star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
  margin-left: 5%;
  margin-top: 20px;
}
.star-rating input {
  display:none;
}
.star-rating label {
  color:#ccc;
  cursor:pointer;
}
.star-rating :checked ~ label {
  color:#f90;
}
.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}
.reviewBox form textarea{
	width: 800px;
	height: 120px;
	line-height: 30px;
	margin: 30px;
	resize: none;
	border: none;
}
.reviewBox form button{
    background-color: rgba(224,7,7,1);
    color: rgba(255,255,255,1);
    border: 0;
    border-radius: 4px;
    padding: 8px 16px 16px 8px;
    cursor: pointer;
    width: 200px;
    height: 40px;
    text-align: center;
    vertical-align: middle;
    float: right;
    margin-right: 5%;
}
.reviewBox form button:hover{
    background-color: rgb(244,13,21);
    color: rgba(255,255,255,1);
    box-shadow: 0 1px 4px 0 rgb(0 0 0 / 30%);
}


/* reservation_box */
.reservation_box {
  display: none;
}
.reservation_box.show {
  display: block;
}
.reservation_box .reservation_box_bg {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: #000;
  opacity: 0.5;
}
.reservation_box .date_setting {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 40%;
  height: 50%;
  background-color: #fff;
  padding: 2rem;
  border-radius: 20px;
}
.reservation_box .date_setting > button {
  font-size: 2rem;
  position: absolute;
  top: 0;
  right: 0;
  margin: 2rem;
  border: none;
  background: none;
  cursor: pointer;
}
.reservation_box .date_setting h3 {
  font-size: 2rem;
  margin-bottom: 2rem;
}
.test{
  position: relative;
  background-color: red;
}
</style>

<div class="img_box">
	<!-- 업주가 식당등록할때 등록하는 이미지 -->
	<img id="ownerImage" src="/img/noImg.jpg"/>
	<!-- 리뷰 작성자가 리뷰에 넣는 이미지 -->
	<img id="reviewImage" src="/img/noImg.jpg"/>
	
	<div class="maininfo">
		<span class="resname">${vo.resname}</span>
		<div class="score">
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<span>${vo.resgrade}</span>
		</div>
		<span class="restype">${vo.restype}</span><br/>
	</div>
</div>

<div class="container">
	<div class="btn_box">
		<div>
			<a class="review">☆ 리뷰작성</a>
		</div>
		<c:if test="${logId!=null }">
		<button class="reservation">☎ 예약하기</button>
			<c:if test="${memfavor == 0}">
			<button class="favorites" id="heart_in" value="${vo.resno}">
          		<i class="fa-regular fa-heart"></i>
          		&nbsp;즐겨찾기
          	</button>
          	</c:if>
          	<c:if test="${memfavor != 0 }">
          	<button class="favorites" id="heart_out" value="${memfavor}">
          		<i class="fa-solid fa-heart"></i>
          		&nbsp;즐겨찾기
          	</button>
          	</c:if>
		</c:if>
	</div>
	
	<div class="border"></div>
	
	<div class="infoBox">
		<div>${vo.website}</div>
		<div><span>주소</span><br/>${vo.resadress}</div>
		<div><span>영업시간</span><br/>${vo.reshour} - ${vo.reshourend}</div>
	</div>
	
	<div class="faqBox">
		<span class="title">FAQ</span><br/><br/>
	<!-- FAQ질문&답변 반복 -->
		<span class="question">vo.content(FAQ질문)</span><br/>
		<span class="answer">vo.content(FAQ답변)</span>
	</div>
	
	<div class="border"></div>
	
	<div class="about">
		<span class="title">ABOUT</span><br/><br/>
	<!-- 레스토랑 설명 -->
		<span> vo.rescontent</span>
	</div>
	
	<div class="border"></div>
	
	<div class="reviewBox">
		<span class="title">REVIEW</span><br/><br/>
		<form>
			<div class="star-rating">
				<input type="radio" id="5-stars" name="rating" value="5" />
				<label for="5-stars" class="star">&#9733;</label>
				<input type="radio" id="4-stars" name="rating" value="4" />
				<label for="4-stars" class="star">&#9733;</label>
				<input type="radio" id="3-stars" name="rating" value="3" />
				<label for="3-stars" class="star">&#9733;</label>
				<input type="radio" id="2-stars" name="rating" value="2" />
				<label for="2-stars" class="star">&#9733;</label>
				<input type="radio" id="1-star" name="rating" value="1" />
				<label for="1-star" class="star">&#9733;</label>
			</div>
			<textarea name="content" id="content" placeholder="내용을 작성해 주세요."></textarea>
			<button type="submit">리뷰등록</button>
		</form>
	</div>
	<div id="reviewList">
	</div>
			
			
<div class="reservation_box">
	<div class="reservation_box_bg"></div>
		<div class="date_setting">
			<h3>Setting the Reservation date</h3>
			<button>✖</button>
		<form id="memReserv">
      	 <fmt:formatDate value="<%=new java.util.Date()%>" var="today" pattern="yyyy-MM-dd"/>
         <input type="date" id="reservDate" min="${today}">
         <input id="reservTime" class="timepicker">
         <input type="time" step="900">
         <input type="hidden" value="${vo.resno}">
       	<select name="reservp" id="reservp">
        	<option value="" selected>인원선택</option>
        	<option value="1">1명</option>
        	<option value="2">2명</option>
        	<option value="3">3명</option>
        	<option value="4">4명</option>
        	<option value="5">5명</option>
        	<option value="6">6명</option>
        	<option value="7">7명</option>
        	<option value="8">8명</option>
        	<option value="9">9명</option>
        	<option value="10">10명</option>
        </select>

        <button>submit</button>
      </form>
		</div>
	</div>
</div>