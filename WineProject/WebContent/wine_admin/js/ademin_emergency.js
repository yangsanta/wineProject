$(function() {

	// EditStatus
	$(document)
			.on(
					"click",
					".editEmergency",
					function(event) {
						alert('aaa');
						$.ajax({
								url : '/WineProject/wine_admin/EmergencyProductUpdate',
								type : 'POST',
								data : {
										page : $('.page').val(),
										p_no : $('.p_no').val(),
										p_num : $('.p_num').val(),
										p_status : $('.p_status').val(),
//										o_no : $(this).attr("href"),
//										action : "edit"
									},
									dataType : 'text',
									success : function() {
									}
								})
								.always(function() { 
									$.ajax({
										url : '/WineProject/wine_admin/Maintain',
										type : 'POST',
										data : {
												o_no : $(this).attr("href"),
												action : "emergencyNum"
											},
											dataType : 'text',
											success : function(data) {
												$("#emergencyNum").slideUp(300).delay(500).html(data).fadeIn(400);
												$("#succes_info").fadeIn("slow").delay(1800).fadeOut("slow");
											}
										});

								});
					});
});