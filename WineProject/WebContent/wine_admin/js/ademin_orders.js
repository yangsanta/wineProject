$(function() {

	// Delete
	$(document)
			.on(
					"click",
					".deleteOrders",
					function(event) {
						event.preventDefault();
						$(this).closest('tr').hide();

						$.ajax({
									url : '/WineProject/wine_admin/ordersadmin.do',
									type : 'POST',
									data : {
										o_no : $(this).attr("href"),
										action : "delete"
									},
									dataType : 'json',
									success : function() {
									}
								}).always(function() {
									$("#warning_info").fadeIn("slow").delay(1800).fadeOut("slow");
								})
					});
	
	// EditStatus
	$(document)
			.on(
					"click",
					".editOrders",
					function(event) {
						event.preventDefault();
						if ($(this).text()=="改為已出貨"){
							$(this).text("改為未出貨");
							$(this).prev().prev().text("已出貨");
						} else {
							$(this).text("改為已出貨");
							$(this).prev().prev().text("未出貨");
						}
						$(this).closest('tr').css('background-color', '#DFEDBE').css('color', '#3f5a04');

						$.ajax({
								url : '/WineProject/wine_admin/ordersadmin.do',
								type : 'POST',
								data : {
										o_no : $(this).attr("href"),
										action : "edit"
									},
									dataType : 'json',
									success : function() {
									}
								})
								.always(function() { 
									$.ajax({
										url : '/WineProject/wine_admin/ordersadmin.do',
										type : 'POST',
										data : {
												o_no : $(this).attr("href"),
												action : "ordernumber"
											},
											dataType : 'text',
											success : function(data) {
												$("#ordernumber").slideUp(300).delay(500).html(data).fadeIn(400);
												$("#succes_info").fadeIn("slow").delay(1800).fadeOut("slow");
											}
										});
								
								
								});
			
					});

});