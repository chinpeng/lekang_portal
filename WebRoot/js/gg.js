// JavaScript Document

/*企业微信部分*/
$(function(){
	$(".ul2 .erweima").hide();
	$(".zhli").hover(function(){
		$(this).addClass("beijing").next(".erweima").show();/images/.slideToggle(50);
	},function(){
		$(this).removeClass("beijing").next(".erweima").hide();	
	});
});

/*切换地区*/
$(function(){
	$(".liansuo").hide();
	$(".zongbu").hover(function(){
		$(this).children("p").addClass("lan").next(".liansuo").show();	
	},function(){
		$(this).children("p").removeClass("lan").next(".liansuo").hide();	
	});	
});

/*机构分院*/
$(function(){
	$(".liansuo2").hide();
	$(".lastnav").hover(function(){
		$(this).children(".liansuo2").show();	
	},function(){
		$(this).children(".liansuo2").hide();	
	});	
});



//健康服务部分效果
$(function(){
	$(".category li").hover(function(){
		$(".kuang").eq($(this).index()).show();
		$(this).children("a").addClass("cheng");
	},function(){
		$(this).children("a").removeClass("cheng");
		$(".kuang").eq($(this).index()).hide();
	});
	$(".kuang").hover(function(){
		$(".category li").eq($(this).index()-1).children("a").addClass("cheng");
		$(this).show();
	},function(){
		$(this).hide();
		$(".category li").eq($(this).index()-1).children("a").removeClass("cheng");
	});	
});


 /*搜索套餐部分*/
$(function(){	
	$(".search_box .select").on('click',function(){
		var _this = $(this),
			_bthis = $(this).find(".xilalist");
		if ( _this.attr('isopen') ) {
			_bthis.slideUp(200 , function(){
				_this.removeAttr('isopen');
			});			
		} else {
			_bthis.slideDown(200,function(){
				_this.attr('isopen',"1");
			});	
		}
	}).on('mouseleave',function(){
		var _thisa = $(this).find(".xilalist"),
			_this = $(this);
		_thisa.hide();
		_this.removeAttr('isopen');
	}),$(this).find(".xilalist li").hover( function (){
		$(this).addClass("sel");		
	},function (){
		$(this).removeClass("sel");	
	}).on('click',function(){
		var _this = $(this).html();
		var _thisText = $(this).closest(".select").find(".text");
		_thisText.html(_this);
	})
	/*$(".search_box .button input").click(function(){
		var endinfo= "";
		$(".search_box .select .text").each(function(i){
			endinfo=endinfo+(i+1)+":"+$(this).html()+";\n";
		});						
		/images/alert(endinfo);						
	});*/
});

/*最需关注切换部分*/
$(function(){
	$(".zu li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=t1]").removeClass("t1").addClass("t2").end().removeClass("t2").addClass("t1").parent().next().children().filter(":visible").hide().end().eq(i).show();
		});
	}).not(":first").addClass("t2").end().eq(0).addClass("t1").parent().next().children().not(":first").hide();
});

/*健康攻略 更多搭配部分*/
$(function(){
	$(".moredp").click(function (){
		$("#demo1").children("ul").eq(0). appendTo("#demo1");
		
	})
});

/*本地切换环境*/

$(function(){
	$(".imgbox1 img").not(":first").hide();
	$(".hjnav1 li").click(function(){
		$(".imgbox1 img").hide().eq($(this).index()).show();
	});
	$(".hjnav1 li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=dangqian]").removeClass("dangqian").addClass("t2").end().removeClass("t2").addClass("dangqian");
		});
	}).not(":first").addClass("t2").end().eq(0).addClass("dangqian");	
	
});


$(function(){
	$(".imgbox2 img").not(":first").hide();
	$(".hjnav2 li").click(function(){
		$(".imgbox2 img").hide().eq($(this).index()).show();
	});
	$(".hjnav2 li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=dangqian]").removeClass("dangqian").addClass("t2").end().removeClass("t2").addClass("dangqian");
		});
	}).not(":first").addClass("t2").end().eq(0).addClass("dangqian");
});

