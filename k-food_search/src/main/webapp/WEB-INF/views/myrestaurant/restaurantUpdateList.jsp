<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(()=>{
			resListView();
		});
		
		function resListView(){
			$.ajax({
				type:'get',
				url:'/restaurantListView',
				success:function(result){
					var html="<li class='listMenu'>매장 등록 번호</li><li class='listMenu'>매장명</li><li class='listMenu'>매장주소</li><li class='listMenu'>평점</li><li class='listMenu'>등록일</li><li class='listMenu'>버튼</li>";
					for(var i=0; i<result.length;i++){
						html+='<li>'+result[i].resno+"</li>";
						html+="<li>"+result[i].resname+"</li>";
						html+='<li>'+result[i].resadress+"</li>";
						html+='<li>'+result[i].resgrade+"</li>";
						html+='<li>'+result[i].writedate+"</li>";
						html+="<li><button onclick='listDel()'>삭제</button><button onclick='move()'>수정</button></li>";
					}
					$('.resList').html(html);
				}
			});
		};
		function move(){
			var index=$(event.target).parent().index();
			var resno = $('.resList li').eq(index-5).html();
			location.href="/restaurantUpdateWrite?resno="+resno;
		};
		function listDel(){
			var index=$(event.target).parent().index();
			var resno = $('.resList li').eq(index-5).html();
			$.ajax({
				type:'get',
				url:'/restaurantDel',
				data:{
					'resno':resno
				},success:function(result){
					console.log(result);
					resListView();
				}
			});
		};
	</script>
	<style>
		.resSignUpDiv{
			width:1200px;
			margin:0 auto;
			margin-top:10px;
			height:1500px;
		}
		.mainText{
			display:inline-block;
			margin-left:150px;
			margin-bottom:20px;
			font-weight:bold;
			font-size:1.5em;
		}
		.resList{
			height:50px;
			width:1000px;
			margin:0 auto;
			text-align:center;
		}
		.resList li{
			float:left;
			width:16.6%;
			height:50px;
			line-height:50px;
			border-bottom:1px solid black;
			overflow:hidden;
			white-space:nowrap;
			text-overflow: ellipsis;
		}
		.listMenu{
			border-top:2px solid black;
			border-bottom:2px solid black !important;
		}	
	</style>
	﻿<%@ include file="acordian.jspf" %>
	<div class='resSignUpDiv'>
		<span class='mainText'>매장 리스트</span>
		<ul class='resList'></ul>
	</div>
</body>
</html>