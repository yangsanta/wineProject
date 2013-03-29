$(function() {

	// EditStatus
	$(document)
			.on(
					"click",
					".editEmergency",
					function(event) {
//						alert($(this).parent().parent().children('.page').val());
//						alert($(this).parent().parent().children('.p_no').val());
//						alert($(this).parent().parent().children('.tdp_num').children('.spanp_num').children('.p_num').val());
//						alert($(this).parent().parent().children('.tdp_status').children('.spanp_status').children('.p_status').val());
						
						$.ajax({
								url : '/WineProject/wine_admin/EmergencyProductUpdate',
								type : 'POST',
								data : {
										page : $(this).parent().parent().children('.page').val(),
										p_no : $(this).parent().parent().children('.p_no').val(),
										p_num : $(this).parent().parent().children('.tdp_num').children('.spanp_num').children('.p_num').val(),
										p_status : $(this).parent().parent().children('.tdp_status').children('.spanp_status').children('.p_status').val(),
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