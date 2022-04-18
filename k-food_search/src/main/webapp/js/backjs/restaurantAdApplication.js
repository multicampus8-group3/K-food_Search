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