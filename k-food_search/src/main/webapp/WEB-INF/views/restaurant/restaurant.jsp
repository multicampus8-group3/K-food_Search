<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {

}
a {
  text-decoration: none;
  color: #000;
}
header {
  width: 100vw;
  height: 20vh;
}
/* main */
main {
  display: flex;
  width: 100%;
  overflow: hidden;
}

/* main nav */
main nav{
  width: 10%;
  height: 100vh;
  background-color: rgb(253,239,239);
  position : fixed;
}
main nav div {
  border-top: 1px solid #9b9b9b;
  padding: 30px 0;
}
main nav div:last-child{
  border-bottom : 1px solid #9b9b9b;
}
main nav div h3 {
  margin: 1rem 0;
}
main nav div ul {
  height: 10vh;
  list-style: none;
  display: flex;
  flex-direction: column;
  align-content: start;
  overflow-y: scroll;
  margin-left: 10px;
}
/* main section */
main section {
  width: 100%;
  
  
}
main section > div {
  width: 50%;
  height: 35vh;
  margin: 0 auto;
  padding: 2rem 0;
  border-bottom: 1px solid #9b9b9b;
  display: flex;
}
main section > div .img_box {
  width: 30%;
  height: 100%;
}
main section > div .img_box img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
main section > div .contents {
  width: 70%;
  display: flex;
  flex-direction: column;
}
main section > div .info {
  width: 100%;
  height: 100%;
  padding: 0 2rem;
}
main section > div .info h3 {
  font-size: 1.8rem;
  font-weight: 500;
}
main section > div .info .adr {
  display: block;
  margin: 0.5rem 0 1rem 0;
  color: #9b9b9b;
}
main section > div .info .intro {
  width: 100%;
  overflow: hidden;
  white-space: normal;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}
main section > div a {
  color: #9b9b9b;
  font-size: 1.2rem;
  align-self: flex-end;
  margin-bottom: 1rem;
}
</style>
</head>
<body>
  <main>
    <!-- check box -->
    <nav>
      <h2>Filter</h2>
      <div>
        <h3>국가</h3>
        <form action="">
          <ul>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>미국</label></li>
            <li><input type="checkbox" name="" id=""><label>캐나다</label></li>
            <li><input type="checkbox" name="" id=""><label>호주</label></li>
            <li><input type="checkbox" name="" id=""><label>일본</label></li>
            <li><input type="checkbox" name="" id=""><label>독일</label></li>
            <li><input type="checkbox" name="" id=""><label>프랑스</label></li>
            <li><input type="checkbox" name="" id=""><label>베트남</label></li>
            <li><input type="checkbox" name="" id=""><label>태국</label></li>
            <li><input type="checkbox" name="" id=""><label>중국</label></li>
            <li><input type="checkbox" name="" id=""><label>대만</label></li>
            <li><input type="checkbox" name="" id=""><label>이탈리아</label></li>
            <li><input type="checkbox" name="" id=""><label>가나</label></li>
            <li><input type="checkbox" name="" id=""><label>포르투갈</label></li>
            <li><input type="checkbox" name="" id=""><label>우루과이</label></li>
          </ul>
        </form>
      </div>
      <div>
        <h3>지역</h3>
        <form action="">
          <ul>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
          </ul>
        </form>
      </div>
      <div>
        <h3>종류</h3>
        <form action="">
          <ul>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
            <li><input type="checkbox" name="" id=""><label>한국</label></li>
          </ul>
        </form>
      </div>
    </nav>

    <!-- section -->
    <section>
      <div>
        <div class="img_box">
          <img src="https://cdn.pixabay.com/photo/2017/08/08/09/44/food-photography-2610863_960_720.jpg" alt="">
        </div>
        <div class="contents">
          <div class="info">
            <h3>1. title</h3>
            <span class="adr">서울특별시 특별한 곳 1000번지 12</span>
            <div class="intro">
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div>
          <a href="/">더보기 ></a>
        </div>
      </div>

      <!-- dummy -->
      <div>
        <div class="img_box">
          <img src="https://cdn.pixabay.com/photo/2017/08/08/09/44/food-photography-2610863_960_720.jpg" alt="">
        </div>
        <div class="contents">
          <div class="info">
            <h3>2. title</h3>
            <span class="adr">서울특별시 특별한 곳 1000번지 12</span>
            <div class="intro">
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div>
          <a href="#">더보기 ></a>
        </div>
      </div>
      <div>
        <div class="img_box">
          <img src="https://cdn.pixabay.com/photo/2017/08/08/09/44/food-photography-2610863_960_720.jpg" alt="">
        </div>
        <div class="contents">
          <div class="info">
            <h3>3. title</h3>
            <span class="adr">서울특별시 특별한 곳 1000번지 12</span>
            <div class="intro">
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div>
          <a href="#">더보기 ></a>
        </div>
      </div>
      <div>
        <div class="img_box">
          <img src="https://cdn.pixabay.com/photo/2017/08/08/09/44/food-photography-2610863_960_720.jpg" alt="">
        </div>
        <div class="contents">
          <div class="info">
            <h3>4. title</h3>
            <span class="adr">서울특별시 특별한 곳 1000번지 12</span>
            <div class="intro">
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div>
          <a href="#">더보기 ></a>
        </div>
      </div>
      <div>
        <div class="img_box">
          <img src="https://cdn.pixabay.com/photo/2017/08/08/09/44/food-photography-2610863_960_720.jpg" alt="">
        </div>
        <div class="contents">
          <div class="info">
            <h3>5. title</h3>
            <span class="adr">서울특별시 특별한 곳 1000번지 12</span>
            <div class="intro">
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div>
          <a href="#">더보기 ></a>
        </div>
      </div>
    </section>
  </main>
</body>
</html>