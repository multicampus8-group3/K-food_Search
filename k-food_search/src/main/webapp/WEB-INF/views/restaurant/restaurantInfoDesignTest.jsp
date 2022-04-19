<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/d6e34900cd.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/restaurantInfo.js" defer></script>

<script>
$(document).ready(function() {
	$("#heart").click(function() {
		alert("즐겨찾기 추가하기");
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
	margin-top:-80px;
	font-size: 18px;
	padding: 10px;
}
.infoBox div:nth-child(2){
	border-top: 1px solid rgba(62, 97, 103, 0.3);
	border-bottom: 1px solid rgba(62, 97, 103, 0.3);
	height: 80px;
	line-height: 40px;
	text-overflow: ellipsis;
	white-space: break-word;
	display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
	overflow: hidden;
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
</style>

<div class="img_box">
	<!-- 업주가 식당등록할때 등록하는 이미지 -->
	<img id="ownerImage" src="/img/noImg.jpg"/>
	<!-- 리뷰 작성자가 리뷰에 넣는 이미지 -->
	<img id="reviewImage" src="/img/noImg.jpg"/>
	
	<div class="maininfo">
		<span class="resname">vo.resname</span>
		<div class="score">
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<i class="fa-solid fa-star"></i>
			<span>vo.resgrade</span>
		</div>
		<span class="restype">restype</span><br/>
		<span class="resOnOff">영업 중</span>
		<span class="reshour">vo.reshour - vo.reshourend</span>
	</div>
</div>

<div class="container">
	<div class="btn_box">
		<div>
			<a class="review">☆ 리뷰작성</a>
		</div>
		<button class="reservation">☎ 예약하기</button>
		<button class="favorites">
			<c:if test="${logId==null }">
				<i class="fa-regular fa-heart" id="heart"></i>
			</c:if>
			<c:if test="${logId!=null }">
				<i class="fa-solid fa-heart" id="heart"></i>
			</c:if>
			&nbsp;즐겨찾기
		</button> 
	</div>
	
	<div class="border"></div>
	
	<div class="infoBox">
		<div>vo.website</div>
		<div>vo.resadress</div>
		<div>vo.reshour-vo.reshourend</div>
	</div>
	
	
<div class="reservation_box">
	<div class="reservation_box_bg"></div>
		<div class="date_setting">
			<h3>Setting the Reservation date</h3>
			<button>✖</button>
			<form>
				<input type="date">
				<input type="time">
				<button>submit</button>
			</form>
		</div>
	</div>
</div>
  
  
</div>