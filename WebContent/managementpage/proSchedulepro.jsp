<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] checkingIndex=request.getParameterValues("checkBox");
String index="";
for(int i=0;i<checkingIndex.length;i++){
	index+=checkingIndex[i];
	if(i!=checkingIndex.length-1)
		index+=",";
}
%>
   <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

    <script type="text/javascript">
    
    $(document).ready(function setParentText(){
             opener.document.getElementById("time").value = "<%= index %>";
             window.close();
        });
   </script>