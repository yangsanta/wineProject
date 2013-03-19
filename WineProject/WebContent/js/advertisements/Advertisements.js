$(function() {
	//getAll
	$("#tabs-2-li").click(function(){
		alert("li!");
		$("#getAllForm").submit();
	});
	if ($("#testTab2"))
		alert("not exist！");
	
	//jQuery UI
	$( "#accordion" ).accordion();
	
	var availableTags = [
		"ActionScript",
		"AppleScript",
		"Asp",
		"BASIC",
		"C",
		"C++",
		"Clojure",
		"COBOL",
		"ColdFusion",
		"Erlang",
		"Fortran",
		"Groovy",
		"Haskell",
		"Java",
		"JavaScript",
		"Lisp",
		"Perl",
		"PHP",
		"Python",
		"Ruby",
		"Scala",
		"Scheme"
	];
	$( "#autocomplete" ).autocomplete({
		source: availableTags
	});
	
	$( "#button" ).button();
	$( "#radioset" ).buttonset();
	
	$( "#tabs" ).tabs();

	// Hover states on the static widgets
	$( "#dialog-link, #icons li" ).hover(
		function() {
			$( this ).addClass( "ui-state-hover" );
		},
		function() {
			$( this ).removeClass( "ui-state-hover" );
		}
	);
	
	//隱藏form元件
	$("#fileName").css("display", "none");
	$("#productName").css("display", "none");
	
	// Ajax search
	$("#search_query").bind("keyup click", function(){
		while (document.getElementById("ulResult").hasChildNodes()){
			$(document.getElementById("ulResult").removeChild((document.getElementById("ulResult")).firstChild));
		}
		$("#productName").val($(this).val());
		$.ajax({
			url: '../product/ajaxProducts.do', 
			type: 'POST',
			data: {queryProducts: $("#search_query").val()},
			dataType: 'json',
			success: function(data){
				
				$.each(data, function(){
					$('#ulResult').append('<tr><td>'+ this +'</td></tr>');
				});

			}
		});
	});
	//hover effect & click effect
	$(document).on("mouseenter", "#ulResult tr", function(){
		$( this ).addClass( "ui-state-hover" ); //$(this).addClass("over");
	}).on("mouseleave", "#ulResult tr", function(){
		$( this ).removeClass( "ui-state-hover" ); //$(this).removeClass("over");
	}).on("click", "#ulResult tr", function(){
		$("#productName").val($(this).text());
		$("#search_query").val($(this).text());
		$(".pNameErr").remove();
		while (document.getElementById("ulResult").hasChildNodes()){
			$(document.getElementById("ulResult").removeChild((document.getElementById("ulResult")).firstChild));
		}
	});
	

	// drop to upload feature
	var dropbox = $('#dropbox'), message = $('.message', dropbox);
	
	dropbox
			.filedrop({
				// The name of the $_FILES entry:
				paramname : 'pic',

				maxfiles : 1,
				maxfilesize : 2,
				url : '../product/advertisements.do',

				uploadFinished : function(i, file, response) {					
					$.data(file).addClass('done');
					$(".fNameErr").remove();
					// response is the JSON object that Ads Controller
					// returns
				},

				error : function(err, file) {
					switch (err) {
					case 'BrowserNotSupported':
						showMessage('Your browser does not support HTML5 file uploads!');
						break;
					case 'TooManyFiles':
						alert('Too many files! Please select 5 at most! (configurable)');
						break;
					case 'FileTooLarge':
						alert(file.name
								+ ' is too large! Please upload files up to 2mb (configurable).');
						break;
					default:
						break;
					}
				},

				// Called before each upload is started
				beforeEach : function(file) {
					$("#previewbox").remove();
					recordFileName(file);
					if (!file.type.match(/^image\//)) {
						alert('Only images are allowed!');

						// Returning false will cause the
						// file to be rejected
						return false;
					}
				},

				uploadStarted : function(i, file, len) {
					createImage(file);
				},

				progressUpdated : function(i, file, progress) {
					$.data(file).find('.progress').width(progress);
				},
				
			});

	var template = '<div class="preview" id="previewbox">' + '<span class="imageHolder">'
			+ '<img />' + '<span class="uploaded"></span>' + '</span>'
			+ '<div class="progressHolder">' + '<div class="progress"></div>'
			+ '</div>' + '</div>';

	function createImage(file) {

		var preview = $(template), image = $('img', preview);

		var reader = new FileReader();

		image.width = 100;
		image.height = 100;

		reader.onload = function(e) {

			// e.target.result holds the DataURL which
			// can be used as a source of the image:

			image.attr('src', e.target.result);
		};

		// Reading the file as a DataURL. When finished,
		// this will trigger the onload function above:
		reader.readAsDataURL(file);

		message.hide();
		preview.appendTo(dropbox);

		// Associating a preview container
		// with the file, using jQuery's $.data():

		$.data(file, preview);
	}

	function showMessage(msg) {
		message.html(msg);
	}
	
	function recordFileName(file){
		$("#fileName").val(file.name);
	}

});