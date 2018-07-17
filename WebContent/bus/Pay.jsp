<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>학사관리 시스템</title>

    <!-- Bootstrap CSS를 불러옴 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/homestyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

   <SCRIPT LANGUAGE="javascript">
   
      function test()
      {
    	 var check = $(':input[name=userSelect]:radio:checked').val();
    	 if(check){
    		 //디비에 잔여좌석-1 해주기 디비에 넣어야할 내용 출발지, 목적지, 시간(시간은 PayList에 들어간 배열만 사용할 것임.)
    		 alert('예매가 완료되었습니다.');
    	 }else{
    		 alert("시간을 체크 해주세요.");
    		 return;
    	 }
         
      }

      //상위 셀렉트로 하위 셀렉트 제어하기
      function showSub(obj) {

          f = document.forms.select_machine;
          f.start.style.display = "none";

          if(obj == "충주") {
              	f.SUB1.style.display = "";
              	f.SUB2.style.display = "none";
              	f.SUB3.style.display = "none";
              	f.SUB4.style.display = "none";
          } else if(obj == "증평"){
              	f.SUB1.style.display = "none";
              	f.SUB2.style.display = "";
              	f.SUB3.style.display = "none";
              	f.SUB4.style.display = "none";
           } else if(obj == "서울") {
         		f.SUB1.style.display = "none";
              	f.SUB2.style.display = "none";
              	f.SUB3.style.display = "";
              	f.SUB4.style.display = "none";
           }else {
         		f.SUB1.style.display = "none";
              	f.SUB2.style.display = "none";
              	f.SUB3.style.display = "none";
              	f.SUB4.style.display = "";
           }
          
      }
      
      function listCreate(select){
    	  var selectBox1=$("#selectBox1 option:selected").val();
    	  var selectBox2=select.value;
          $.ajax({
              
              type : "GET",
              url : "PayList.jsp?sel1="+selectBox1+"&sel2="+selectBox2+"",
              dataType : "html",
              error : function(){
                  alert('통신실패!!');
              },
              success : function(data){
                  $("#dataArea").html(data) ;
              }
               
          });
      }
      
   </SCRIPT>
   
   <style>
  		.checktable { 
  			border-collapse:collapse; 
  		}  
  		.checkTable th, .checkTable td { 
  			border:1px solid black !important; 
  		}
  		th{
         	text-align: center !important;
      	}
      	table{
      		border-spacing: 30px;
			border-collapse: separate;
			text-align: center !important;
      	}
      	form{
      		text-align: center !important;
      	}
      	table {
		    border-collapse: collapse;
		    text-align: left;
		    line-height: 1.5;
		}
		table thead th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #501E20;
		    border-bottom: 4px solid #501E20;
		}
		table tbody th {
		    width: 150px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    border-bottom: 1px solid #501E20;
		    background: #f3f6f7;
		}
   </style>
   
<title>Insert title here</title>
</head>
<body style="overflow-x:hidden; overflow-y:hidden; background-color:white;" 
onresize="parent.resizeTo(400,450)" 
onload="parent.resizeTo(400,450)">

<form name="select_machine">
	<table width=400px style="table-layout:fixed;">
		<thead>
			<tr>
				<th>
				   <h4>출발지:</h4>
				</th>
				<th>
				   <select id ="selectBox1" name=" " onChange="showSub(this.options[this.selectedIndex].value);"> 
					   <option value="선택">선택</option> 
					   <option value="충주">충주</option> 
					   <option value="증평">증평</option> 
					   <option value="서울">서울</option>
					   <option value="이천">이천</option>
				   </select>
				</th>
				<th>
				   <h4>목적지:</h4>
				</th>
				<th>
				   <select id = "selecteBox2" name="start" style="display: ;">
				   	<option value="선택">선택</option>
				   </select>
				
				   <select name="SUB1" style="display: none;" onChange="listCreate(this);">
					   <option value="선택">선택</option>
					   <option value="증평">증평</option>
					   <option value="서울">서울</option>
					   <option value="이천">이천</option>
				   </select>
				
				
				   <select name="SUB2" style="display: none;" onChange="listCreate(this);">
					   <option value="선택">선택</option>
					   <option value="증평군청">증평군청</option>
					   <option value="충주">충주</option>
				   </select>
				
				
				   <select name="SUB3" style="display: none;" onChange="listCreate(this);">
					   <option value="선택">선택</option>
					   <option value="충주">충주</option>
				   </select>
				
				
				   <select name="SUB4" style="display: none;" onChange="listCreate(this);">
					   <option value="선택">선택</option>
					   <option value="충주">충주</option>
				   </select>
			   </th>
		   </tr>
	   </thead>
	</table>
	
   	<div id="dataArea">
	</div>
</form>






</body>
</html>