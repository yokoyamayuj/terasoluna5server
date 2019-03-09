<script src="${pageContext.request.contextPath}/resources/app/js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">

function file_upload()
{
    // フォームデータを取得
    var formdata = new FormData();
    
    var formdata = new FormData();
    var file = $("#bb").prop("files")[0];

    // トークン設定
    var csrfToken = $("meta[name='_csrf']").attr("content");
    var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(event, xhr, options) {
        xhr.setRequestHeader(csrfHeaderName, csrfToken);
    });
    formdata.append("upload_file", file);

    // POSTでアップロード
    $.ajax({
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
    })
    .fail(function(jqXHR, textStatus, errorThrown){
        alert("fail");
    });
}
</script>
 <sec:csrfMetaTags />

<div id="wrapper">
    <h1 id="title">upload world!</h1>
     
  <table>
    <tr>
      <th width="35%">File to upload</th>
      <td width="65%">
        <input type="file"  id="aa"/> 
      </td>
     </tr>
     <tr>    
      <th width="35%">File to upload</th>
      <td width="65%">
        <input type="file"  id="bb"/> 
      </td>
      
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
  <button type="button" onclick="file_upload()">アップロード</button>
  
</div>
