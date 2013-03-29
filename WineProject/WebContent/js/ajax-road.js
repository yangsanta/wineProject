	function showUser(str) {
		var output = null;
		var str = document.getElementById("m_addr").value;
		//	if (str==""){
		//	document.getElementById("divContent").innerHTML="";
		//	return;
		// } 
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				//  document.getElementById("divContent").innerHTML=xmlhttp.responseText;
				output = xmlhttp.responseText;
				output.replace(/\r\n|\n/g,"");
				var outputarray = output.split(",");
				ajaxdata(outputarray);
			}
		}
		xmlhttp.open("GET", "ajaxroad.jsp?q=" + str, true);
		xmlhttp.send();

	}

	function ajaxdata(datas) {
		var roadinput = document.getElementById("m_addr");

		var theUl = document.getElementById("ulResult");
		while (theUl.firstChild) {
			theUl.removeChild(theUl.firstChild);
		}

		for ( var j = 0; j < datas.length; j++) {
			
			var theUl = document.getElementById("ulResult");
			var txtLi = document.createTextNode(datas[j]);
			var eleLi = document.createElement("li");
			eleLi.className = 'out';
			eleLi.appendChild(txtLi);
			theUl.appendChild(eleLi);

		}

		var lis = document.getElementsByTagName("li");
		for ( var i = 0; i < lis.length; i++) {

			lis[i].onmouseover = over;
			lis[i].onmouseout = out;
			lis[i].onclick = click;
		}

	}
	function over() {
		this.className = 'over';
	}
	function out() {
		this.className = 'out';
	}
	function click() {
		//document.getElementById("textSearch").value=this.firstChild.nodeValue;
		aaa.m_addr.value = this.firstChild.nodeValue;
		$("#m_addr").focus();
		$("#ulResult").empty();
	}