$(function(){
	$(".imgbox3 img").not(":first").hide();
	$(".hjnav3 li").click(function(){
		$(".imgbox3 img").hide().eq($(this).index()).show();
	});
	$(".hjnav3 li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=dangqian]").removeClass("dangqian").addClass("t2").end().removeClass("t2").addClass("dangqian");
		});
	}).not(":first").addClass("t2").end().eq(0).addClass("dangqian");
});

$(function(){
	$(".imgbox4 img").not(":first").hide();
	$(".hjnav4 li").click(function(){
		$(".imgbox4 img").hide().eq($(this).index()).show();
	});
	$(".hjnav4 li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=dangqian]").removeClass("dangqian").addClass("t2").end().removeClass("t2").addClass("dangqian");
		});
	}).not(":first").addClass("t2").end().eq(0).addClass("dangqian");
});

/*$(function(){
	$(".imgbox5 img").not(":first").hide();
	$(".hjnav5 li").click(function(){
		$(".imgbox5 img").hide().eq($(this).index()).show();
	});
	$(".hjnav5 li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=dangqian]").removeClass("dangqian").addClass("t2").end().removeClass("t2").addClass("dangqian");
		});
	}).not(":first").addClass("t2").end().eq(0).addClass("dangqian");
});

$(function(){
	$(".imgbox6 img").not(":first").hide();
	$(".hjnav6 li").click(function(){
		$(".imgbox6 img").hide().eq($(this).index()).show();
	});
	$(".hjnav6 li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=dangqian]").removeClass("dangqian").addClass("t2").end().removeClass("t2").addClass("dangqian");
		});
	}).not(":first").addClass("t2").end().eq(0).addClass("dangqian");
});*/images/*地区环境切换*/
$(function(){
	$(".diqu li").each(function(i){
		$(this).click(function(){
			$(this).siblings("[class=cur]").removeClass("cur").addClass("t7").end().removeClass("t7").addClass("cur").parent().next(".qhbox").children(".gedihj").filter(":visible").hide().end().eq(i).show();
		});
	}).not(":first").addClass("t7").end().eq(0).addClass("cur").parent().next(".qhbox").children(".gedihj").not(":first").hide();
});


/*环境部分关闭地址栏*/

$(function(){
	$(".lxfs1").hide();
	$(".close1").click(function(){
		$(".gdxx1").hide();
		$(".lxfs1").show();	
	});	
	$(".lxfs1").click(function(){
		$(this).hide();
		$(".gdxx1").show();	
	})
});

$(function(){
	$(".lxfs2").hide();
	$(".close2").click(function(){
		$(".gdxx2").hide();
		$(".lxfs2").show();	
	});	
	$(".lxfs2").click(function(){
		$(this).hide();
		$(".gdxx2").show();	
	})
});
$(function(){
	$(".lxfs3").hide();
	$(".close3").click(function(){
		$(".gdxx3").hide();
		$(".lxfs3").show();	
	});	
	$(".lxfs3").click(function(){
		$(this).hide();
		$(".gdxx3").show();	
	})
});
$(function(){
	$(".lxfs4").hide();
	$(".close4").click(function(){
		$(".gdxx4").hide();
		$(".lxfs4").show();	
	});	
	$(".lxfs4").click(function(){
		$(this).hide();
		$(".gdxx4").show();	
	})
});
/*
$(function(){
	$(".lxfs5").hide();
	$(".close5").click(function(){
		$(".gdxx5").hide();
		$(".lxfs5").show();	
	});	
	$(".lxfs5").click(function(){
		$(this).hide();
		$(".gdxx5").show();	
	})
});
$(function(){
	$(".lxfs6").hide();
	$(".close6").click(function(){
		$(".gdxx6").hide();
		$(".lxfs6").show();	
	});	
	$(".lxfs6").click(function(){
		$(this).hide();
		$(".gdxx6").show();	
	})
});*/



