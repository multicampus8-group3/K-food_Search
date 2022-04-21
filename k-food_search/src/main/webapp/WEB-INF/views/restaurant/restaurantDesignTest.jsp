<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.container{
	width: 100%;
	float: right;
	margin-right: 3%;
}
#favornation{
	height:13vh;
	overflow-y:scroll;
}
#justImageBox{
	float: left;
	width: 35%;
	height: 100vh;
	position : fixed;
	background-image: url('/img/hanbook.png');
	background-size: cover;
	opacity: 0.1;
}
#filterBox{
	width: 11%;
	height: 100vh;
	position : fixed;
	top:0px;
	right: 3%;
	padding-left: 10px;
	padding-right: 10px;
}
#filterBox div{
	padding-top: 1px;
	border-top: 1px solid #3E6167;
	margin-top: 15px;
}
#nationFilter ul{
	height: 17vh;
	overflow-y: scroll;
}
#stateFilter ul{
	height: 13vh;
	overflow-y: scroll;
}
#typeFilter ul{
	height: 13vh;
	overflow-y: scroll;
}
#filterBox div ul li{
	height: 30px;
	line-height: 30px;
	font-size: 18px;
	margin-top: 2px;
}
#filterImage{
	text-align: center;
	display: table;
	height: 150px;
	border: none !important;
}
#filterImage div{
	border: none;
	display: table-cell;
	vertical-align: middle;
}
#filterImage div img{
	max-width: 200px;
	max-height: 150px;
}



.resCard{
	height: 245px;
	padding: 10px;
	border: 1px solid rgba(62, 97, 103, 0.3);
	border-radius: 5px;
  	display: flex;
  	margin-top:15px;
  	margin-right: 30px;
}
.img_box{
	width: 28%;
	margin-right: 2%;
}
.img_box img{
	display: block;
  	width: 100%;
 	height: 100%;
  	object-fit: cover;
}
.contents{
	width: 70%;
	padding-right: 5px;
}
.info{
	height: 210px;
	line-height: 35px;
}
.intro{
	height: 90px;
	line-height: 30px;
	text-overflow: ellipsis;
	white-space: break-word;
	display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
	overflow: hidden;	
}
.resname{
	font-size: 28px;
	font-weight: bold;
}
.resgrade{
	color: red;
	font-size: 18px;
	font-weight: bold;
	margin-right: 40px;
}
.restype{
	background-color: rgba(47, 72, 88, 0.4);
	font-weight: bold;
	color: #fff;
	border: 1px solid #2F4858;
}
.adr{
	font-size: 18px;
}
.seeMore{
	float: right;
	margin-right: 20px;
	font-size: 20px;
	border: 1px solid #2F4858;
	border-radius: 5px;
	padding: 2px;
	width: 80px;
	text-align: center;
	font-weight: bold;
}
.resCard:hover{
	box-shadow: 1px 1px 10px rgba(42, 72, 88, 0.3);
}
.seeMore:hover{
	background-color: #2F4858;
	color: #fff;
}
#section{
	width: 50%;
	margin-top: 70px;
	margin-left:35%;
}

