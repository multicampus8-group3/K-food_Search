<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	/*리스트*/
	.boardList{
		overflow:auto;
	}
	
	.boardList>li{
		float:left;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
		width:10%;
		white-space: nowrap; /*줄 안바꿈*/
		overflow: hidden; /*넘친내용 숨기기*/
    	text-overflow: ellipsis; /*넘침시 ...표시*/
	}
	.boardList>li:nth-child(8n+1){
    text-align: center;
    }
	.boardList>li:nth-child(8n+2){
    width: 20%;
    }
    .boardList>li:nth-child(8n+3) {
    width: 25%;
    }
    .boardList>li:nth-child(8n+4) {
    width: 5%;
    }
    .div_test {
		back
    }
</style>
	<div class="div_test">
		<ul class="boardList">
			<li>번호</li>
			<li>상호명</li>
			<li>주소</li>
			<li>별점</li>
			<li>오너</li>
			<li>지역</li>
			<li>음식종류</li>
			<li>등록일</li>
			<c:forEach var="vo" items="${list}"> <!-- service.restaurantList_world(mVO)  /  List<RestaurantVO>  /  memberVO mVO 매개변수 -->
				<li>${vo.resno}</li>
				<li>${vo.resname}</li>
				<li>${vo.resadress}</li>
				<li>${vo.resgrade}</li>
				<li>${vo.userid}</li>
				<li>${vo.resstate}, ${vo.resnation}</li>
				<li>${vo.restype}</li>
				<li>${vo.writedate}</li>
			</c:forEach>
		</ul>
	</div>