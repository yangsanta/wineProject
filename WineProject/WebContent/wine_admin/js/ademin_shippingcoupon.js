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
	
	
	//table search
	//search all data
	//add index column with all content.
	$(".filterable1 tr:has(td)").each(function(){
		   var t = $(this).children('.filterData').text().toLowerCase() + $(this).children().children('i').text().toLowerCase(); //all row text
		   var row = $(this).closest('tr');
		   $("<td class='indexColumn'></td>")
		    .hide().text(t).appendTo(row);
		 });//each tr
	 $("#FilterTextBox").keyup(function(){
	   var s = $(this).val().toLowerCase().trim().split(" ");
	 
	   if (s != ""){
		 //show all rows.
		   $(".filterable1 tr:hidden").show();
	   $.each(s, function(){
	       $(".filterable1 tr:visible .indexColumn:not(:contains('"
	          + this + "'))").parent().hide();
	   });//each
	   } else {
		   $(".filterable1 tr").show();
	   }
	   
	 });//key up.
	 
	//table search
	//search o_no
		 $("#FilterTextBoxO_no").keyup(function(){
		   var s = $(this).val().toLowerCase().trim().split(" ");
		 
		   if (s != ""){
			   $(".filterable1 tr:visible").hide();
		   $.each(s, function(){
		       $(".filterable1 tr:hidden .o_no:contains('"
		          + this + "')").parent().show();
		   });
		   } else {
			   $(".filterable1 tr").show();
		   }
		   
		 });//key up. 
	 
	//table search
	//search m_no
		 $("#FilterTextBoxM_no").keyup(function(){
		   var s = $(this).val().toLowerCase().trim().split(" ");
		 
		   if (s != ""){
			   $(".filterable1 tr:visible").hide();
			   $.each(s, function(){
			       $(".filterable1 tr:hidden .m_no:contains('"
			          + this + "')").parent().show();
		   });//each
		   } else {
			   $(".filterable1 tr").show();
		   }
		   
		 });//key up.

});