<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.resSignUpDiv{
		width:1200px;
		margin:0 auto;
		margin-top:100px;
		height:1700px;
	}
</style>
<script>
	$(()=>{
		$('#adFrm').submit(function(){
			if($("#bennerimg").val()==""){
				alert("이미지가 없습니다.")
			}
		});
	});
</script>
<div class='resSignUpDiv'>
	<form method='post' action='/restaurantAdApplicationWriteOk' enctype="multipart/form-data" id='adFrm'>
		<input type='text' name ='resno'><br/>
		<input type='file' name ='bennerimg1' id='bennerimg'><br/>
		<input type='date' name ='startdate'><br/>
		<input type='date' name ='enddate'><br/>
		<input type='text' name ='status' value='apply'><br/>
		<input type='submit' value='신청'><br/>
	</form>
</div>
</body>
</html>