#pagingbox ul{
	margin-left:35%;
	width:50%;
	height:150px;
	text-align:center;
}
#pagingbox li{
	display:inline-block;
	text-align:center;
	margin: -2.9px;
	margin-top:20px;
	width:50px;
}
#pagingbox li, #pagingbox a{
	font-size:1.1em;
}
</style>
<script>
$(document).ready(function() {
	//지역나오게 하는 ajax
	$("#favornation").click(function(){
			var url = "/country/stateList"
			var params = $("input:radio[name='nation']:checked").val();
			$.ajax({
			url: url,
			data:{
				nation:params,
			},
			success: function(result) {
				var $result = $(result.stateList);
				var $result2 = $(result.restList);
				var tag2 = "";
				var tag="";//레스토랑 정보를 담을 html태그가 들어가야
				$result.each(function(idx, vo){					
					tag2 += "<input type='radio' class='state' name='state' onclick='restInfo(\""+vo.state+"\")' value="+vo.state+"><label>"+vo.state+"</label><br>";
				});
				$result2.each(function(idx, vo){
					tag += '<a href="/restaurantInfo?resno='+vo.resno+'">'; 
					tag += '<div class="resCard">';
					tag += '<div class="img_box">';
					tag += 		'<img src="/resImg/'+vo.resimg+'"/>';
					tag += 	'</div>';
					tag += 	'<div class="contents">';
					tag += 		'<div class="info">';
					tag += 			'<span class="resname">'+vo.resname+'</span><br/>'
					tag += 			'<span class="resgrade">★'+parseFloat(vo.resgrade).toFixed(1)+'</span><span class="restype">'+vo.restype+'</span><br/>';
					tag += 			'<span class="adr">'+vo.resadress+'</span>'
					tag += 			'<div class="intro">'+vo.rescontent+'</div>';
					tag += 		'</div>';
					tag += 		'<div class="seeMore">더보기</div>';
					tag += 	'</div>';
					tag += '</div>';
					tag += '</a>';
					
				});
				$("#favorstate").html(tag2);
				$("#section").html(tag);
				$('#pagingbox').css('display','none');
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	});
	// 가게목록
	var pageNum = "${pVO.pageNum}";
	function restaurantList(pageNum) {
		var url = "/restaurant/resList";
		$.ajax({
			url: url,
			data: {
				'pageNum':pageNum,
				'nation':"${nation}"
			},
			success: function(result) {
				
				var $result = $(result);
				var tag = "";
				$result.each(function(idx, vo){
					tag += '<a href="/restaurantInfo?resno='+vo.resno+'">';
					tag += '<div class="resCard">';
					tag += '<div class="img_box">';
					tag += 		'<img src="/resImg/'+vo.resimg+'"/>';
					tag += 	'</div>';
					tag += 	'<div class="contents">';
					tag += 		'<div class="info">';
					tag += 			'<span class="resname">'+vo.resname+'</span><br/>'
					tag += 			'<span class="resgrade">★'+parseFloat(vo.resgrade).toFixed(1)+'</span><span class="restype">'+vo.restype+'</span><br/>';
					tag += 			'<span class="adr">'+vo.resadress+'</span>'
					tag += 			'<div class="intro">'+vo.rescontent+'</div>';
					tag += 		'</div>';
					tag += 		'<div class="seeMore">더보기</div>';
					tag += 	'</div>';
					tag += '</div>';
					tag += '</a>';
				});
				$("#section").html(tag);				
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	}
	restaurantList(pageNum);
});

	function restInfo(state){
			var url = "/country/restList"
			var params1 = $("input:radio[name='nation']:checked").val();
			$.ajax({
			url: url,
			data:{
				nation:params1,
				state:state
			},
			success: function(result) {
				
				var $result = $(result.restList);
				var tag="";//레스토랑 정보를 담을 html태그가 들어가야
				$result.each(function(idx, vo){
					tag += '<a href="/restaurantInfo?resno='+vo.resno+'">';
					tag += '<div class="resCard">';
					tag += '<div class="img_box">';
					tag += 		'<img src="/resImg/'+vo.resimg+'"/>';
					tag += 	'</div>';
					tag += 	'<div class="contents">';
					tag += 		'<div class="info">';
					tag += 			'<span class="resname">'+vo.resname+'</span><br/>'
					tag += 			'<span class="resgrade">★'+parseFloat(vo.resgrade).toFixed(1)+'</span><span class="restype">'+vo.restype+'</span><br/>';
					tag += 			'<span class="adr">'+vo.resadress+'</span>'
					tag += 			'<div class="intro">'+vo.rescontent+'</div>';
					tag += 		'</div>';
					tag += 		'<div class="seeMore">더보기</div>';
					tag += 	'</div>';
					tag += '</div>';
					tag += '</a>';
				});								
				$("#section").html(tag);
				$('#pagingbox').css('display','none');
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	<!-- 양지석 수정 -->
	}//restInfo()-----------------------
	<!-- 양지석 수정 -->

	$(function(){
		var array=[]
		$('input:checkbox[name="restype"]').click(function(){
			
			var targetboolean = $(event.target).prop('checked')
			if(targetboolean){
				array.push($(event.target).val());				
			}else{
				for(var i=0; i<array.length; i++){
					if(array[i]==$(event.target).val()){
						array.splice(i,i+1);
					}
				}
			}
			
			//alert(chk)
			var nation=$('input:radio[name="nation"]:checked').val()
			var state=$('input:radio[name="state"]:checked').val()
			if(state==null){
				alert("state를 입력하세요!")
			}else{
				$.ajax({
					type:'get',
					url :'/country/restype2',
					data:{
						'resnation':nation,
						'resstate':state,
						'restypeArr':array
					}, success : function (result){
						var $result = $(result);
						var tag="";//레스토랑 정보를 담을 html태그가 들어가야
						$result.each(function(idx, vo){
							tag += '<a href="/restaurantInfo?resno='+vo.resno+'">';
							tag += '<div class="resCard">';
							tag += '<div class="img_box">';
							tag += 		'<img src="/resImg/'+vo.resimg+'"/>';
							tag += 	'</div>';
							tag += 	'<div class="contents">';
							tag += 		'<div class="info">';
							tag += 			'<span class="resname">'+vo.resname+'</span><br/>'
							tag += 			'<span class="resgrade">★'+parseFloat(vo.resgrade).toFixed(1)+'</span><span class="restype">'+vo.restype+'</span><br/>';
							tag += 			'<span class="adr">'+vo.resadress+'</span>'
							tag += 			'<div class="intro">'+vo.rescontent+'</div>';
							tag += 		'</div>';
							tag += 		'<div class="seeMore">더보기</div>';
							tag += 	'</div>';
							tag += '</div>';
							tag += '</a>';
						});								
						$("#section").html(tag);
						$('#pagingbox').css('display','none');
					}
				})			
			}
		})
	});
</script>

<div class="container">
	
	<div id="justImageBox">
	</div>
	
	<!-- section -->
	<div id="section">
	</div>
<!-- 페이징 -->
	<div id="pagingbox">
	<!-- 페이징 -->
				<ul class="paging">
				<!--  이전페이지 -->
				<c:if test="${pVO.pageNum == 1 }">
					<li>prev</li>
				</c:if>
				<c:if test="${pVO.pageNum > 1 }">
					<li><a href="/restaurantDesignTest?pageNum=${pVO.pageNum-1}&nation=${nation}">prev</a></li>
				</c:if>
				
					<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
						<c:if test="${p<=pVO.totalPage}">
							<c:if test="${p==pVO.pageNum}">
								<li style="font-weight: bold;">
							</c:if>
							<c:if test="${p!=pVO.pageNum}">
								<li>
							</c:if>
							<a href="/restaurantDesignTest?pageNum=${p}&nation=${nation}">${p}</a></li>
						</c:if>
					</c:forEach>
				
				<!--  다음페이지 -->
				<c:if test="${pVO.pageNum == pVO.totalPage }">
					<li>next</li>
				</c:if>
				<c:if test="${pVO.pageNum < pVO.totalPage }">
					<li><a href="/restaurantDesignTest?pageNum=${pVO.pageNum+1}&nation=${nation}">next</a></li>
				</c:if>	
				</ul>
	</div>

	<!-- section -->
	<div id="section"></div>
	<!-- check box -->
	<div id="filterBox">
	    <h2>Filters</h2>
		<div id="nationFilter">
			<h3>#resnation</h3>
			<form action="" id="favornation">
				<c:forEach items="${countrylist}" var="item">
        			<input type='radio' name="nation" value="${item.nation}"><label>${item.nation}</label><br>
        		</c:forEach>
			</form>
		</div>
		<div id="stateFilter">
			<h3>#resstate</h3>
			<form action="" id="favorstate">
				
			</form>
		</div>
		<div id="typeFilter">
			<h3>#restype</h3>
			<form action="">
				<ul>
					<li><input type="checkbox" name="restype" id="restype1" value="떡볶이"><label>떡볶이</label></li>
					<li><input type="checkbox" name="restype" id="restype2" value="전"><label>전</label></li>
					<li><input type="checkbox" name="restype" id="restype3" value="백반"><label>백반</label></li>
					<li><input type="checkbox" name="restype" id="restype4" value="치킨"><label>치킨</label></li>
					<li><input type="checkbox" name="restype" id="restype5" value="삼겹살"><label>삼겹살</label></li>
					<li><input type="checkbox" name="restype" id="restype6" value="비빔밥"><label>비빔밥</label></li>
					<li><input type="checkbox" name="restype" id="restype7" value="국밥"><label>국밥</label></li>
				</ul>
			</form>
		</div>
		
		<div id="filterImage">
			<div>
				<img src="/img/logo.png"/>
			</div>
		</div>
		
	</div>
	
</div>
