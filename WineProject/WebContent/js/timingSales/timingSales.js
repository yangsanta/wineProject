$(function() {
	// Ajax search
	$("#search_query").bind("keyup click", function() {
		$('#ulResult').empty();
		$("#errlist").empty();
		$.ajax({
			url : '/WineProject/product/advertisements.do',
			type : 'POST',
			data : {
				queryProducts : $("#search_query").val(),
				action : "queryProducts"
			},
			dataType : 'json',
			success : function(data) {

				$.each(data, function() {
					$('#ulResult').append('<tr><td>' + this + '</td></tr>');
				});

			}
		});
	});
	
	// hover effect & click effect
	$(document).on("mouseenter", "#ulResult tr", function() {
		$(this).addClass("over"); // $(this).addClass("over");
	}).on("mouseleave", "#ulResult tr", function() {
		$(this).$(this).removeClass("over"); // $(this).removeClass("over");
	}).on("click", "#ulResult tr", function() {
		$("#search_query").val($(this).text());
		$("#errlist").empty();
		$('#ulResult').empty();
	});
});


