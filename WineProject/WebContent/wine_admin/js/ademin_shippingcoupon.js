$(function() {
	$(".error").hide();
	
	$("#btn_shippingset").click(function(event){
		var reg = /^[0-9]*$/;
		var text_shippingset = $('#text_shippingset').val();
		if (!reg.test(text_shippingset) || text_shippingset<=0){
			$("#ftError").fadeIn("slow").delay(1800).fadeOut("slow");
			event.preventDefault();
		}
	});

	// Delete
	$(document)
			.on(
					"click",
					".deleteCouponSet",
					function(event) {
						event.preventDefault();

						$.ajax({
									url : '/WineProject/wine_admin/couponsetadmin.do',
									type : 'POST',
									data : {
										cs_limit_price : $(this).attr("href"),
										action : "deleteCouponSet"
									},
									dataType : 'json',
									success : function(data) {
										$('#csTbody').hide();
										$(".csTr").remove();
										
										$.each(data, function(){
											var cs_limit_price = $('<td></td>').text(this.cs_limit_price);
											var cs_price = $('<td></td>').text(this.cs_price);
											var deleteLink = $('<td></td>').html('<a class="btn btn-primary deleteCouponSet" href="' + this.cs_limit_price + '">刪除</a>');
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
						
						var new_cs_limit_price = $('.new_cs_limit_price').val().trim(); 
						var new_cs_price = $('.new_cs_price').val(); 
						var isSuccess = false;
						
						var reg = /^[0-9]*$/;
						if (!reg.test(new_cs_limit_price) || new_cs_limit_price<=0){
							$("#ftError").fadeIn("slow").delay(1800).fadeOut("slow");
						} else {

							$.ajax({
									url : '/WineProject/wine_admin/couponsetadmin.do',
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
												var deleteLink = $('<td></td>').html('<a class="btn btn-primary deleteCouponSet" href="' + this.cs_limit_price + '">刪除</a>');
	
												var tr = $('<tr  class ="csTr" align="center" valign="middle"></tr>');
												tr.append(cs_limit_price).append(cs_price).append(deleteLink);
												if (this.cs_limit_price == new_cs_limit_price){
													tr.css('background-color', '#DFEDBE').css('color', '#3f5a04');
													isSuccess = true;
													if (this.cs_price != new_cs_price){
														isSuccess = false;
													}
												} 
												$('#csTbody').append(tr);
											});
											
											$('#csTbody').fadeIn("slow");
											if (isSuccess){
												$("#succes_info").fadeIn("slow").delay(1800).fadeOut("slow");
											} else {
												$("#dataError").fadeIn("slow").delay(1800).fadeOut("slow");
												
											}
											
										}//success
								}); //ajax
						
							}//if-else
								
			
					});


});