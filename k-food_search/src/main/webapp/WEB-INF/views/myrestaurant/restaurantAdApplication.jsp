<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.resSignUpDiv{
		width:1200px;
		margin:0 auto;
		margin-top:100px;
		height:1700px;
	}
	.resList{
		height:50px;
		width:1200px;
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
	.banner img{
		height:100%;
	}
	#clickImg{
		width:30px;
		position:relative;
		top:30px;
		left:-70px;
		animation-duration: 0.5s;
	  	animation-name: rot;
	  	animation-iteration-count: infinite;
	  	animation-direction: alternate;
	}
	@keyframes rot {
	  	0% {transform: translateY(0em);}
	 	100% {transform: translateY(0.5em);}
	}
</style>
<script>
$(()=>{
	reserveListView();
});
function reserveListView(){
	$.ajax({
		type:'get',
		url:'/restaurantAdListView',
		success:function(result){
			var html="<li class='listMenu'>식당명</li><li class='listMenu'>광고 시작 예정일</li><li class='listMenu'>광고 종료 예정일</li><li class='listMenu'>광고 신청일</li><li class='listMenu'>광고 상태</li><li class='listMenu'>배너 이미지</li>";
			for(var i=0; i<result.length;i++){
				html+='<li>'+result[i].resname+"</li>";
				html+="<li>"+result[i].startdate+"</li>";
				html+='<li>'+result[i].enddate+"</li>";
				html+='<li>'+result[i].writedate+"</li>";
				html+='<li>'+result[i].status+"</li>";
				html+="<li class='banner'><img src='/adImg/"+result[i].bannerimg+"'/></li>";
			}
			$('.resList').html(html);
		}
	});
}
</script>
<div class='resSignUpDiv'>
	<ul class='resList'></ul>
	<a href='/restaurantAdApplicationWrite'>광고 신청하러 가기</a>
	<img src='/img/click.png' id='clickImg'/><br/><br/><br/>
	<div>광고 등록 방법을 알려주는 공간 *미정.</div>
</div>
</body>
</html>