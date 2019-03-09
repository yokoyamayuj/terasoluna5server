<script src="${pageContext.request.contextPath}/resources/app/js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">

function file_upload()
{
    // フォームデータを取得
    var formdata = new FormData($("#file_upload").get(0));

    // POSTでアップロード
    $.ajax({
        url  : "./upload",
        type : "POST",
        data : formdata,
        cache       : false,
        contentType : false,
        processData : false,
        dataType    : "html"
    })
    .done(function(data, textStatus, jqXHR){
        alert(data);
    })
    .fail(function(jqXHR, textStatus, errorThrown){
        alert("fail");
    });
}
</script>
<div id="wrapper">
    <h1 id="title">upload world!</h1>
    <form:form
  action="${pageContext.request.contextPath}/welcome/upload" method="post"
  modelAttribute="fileUploadForm" enctype="multipart/form-data" id="file_upload"> 
  <table>
    <tr>
      <th width="35%">File to upload</th>
      <td width="65%">
        <form:input type="file" path="file" /> 
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
  <button type="button" onclick="file_upload()">アップロード</button>
  </form:form>
</div>
