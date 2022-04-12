<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<style>
		.resSignUpDiv{
			width:1000px;
			margin:0 auto;
			margin-top:100px;
			height:1000px;
			box-shadow:0px 0px 10px 1px;
			padding:50px;
		}
	</style>
	<script>
		$(()=>{
			resListView();
		});
		function resListView(){
			$.ajax({
				type:'get',
				url:'/restaurantListView',
				success:function(result){
					var html="";
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
	<div class='resSignUpDiv'>
		<ul class='resList'></ul>
	</div>
</body>
</html>