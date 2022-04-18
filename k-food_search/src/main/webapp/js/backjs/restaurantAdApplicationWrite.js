$(()=>{
		
		//광고 최소 입력 가능일 설정 (초기 세팅 = 현재 날짜 +7일)
		var date = new Date();
		//console.log(formatDate(date))
		$('#startdate').attr('min',formatDate(date));
		$('#enddate').attr('min',formatDate(date));
		
		$('#adFrm').submit(function(){
			if($('#resno').val()==""){
				alert('매장 등록 번호를 입력하세요.');
				$('#resno').focus();
				return false;
			}
			if($("#bennerimg").val()==""){
				alert("배너 이미지를 입력하세요.")
				$("#bennerimg").focus();
				return false;
			}
			if($('#startdate').val()==""){
				alert('광고 개재일을 입력하세요.');
				$('#startdate').focus();
				return false;
			}
			if($('#enddate').val()==""){
				alert('광고 종료일을 입력하세요.');
				$('#enddate').focus();
				return false;
			}
			var startdateMilli = new Date($('#startdate').val()).getTime()
			var enddateMilli = new Date($('#enddate').val()).getTime()
			
			if(startdateMilli>=enddateMilli){
				alert('개재일이 종료일보다 빠를수 없습니다.');
				$('#startdate').focus();
				return false;
			}
			return true;
		});
	});
	
	function formatDate(date){
		var M = date.getMonth()+1;
		var D = date.getDate()+7;
		var Y = date.getFullYear();
		M = M<10 ? '0'+M : M;
		D = D<10 ? '0'+D : D;
		var format = Y+'-'+M+'-'+D;
		return format
	}