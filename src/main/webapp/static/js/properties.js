/**
 * 配置前端参数
 */
	//文件上传：队列最多显示的任务数量
	var queueSizeLimit = 3;
	
  	//文件夹上传：文件数量限制  
	var filesCount=2000;  
	//文件夹上传：文件夹大小限制 2000M  
	var filesSize=2147483648;  
	//文件夹上传：实际的文件数量  
	var actual_filesCount=0;  
	//文件夹上传：实际的文件夹大小  
	var actual_filesSize=0;  
	
	var modual = new Object();
	$(function(){ 
		modual.queueSizeLimit = queueSizeLimit;
		modual.filesCount = filesCount;
		modual.filesSize = filesSize;
		modual.actual_filesCount = actual_filesCount;
		modual.actual_filesSize = actual_filesSize;
	})
	
