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
						html+='<li>'+parseFloat(result[i].resgrade).toFixed(1)+"</li>";
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
			location.href="/myrestaurant/restaurantUpdateWrite?resno="+resno;
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