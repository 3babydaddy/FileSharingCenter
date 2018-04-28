/**
 * 判断是否是谷歌浏览器
 */
  var tipMsg = "请使用谷歌浏览器或者联系管理员"; 
  var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
  var isOpera = userAgent.indexOf("Opera") > -1;  
  var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器
  var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
  var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
  var isFirefox = userAgent.indexOf("Firefox")>0
  //判断是否chorme浏览器  
  function isChrome(){
	  if (userAgent.indexOf("Chrome") > -1){  
		  return true;  
	  }else{
		  return false;
	  } 
  } 
  //判断是否ie11或者Edge浏览器
  function isAccordIE(){
	  if(isEdge){
		  return true;
	  }
	  if(isIE11){
		  return true;
	  }
	  return false;  
  }
