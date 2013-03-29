$(function() {

	// Delete
	$(document)
			.on(
					"click",
					".deleteCouponSet",
					function(event) {
						event.preventDefault();

						$.ajax({
									url : '/WineProject/couponset/couponsetadmin.do',
									type : 'POST',
									data : {
										cs_limit_price : $(this).closest('tr').children('.cs_limit_price').text(),
										action : "deleteCouponSet"
									},
									dataType : 'json',
									success : function(data) {
										$('#csTbody').hide();
										$(".csTr").remove();
										
										$.each(data, function(){
											var cs_limit_price = $('<td></td>').text(this.cs_limit_price);
											var cs_price = $('<td></td>').text(this.cs_price);
											var deleteLink = $('<td></td>').html('<a class="btn btn-primary deleteCouponSet" href="#">刪除</a>');
											var tr = $('<tr  class ="csTr" align="center" valign="middle"></tr>');
											tr.append(cs_limit_price).append(cs_price).append(deleteLink);
											$('#csTbody').append(tr);
										});
										
										$('#csTbody').fadeIn("slow");
										$("#warning_info").fadeIn("slow").delay(1800).fadeOut("slow");
										
									}
								});//ajax
						
					});
	
	// AddEdit
	$(document)
			.on(
					"click",
					".addCouponSet",
					function(event) {
						event.preventDefault();
						
						var new_cs_limit_price = $('.new_cs_limit_price').val(); //$(this).closest('tr').children().children('.new_cs_limit_price').val();

						$.ajax({
								url : '/WineProject/couponset/couponsetadmin.do',
								type : 'POST',
								data : {
										new_cs_limit_price : $('.new_cs_limit_price').val(),
										new_cs_price: $('.new_cs_price').val(),
										action : "addCouponSet"
									},
									dataType : 'json',
									success : function(data) {
										$('#csTbody').hide();
										$(".csTr").remove();
										
										$.each(data, function(){
											var cs_limit_price = $('<td></td>').text(this.cs_limit_price);
											var cs_price = $('<td></td>').text(this.cs_price);
											var deleteLink = $('<td></td>').html('<a class="btn btn-primary deleteCouponSet" href="#">刪除</a>');

											var tr = $('<tr  class ="csTr" align="center" valign="middle"></tr>');
											tr.append(cs_limit_price).append(cs_price).append(deleteLink);
											if (this.cs_limit_price == new_cs_limit_price)
												tr.css('background-color', '#DFEDBE').css('color', '#3f5a04');
											$('#csTbody').append(tr);
										});
										
										$('#csTbody').fadeIn("slow");
										$("#succes_info").fadeIn("slow").delay(1800).fadeOut("slow");
										
									}//success
								}); //ajax
								
			
					});


});