//window.onload = init;
//var xmlHttp, theUl, theTxtBox;
//function init() {
//	xmlHttp = new XMLHttpRequest();
//	theUl = document.getElementById("ulResult");
//	theTxtBox = document.getElementById("textSearch");
//	theTxtBox.onkeyup = change;
//}
//function over(obj){
//	obj.className="over";
//}
//function out(obj) {
//	obj.className="out";
//}
//function change(){
//	
//	while (theUl.hasChildNodes()){
//		theUl.removeChild(theUl.firstChild);
//	}
//	var inputTxt = theTxtBox.value;
//	xmlHttp.onreadystatechange = returnData;
//	xmlHttp.open("GET", "JsonSimpleDemo?keyword="+inputTxt, true);
//	xmlHttp.send(null);
//	
//}
//function returnData(){
//	if (xmlHttp.readyState == 4){
//		if (xmlHttp.status == 200){
//			var returnStr = xmlHttp.responseText;
//			var datas = JSON.parse(returnStr);
//			var rex =/^[\s]*$/;
//			if (!rex.test(document.getElementById("textSearch").value)){
//				for (var j=0; j<datas.length; j++){
//					var theLi = document.createElement("option");
//					var theTxt = document.createTextNode(datas[j]);
//					theLi.appendChild(theTxt);
//					theLi.setAttribute("onmouseover", "over(this)");
//					theLi.setAttribute("onmouseout", "out(this)");
//					theLi.setAttribute("onclick", "select(this)");
//					theUl.appendChild(theLi);
//				};
//			};
//		}
//	}
//}
//function select(obj) {
//	myData.myInput.value = obj.firstChild.nodeValue;
////	myData.submit();
//}
