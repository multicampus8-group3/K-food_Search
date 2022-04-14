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
		width:20%;
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
	.banner{
		width:100% !important;
		height:350px !important;
	}
	.banner img{
		height:100%;
	}
	#adEx{
		width:100%;
		text-align:center;
		display:none;
	}
	#adEx img{
		width: 80%;
	}
</style>
<script>
$(()=>{
	reserveListView();
	var chk = false;
	$("#adExView").click(function(){
		if(chk==false){
			$("#adEx").fadeIn(200);
			chk=true;
		}else{
			$("#adEx").fadeOut();
			chk=false;
		}
	});

});
function reserveListView(){
	$.ajax({
		type:'get',
		url:'/restaurantAdListView',
		success:function(result){
			var html="<li class='listMenu'>식당명</li><li class='listMenu'>광고 시작 예정일</li><li class='listMenu'>광고 종료 예정일</li><li class='listMenu'>광고 신청일</li><li class='listMenu'>광고 상태</li>";
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
	<a href='/restaurantAdApplicationWrite'>광고 신청하러 가기</a><br/>
	<ul class='resList'></ul>
	<span style='cursor:pointer;' id='adExView'>광고 기재 방법</span>
	<div id='adEx'>
		<img src='/adImg/adEx.PNG'/>
	</div>
</div>
</body>
</html>