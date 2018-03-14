jQuery.fn.progressBar = function(options) {
    var dfs = {
        width:100,
        height:5,
        totalProgress:0,
        currentProgress:0,
        precision:0,
        unit:"unit",
        onOverFlow:$.noop(),
        onFinish:$.noop()
    };
    var opt = $.extend(true, dfs, options);
    
    var pb = "<div class='progress_bar'>"+
					"<span class='total_progress'><span class='current_progress'></span></span>"+
					"<span class='bar_data'>"+
						"<span class='current'></span>"+opt.unit+"/"+
						"<span class='total'></span>"+opt.unit+
					"</span>"+
				"</div>";
    			
	listener = function(bar,num,pro,total,totalSize, w){
		//debugger;
		var percent = Math.round(parseFloat(parseInt(bar.css("width"))/opt.width)*100);
		bar.html(w);
		//num.html(Number(totalSize*percent/100).toFixed(opt.precision));
		//total.html(Number(totalSize).toFixed(opt.precision));
		
		if(!bar.data("finish")){
			setTimeout(function(){listener(bar,num,pro,total,totalSize, w);},10);
		}else{
			if(opt.onFinish){
				opt.onFinish();
			}
			bar.data("finish",false);
			num.html(pro);
			total.html(totalSize);
		}
	};
	
	getCurrent = function(){
		return $(this).find(".current").html();
	};
	getTotal = function(){
		return $(this).find(".total").html();
	};
	setProgress = function(progress, totalSize){
		if(opt.onOverFlow){
			onOverFlow();
			return;
		}
		var thiz = $(this);
		var w = "0%";
		if(progress > 0 && totalSize > 0){
			w = Math.round(parseFloat(progress/totalSize)*100)+"%";
		}
		var bar = thiz.find(".current_progress");
		var num = thiz.find(".current");
		var total = thiz.find(".total");
		bar.animate({width : w},100,function(){
			$(this).data("finish",true);
		});
		listener(bar,num,progress,total,totalSize, w);
	};
	
    this.each(function(){
    	var bar = $(pb);
    	
    	bar.find(".total_progress").css({width:opt.width,height:opt.height});
    	bar.find(".current_progress").css({height:opt.height,width:'0%',textAlign:'center'});
    	bar.find(".bar_data").css({width:opt.width});
    	bar.find(".total").html(opt.totalProgress);
    	
    	bar.setProgress = setProgress;
    	bar.getCurrent = getCurrent;
    	bar.getTotal = getTotal;
    	$(this).append(bar).data("progressbar",bar);
    });
    
    return this;
};

jQuery.fn.getProgressBar = function(){
	return this.data("progressbar");
};
