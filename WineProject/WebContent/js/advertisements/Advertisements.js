$(function() {
	// jQuery UI
	$("#button").button();
	$("#tabs").tabs();

	// 隱藏form元件
	$("#fileName").css("display", "none");
	$("#productName").css("display", "none");

	// getAll會用到
	var templateEditRemove1of3 = '<td><a class="btn btn-default adsEdit" href="';
	var templateEditRemove2of3 = '"><i class="icon-pencil"></i> 修改</a><br/><a class="btn btn-default adsDelete" href="';
	var templateEditRemove3of3 = '"><i class="icon-trash"></i> 刪除</a></td>';

	// getAll
	$("#tabs-2-li")
			.click(
					function() {
						$
								.ajax({
									url : '../product/advertisements.do',
									type : 'POST',
									data : {
										action : "getAll"
									},
									dataType : 'json',
									success : function(data) {

										$
												.each(
														data,
														function() {
															$("#tabs-2 tbody")
																	.append(
																			'<tr><td class="ads_no">'
																					+ this.ads_no
																					+ '</td><td><img class="adsImg" src="/WineProject/images/ad/'
																					+ this.ads_filename
																					+ '"  /></td><td>'
																					+ this.p_name
																					+ '</td>'
																					+ templateEditRemove1of3
																					+ this.ads_no
																					+ templateEditRemove2of3
																					+ this.ads_no
																					+ templateEditRemove3of3
																					+ '</tr>');

														});

									}
								});
					});

	// Delete
	$(document)
			.on(
					"click",
					".adsDelete",
					function(event) {
						event.preventDefault();

						$
								.ajax({
									url : '../product/advertisements.do',
									type : 'POST',
									data : {
										ads_no : $(this).attr("href"),
										action : "remove"
									},
									dataType : 'json',
									success : function(data) {
										$('#tabs-2 tbody').empty();

										// 同getAll
										$
												.each(
														data,
														function() {
															$("#tabs-2 tbody")
																	.append(
																			'<tr><td class="ads_no">'
																					+ this.ads_no
																					+ '</td><td><img class="adsImg" src="/WineProject/images/ad/'
																					+ this.ads_filename
																					+ '"  /></td><td>'
																					+ this.p_name
																					+ '</td>'
																					+ templateEditRemove1of3
																					+ this.ads_no
																					+ templateEditRemove2of3
																					+ this.ads_no
																					+ templateEditRemove3of3
																					+ '</tr>');

														});

									}
								});
					});

	// Edit
	$(document).on("click", ".adsEdit", function(event) {
		event.preventDefault();

		$.ajax({
			url : '../product/advertisements.do',
			type : 'POST',
			data : {
				ads_no : $(this).attr("href"),
				action : "edit"
			},
			dataType : 'json',
			success : function(data) {

				alert("done edit");

			}
		});
	});

	// Ajax search
	$("#search_query").bind("keyup click", function() {
		$('#ulResult').empty();
		$("#errlist").empty();
		$("#productName").val($(this).val());
		$.ajax({
			url : '../product/advertisements.do',
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
		$(this).addClass("ui-state-hover"); // $(this).addClass("over");
	}).on("mouseleave", "#ulResult tr", function() {
		$(this).removeClass("ui-state-hover"); // $(this).removeClass("over");
	}).on("click", "#ulResult tr", function() {
		$("#productName").val($(this).text());
		$("#search_query").val($(this).text());
		$("#errlist").empty();
		$('#ulResult').empty();
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
					$("#errlist").empty();
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
					$.data(file).find('.progressDD').width(progress);
				},

			});

	var template = '<div class="preview" id="previewbox">'
			+ '<span class="imageHolder">' + '<img />'
			+ '<span class="uploaded"></span>' + '</span>'
			+ '<div class="progressHolder">' + '<div class="progressDD"></div>'
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

	function recordFileName(file) {
		$("#fileName").val(file.name);
	}

	// 設定廣告 in DB
	$("#button").click(function() {
		$("#okMsg").empty();
		$("#errlist").empty();

		var fileName = $("#fileName").val();
		var productName = $("#search_query").val();

		$.ajax({
			url : '../product/advertisements.do',
			type : 'POST',
			data : {
				fileName : fileName,
				productName : productName,
				action : "setAds"
			},
			dataType : 'json',
			success : function(data) {

				if (data.AdsSuccess != undefined)
					$("#okMsg").append("<p>" + data.AdsSuccess + "</p>");
				$.each(data.AdsErr, function() {
					$("#errlist").append("<p>" + this + "</p>");
				});

			}
		});
	});

});