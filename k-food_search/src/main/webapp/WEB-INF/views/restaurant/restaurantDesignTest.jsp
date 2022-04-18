<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.container{
	width: 100%;
	float: right;
	margin-right: 3%;
}

#justImageBox{
	float: left;
	width: 35%;
	height: 100vh;
	position : fixed;
	background-image: url('/img/hanbook.png');
	background-size: cover;
	opacity: 0.1;
}
#filterBox{
	float: left;
	width: 11%;
	height: 100vh;
	position : fixed;
	right: 3%;
	padding-left: 10px;
	padding-right: 10px;
}
#filterBox div{
	padding-top: 1px;
	border-top: 1px solid #3E6167;
	margin-top: 15px;
}
#nationFilter ul{
	height: 17vh;
	overflow-y: scroll;
}
#stateFilter ul{
	height: 13vh;
	overflow-y: scroll;
}
#typeFilter ul{
	height: 13vh;
	overflow-y: scroll;
}
#filterBox div ul li{
	height: 30px;
	line-height: 30px;
	font-size: 18px;
	margin-top: 2px;
}
#filterImage{
	text-align: center;
	display: table;
	height: 150px;
	border: none !important;
}
#filterImage div{
	border: none;
	display: table-cell;
	vertical-align: middle;
}
#filterImage div img{
	max-width: 200px;
	max-height: 150px;
}


