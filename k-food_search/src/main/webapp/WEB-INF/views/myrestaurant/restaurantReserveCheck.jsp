<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.resSignUpDiv{
		width:1200px;
		margin:0 auto;
		margin-top:100px;
		height:1500px;
		background-color:pink;
	}
	.resList{
		height:50px;
		width:1200px;
		margin:0 auto;
		text-align:center;
	}
	.resList li{
		float:left;
		width:12.5%;
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
<script>
	$(()=>{
		$.ajax({
			type:'get',
			url:'/memReserv/restaurantReserveCheckList',
			success:function(result){
				var html="<li class='listMenu'>예약자 id</li><li class='listMenu'>예약자 이름</li><li class='listMenu'>예약자 전화 번호</li><li class='listMenu'>예약 인원</li><li class='listMenu'>날짜(day)</li><li class='listMenu'>시간(time)</li><li class='listMenu'>매장명</li><li class='listMenu'>예약 승인</li>";
				for(var i=0; i<result.length;i++){
					html+='<li>'+result[i].userid+"</li>";
					html+="<li>"+result[i].username+"</li>";
					html+='<li>'+result[i].tel+"</li>";
					html+='<li>'+result[i].reservp+"</li>";
					html+='<li>'+result[i].reservdate+"</li>";
					html+='<li>'+result[i].reservtime+"</li>";
					html+='<li>'+result[i].resname+"</li>";
					html+='<li>예약 승인 부분</li>';
				}
				$('.resList').html(html);
			}
		});
	});
</script>
	<div class='resSignUpDiv'>
		<ul class='resList'></ul>
	</div>
</body>
</html>