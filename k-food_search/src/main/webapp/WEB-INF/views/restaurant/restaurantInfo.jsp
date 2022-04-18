<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/d6e34900cd.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/restaurantInfo.js" defer></script>
<style>
* {
  margin: 0;
  padding: 0;

}
ul {
  list-style: none;
}
/* section */
section {
  width: 100%;
  height: 100vh;
  overflow : hidden;
}

/* section info */
section .info {
  width: 100%;
  height: 100%;
  display: flex;
}
section .info .img_box {
  width: 40%;
  padding : 2rem;
  
} 
section .info .img_box img{
  width: 100%;
  height: 100%;
  display: block;
  object-fit: cover ;
}
section .info .detail {
  width: 60%;
  overflow: auto;
  padding : 2rem 2rem 2rem 0;
}
section .info .detail h1 {
  font-size: 3rem;
  margin-bottom: 2rem;
}
section .info .detail .score {
  font-size: 1.5rem;
  margin-bottom: 2rem;
}
section .info .detail .score span {
  font-weight: 600;
}
section .info .detail .adress {
  display: block;
  font-size: 1.2rem;
  margin-bottom: 4rem;
}

/* section intro */
section .info .detail h3 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
}
section .info .detail .desc {
  display: block;
  font-size: 1.2rem;
  margin-bottom: 2rem;
}

/* section button */
section .info .detail .btn_box button {
  font-size: 2rem;
  border: none;
  background: none;
  cursor: pointer;
}
section .info .detail .btn_box button:first-child {
  padding: 1rem 2rem;
  border: 1px solid #000;
  margin-right: 2rem;
  font-weight: 600;
  border-radius: 20px;
}
section .info .detail .btn_box button:last-child {
  font-size: 3rem;
}
section .info .detail .reservation_date {
  display: block;
  font-size: 1.2rem;
  margin: 2rem 0 4rem 1rem;
}
/* section review */
section .info .detail .review {
  
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
<script>
$(document).ready(function() {
	$("#heart").click(function() {
		alert("즐겨찾기 추가하기");
	});
});
</script>
</head>
<body style="overflow:hidden">
  <section>
    <div class="info">
      <div class="img_box">
        <img src="https://cdn.pixabay.com/photo/2017/01/11/08/30/market-1971125_960_720.jpg" alt="가게 사진">
      </div>
      <div class="detail">
        <h1>${vo.resname }</h1>
        <div class="score">
          <i class="fa-solid fa-star"></i>
          <i class="fa-solid fa-star"></i>
          <i class="fa-solid fa-star"></i>
          <i class="fa-solid fa-star"></i>
          <i class="fa-solid fa-star"></i>
          <span>${vo.resgrade }</span>
        </div>
        <span class="adress">${vo.resadress }</span>
        <h3>식당소개</h3>
        <span class="desc">${vo.rescontent }</span>
        <div class="btn_box">
          <button class="reservation">reservation</button>
          <button class="favorites">
          	<c:if test="${logId==null }">
          	<i class="fa-regular fa-heart" id="heart"></i>
          	</c:if>
          	<c:if test="${logId!=null }">
          		<i class="fa-solid fa-heart" id="heart"></i>
          	</c:if>
          </button>
        </div>
        <span class="reservation_date"></span>
        <div class="review">
          <h3>리뷰</h3>
        </div>
      </div>
    </div>
  </section>
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
</body>
</html>