<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.resSignUpDiv{
		width:1200px;
		margin:0 auto;
		margin-top:100px;
		height:500px;
		overflow:auto;
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
		reserveListView();
	});
	
	function reserveListView(){
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
					if(result[i].status=='ok'){//업주가 승인했을 경우
						html+='<li>'+"승인된 예약 입니다."+'</li>';
					}else if(result[i].status=='apply'){//손님이 예약한 경우
						html+='<li>'+"<input type='button' value='예약 승인' onclick='reserveCheck("+result[i].no+")'/>"+'</li>';
					}
					else if(result[i].status=='reject'){//업주가 거절했을 경우
						html+='<li>'+"거절된 예약 입니다."+'</li>';
					}else{//손님이 거절했을 경우
						html+='<li>'+"<input type='button' value='예약 취소 확인' onclick='reserveDel("+result[i].no+")'/>"+'</li>';
					}
				}
				$('.resList').html(html);
			}
		});
	}
	function reserveCheck(no){//예약 승인
		if(confirm("예약을 승인하시겠습니까?")){
			$.ajax({
				type:'get',
				url:'/memReserv/reserveCheckOk',
				data:{
					'no':no,
					'status':'ok'
				},
				success:function(){
					alert("예약을 승인하였습니다.");
					reserveListView()
				},
			});
		}else{//예약 거절
			$.ajax({
				type:'get',
				url:'/memReserv/reserveCheckOk',
				data:{
					'no':no,
					'status':'reject'
				},
				success:function(){
					alert("예약을 거절하였습니다.");
					reserveListView()
				},
			});
		}
	}
	function reserveDel(no){
		if(confirm("손님이 예약을 취소 하였습니다. \n삭제 하시겠습니까?")){
			$.ajax({
				type:'get',
				url:'/memReserv/reserveCheckDel',
				data:{
					'no':no,
				},
				success:function(){
					alert("해당 예약 내역을 삭제하였습니다.");
					reserveListView()
				},
			});
		}else{
			alert("해당 예약 내역을 보존하였습니다.");
		}
	}
</script>
	<div class='resSignUpDiv'>
		<ul class='resList'></ul>
	</div>
</body>
</html>