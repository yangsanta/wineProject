$(function() {

	// Delete
	$(document)
			.on(
					"click",
					".deleteOrders",
					function(event) {
						event.preventDefault();
						$(this).closest('tr').hide();

						$
								.ajax({
									url : '/WineProject/orders/ordersadmin.do',
									type : 'POST',
									data : {
										o_no : $(this).attr("href"),
										action : "delete"
									},
									dataType : 'json',
									success : function(data) {
										

									}
								});
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

						$
								.ajax({
									url : '/WineProject/orders/ordersadmin.do',
									type : 'POST',
									data : {
										o_no : $(this).attr("href"),
										action : "edit"
									},
									dataType : 'json',
									success : function(data) {
										

									}
								});
					});

});