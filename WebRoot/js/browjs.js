function getOSInfo()   //获取系统的环境
{
	var ua=navigator.userAgent,type=0,system,agent=ua;
   
	var isIE = 0;
	try{window.external.ShowBrowserUI(isIE);}catch(e){isIE=1;}
   
	if(ua.indexOf("Maxthon")>-1&&!isIE)
	{
		type="Maxthon";
	}
	else if(ua.indexOf("TencentTraveler")>-1&&!isIE)
	{
		type="TT";
	}
	else if(ua.indexOf("MSIE 6.0")>-1)
	{
		type="Internet Explorer 6.0";
	}
	else if(ua.indexOf("MSIE 7.0")>-1)
	{
		type="Internet Explorer 7.0";
	}
	else if(ua.indexOf("MSIE 8.0")>-1)
	{
		type="Internet Explorer 8.0";
	}
	else if(ua.indexOf("MSIE 9.0")>-1)
	{
		type="Internet Explorer 9.0";
	}
	else if(ua.indexOf("MSIE 10.0")>-1)
	{
		type="Internet Explorer 10.0";
	}
	else if(ua.indexOf("MSIE")>-1)
	{
		type="Internet Explorer";
	}
	else if(ua.indexOf("Firefox")>-1)
	{
		type="Firefox";
	}
	else if(ua.indexOf("Chrome")>-1)
	{
		type="Chrome";
	}
	else if(ua.indexOf("UCBrowser")>-1)
	{
		type="UCBrowser";
	}
	else if(ua.indexOf("Safari")>-1)
	{
		type="Safari";
	}
	else if(ua.indexOf("Opera")>-1)
	{
		type="Opera";
	}
	else if(ua.indexOf("Gecko")>-1)
	{
		type="Gecko";//Nokia上的UC可能就是这个
	}
	else
	{
		type="Others";
	};
	if(ua.indexOf("iPhone")>-1)
	{
		system="iPhone";
	}
	else if(ua.indexOf("Android")>-1)
	{
		system="Android";
	}
	else if(ua.indexOf("Windows Phone")>-1)
	{
		system="Windows Phone";
	}
	else if(ua.indexOf("Nokia")>-1)
	{
		system="Nokia";
	}
	else if(ua.indexOf("SymbOS")>-1)
	{
		system="SymbOS";
	}
	else if(ua.indexOf("Windows")>-1)
	{
		system="Windows";
	}
	else if(ua.indexOf("Mac OS")>-1)
	{
		system="Mac OS";
	}
	else if(ua.indexOf("Linux")>-1||ua.indexOf("BSD")>-1||ua.indexOf("UNIX-like")>-1||ua.indexOf("UNIX")>-1)
	{
		system="UNIX-like";
	}
	else
	{
		system="Others";
	};
	/*if(type!="Others" && system!="Others")
	{
		agent="---";
	};*/
	//alert("您使用的浏览器:"+browser[type]+"; 操作系统:"+os[system]+"; 分辨率:"+window.screen.width+"X"+window.screen.height);
	return [agent,system,type];
};
var pf=getOSInfo();
var pcweb='http://localhost:8090',moweb='http://localhost:8090';

pcweb=pcweb.toLowerCase(),moweb=moweb.toLowerCase();
var pagehost=('http://'+window.location.host).toLowerCase();
var pageurl=window.location.href.toLowerCase();
var usehost=pagehost;
if(((pf[2].indexOf("Internet Explorer")>-1)&&pf[1]!="Windows Phone")||(pf[1]=="Windows"||pf[1]=="Mac OS")){
	usehost=pcweb;
}else if(pf[1]=="iPhone"||pf[1]=="Android"||pf[1]=="Windows Phone"||pf[1]=="Nokia"){
	usehost=moweb;
}
if(usehost!=pagehost) window.location.href=pageurl.replace(pagehost,usehost);