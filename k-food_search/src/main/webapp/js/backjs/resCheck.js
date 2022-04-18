	$(()=>{
		//유효성 검사 시작.
		$('#resSignUpFrm').submit(function(){
			if($("#resmane").val()==''){
				alert('매장명을 입력하세요.');
				$("#resmane").focus();
				return false;
			}
			if($('#resadress').val()==''){
				alert('매장주소를 입력하세요');
				$('#resadress').focus();
				return false;
			}
			if($('#editor').val()==''){
				alert('소개글을 입력하세요');
				$(".ck-editor__editable").focus();
				return false;
			}
			if($('#resnation').val()==''){
				alert('국가를 입력하세요');
				$('#resnation').focus();
				return false;
			}
			if($('#resstate').val()==''){
				alert('지역을 입력하세요');
				$('#resstate').focus();
				return false;
			}
			if($('#restype').val()==''){
				alert('타입을 입력하세요');
				$('#restype').focus();
				return false;
			}
			if($('#reshour').val()==''){
				alert('운영 시간을 입력하세요');
				$('#reshour').focus();
				return false;
			}
			if($('#reshourend').val()==''){
				alert('운영 시간을 입력하세요');
				$('#reshourend').focus();
				return false;
			}
			var reshourMilli = new Date('2000-01-01 '+$('#reshour').val()).getTime()
			var reshourendMilli = new Date('2000-01-01 '+$('#reshourend').val()).getTime()
			//console.log(reshourMilli)
			//console.log(reshourendMilli)
			if(reshourMilli>=reshourendMilli){
				alert('영업 시작 시간은 영업 종료시간보다 빨라야 합니다.');
				return false;
			}
			alert("입력 성공.")
			return true;
		});
	});