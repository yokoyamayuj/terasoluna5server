<script
	src="${pageContext.request.contextPath}/resources/app/js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">


function file_upload()
{
	
	// array変換
    var files  = $("input").get();
    var progresses  = $("progress").get();

    
    // saiki upload
	var upload = function(){
    
	   	var formdata = new FormData();
  	  // csrf設定
  		var csrfToken = $("meta[name='_csrf']").attr("content");
    	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
    	$(document).ajaxSend(function(event, xhr, options) {
       		 xhr.setRequestHeader(csrfHeaderName, csrfToken);
    	});
    	
    	// arrayから一つ取得
        var file = files.shift();
        var progress = progresses.shift();

  		 formdata.append("upload_file", file.files[0]);

    // POSTでアップロード
	    $.ajax({
    		async: true,
   		    xhr : function(){	
				XHR = $.ajaxSettings.xhr();
     	        if(XHR.upload){
      				XHR.upload.addEventListener('progress',function(e){
      	            progre = parseInt(e.loaded/e.total*10000)/100 ;
					console.log(progre+"%") ;
					$(progress).attr("value",progre);
                	}, false); 
       			}
				return XHR;
       		 },
       		url  : "./upload",
        	type : "POST",
        	data : formdata,
        	cache       : false,
        	contentType : false,
        	processData : false,
        	dataType    : "html",
       
    	})
    	.done(function(data, textStatus, jqXHR){
	        alert(data);
	        if (files.length) {
	        	//saikiyobidashi
	        	upload();
	        }
    	})
    	.fail(function(jqXHR, textStatus, errorThrown){
        	alert("fail");
    	});
    
	}
	upload();	
}
	
</script>
<sec:csrfMetaTags />

<div id="wrapper">
	<h1 id="title">upload world!</h1>

	<table>
		<tr>
			<th width="25%">File to upload</th>
			<td width="40%"><input type="file"  /></td>
			<td width="35%"><progress value="0" max="100"></progress>
			</td>
		</tr>
		<tr>
			<th width="25%">File to upload</th>
			<td width="40%"><input type="file" id="file2" /></td>
			<td width="35%"><progress value="0" max="100"></progress>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<button type="button" onclick="file_upload()">アップロード</button>

</div>
