<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(()=>{
			resListView();
			
			$('#acordian div').mouseenter(function(){
				$(this).css('width','50%').css('transition-duration','0.5s');
			});
			$('#acordian div').mouseleave(function(){
				$(this).css('width','10%').css('transition-duration','0.5s');
			});
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
		}
		.listMenu{
			border-top:2px solid black;
			border-bottom:2px solid black !important;
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
		<span class='mainText'>매장 리스트</span>
		<ul class='resList'></ul>
	</div>
</body>
</html>