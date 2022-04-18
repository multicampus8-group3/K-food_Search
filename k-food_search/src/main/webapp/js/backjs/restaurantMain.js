		$(()=>{
			function reAction(){
				$("#startButton").trigger("click");
			  	setTimeout(function(){
			  		$("#stopButton").trigger("click");
				}, 5000);
			}
			$(".bell").on('click', function(){
			    reAction();
			});	
		});