#section{
	float: right;
	width: 50%;
	margin-top: 70px;
	margin-right: 250px;
}
.resCard{
	height: 245px;
	padding: 10px;
	border: 1px solid #3E6167;
	border-radius: 5px;
  	display: flex;
  	margin-top:15px;
  	margin-right: 30px;
}
.img_box{
	width: 28%;
	margin-right: 2%;
}
.img_box img{
	display: block;
  	width: 100%;
 	height: 100%;
  	object-fit: cover;
}
.contents{
	width: 70%;
	padding-right: 5px;
}
.info{
	height: 210px;
	line-height: 35px;
}
.intro{
	height: 90px;
	line-height: 30px;
	text-overflow: ellipsis;
	white-space: break-word;
	display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
	overflow: hidden;	
}
.resname{
	font-size: 28px;
	font-weight: bold;
}
.resgrade{
	color: red;
	font-size: 18px;
	font-weight: bold;
	margin-right: 40px;
}
.restype{
	background-color: rgba(47, 72, 88, 0.4);
	font-weight: bold;
	color: #fff;
	border: 1px solid #2F4858;
}
.adr{
	font-size: 18px;
}
.seeMore{
	float: right;
	margin-right: 20px;
	font-size: 20px;
	border: 1px solid #2F4858;
	border-radius: 5px;
	padding: 2px;
	width: 80px;
	text-align: center;
	font-weight: bold;
}
.resCard:hover{
	box-shadow: 1px 1px 20px #2F4858;
}
.seeMore:hover{
	background-color: #2F4858;
	color: #fff;
}
</style>
<script>
$(document).ready(function() {
	$("#favornation").click(function(){
			var url = "/country/stateList"
			var params = $("input:radio[name='nation']:checked").val();
			console.log(params);
			$.ajax({
			url: url,
			data:{
				nation:params
			},
			success: function(result) {
				var $result = $(result);
				var tag = "";
				$result.each(function(idx, vo){
					tag += "<input type='radio' name='state' value="+vo.state+"><label>"+vo.state+"</label>";						
				});								
				$("#favorstate").html(tag);
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	});
});
</script>

<div class="container">
	<div id="justImageBox">
	</div>
	
	<!-- section -->
	<div id="section">
		<a href="/restaurantInfo">
			<div class="resCard">
				<div class="img_box">
					<img src="/img/noImg.jpg"/>
				</div>
				<div class="contents">
					<div class="info">
						<span class="resname">(vo.resname)</span><br/>
						<span class="resgrade">★(vo.resgrade)</span><span class="restype">(vo.restype)</span><br/>
						<span class="adr">(vo.resadress)서울특별시 특별한 곳 1000번지 12</span>
						<div class="intro">
							(vo.rescontent)It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
							It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
						</div>
					</div>
					<div class="seeMore">더보기</div>
				</div>
			</div>
		</a>
		
		<!-- dummy -->
		<a href="/restaurantInfo">
			<div class="resCard">
				<div class="img_box">
					<img src="/img/noImg.jpg"/>
				</div>
				<div class="contents">
					<div class="info">
						<span class="resname">(vo.resname)</span><br/>
						<span class="resgrade">★(vo.resgrade)</span><span class="restype">(vo.restype)</span><br/>
						<span class="adr">(vo.resadress)서울특별시 특별한 곳 1000번지 12</span>
						<div class="intro">
							(vo.rescontent)It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
							It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
						</div>
					</div>
					<div class="seeMore">더보기</div>
				</div>
			</div>
		</a>
		
		<a href="/restaurantInfo">
			<div class="resCard">
				<div class="img_box">
					<img src="/img/noImg.jpg"/>
				</div>
				<div class="contents">
					<div class="info">
						<span class="resname">(vo.resname)</span><br/>
						<span class="resgrade">★(vo.resgrade)</span><span class="restype">(vo.restype)</span><br/>
						<span class="adr">(vo.resadress)서울특별시 특별한 곳 1000번지 12</span>
						<div class="intro">
							(vo.rescontent)It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
							It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
						</div>
					</div>
					<div class="seeMore">더보기</div>
				</div>
			</div>
		</a>
		
		<a href="/restaurantInfo">
			<div class="resCard">
				<div class="img_box">
					<img src="/img/noImg.jpg"/>
				</div>
				<div class="contents">
					<div class="info">
						<span class="resname">(vo.resname)</span><br/>
						<span class="resgrade">★(vo.resgrade)</span><span class="restype">(vo.restype)</span><br/>
						<span class="adr">(vo.resadress)서울특별시 특별한 곳 1000번지 12</span>
						<div class="intro">
							(vo.rescontent)It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
							It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
						</div>
					</div>
					<div class="seeMore">더보기</div>
				</div>
			</div>
		</a>
		
		<a href="/restaurantInfo">
			<div class="resCard">
				<div class="img_box">
					<img src="/img/noImg.jpg"/>
				</div>
				<div class="contents">
					<div class="info">
						<span class="resname">(vo.resname)</span><br/>
						<span class="resgrade">★(vo.resgrade)</span><span class="restype">(vo.restype)</span><br/>
						<span class="adr">(vo.resadress)서울특별시 특별한 곳 1000번지 12</span>
						<div class="intro">
							(vo.rescontent)It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
							It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
						</div>
					</div>
					<div class="seeMore">더보기</div>
				</div>
			</div>
		</a>
		
	</div>
	
	<!-- check box -->
	<div id="filterBox">
	    <h2>Filters</h2>
		<div id="nationFilter">
			<h3>#resnation</h3>
			<form action="" id="favornation">
				<c:forEach items="${countrylist}" var="item">
        			<input type='radio' name="nation" value="${item.nation}"><label>${item.nation}</label>
        		</c:forEach>
			</form>
		</div>
		<div id="stateFilter">
			<h3>#resstate</h3>
			<form action="" id="favorstate">
				
			</form>
		</div>
		<div id="typeFilter">
			<h3>#restype</h3>
			<form action="">
				<ul>
					<li><input type="checkbox" name="" id=""><label>밥</label></li>
					<li><input type="checkbox" name="" id=""><label>죽</label></li>
					<li><input type="checkbox" name="" id=""><label>떡</label></li>
					<li><input type="checkbox" name="" id=""><label>국수</label></li>
					<li><input type="checkbox" name="" id=""><label>만두</label></li>
					<li><input type="checkbox" name="" id=""><label>수제비</label></li>
					<li><input type="checkbox" name="" id=""><label>술</label></li>
					<li><input type="checkbox" name="" id=""><label>국</label></li>
					<li><input type="checkbox" name="" id=""><label>찌개</label></li>
					<li><input type="checkbox" name="" id=""><label>구이</label></li>
					<li><input type="checkbox" name="" id=""><label>전</label></li>
					<li><input type="checkbox" name="" id=""><label>조림</label></li>
					<li><input type="checkbox" name="" id=""><label>볶음</label></li>
					<li><input type="checkbox" name="" id=""><label>편육</label></li>
					<li><input type="checkbox" name="" id=""><label>나물</label></li>
					<li><input type="checkbox" name="" id=""><label>생채</label></li>
					<li><input type="checkbox" name="" id=""><label>젓갈</label></li>
					<li><input type="checkbox" name="" id=""><label>포</label></li>
					<li><input type="checkbox" name="" id=""><label>장아찌</label></li>
					<li><input type="checkbox" name="" id=""><label>찜</label></li>
					<li><input type="checkbox" name="" id=""><label>전골</label></li>
					<li><input type="checkbox" name="" id=""><label>김치</label></li>
				</ul>
			</form>
		</div>
		<div id="filterImage">
			<div>
				<img src="/img/logo.png"/>
			</div>
		</div>
	</div>
	
</div>