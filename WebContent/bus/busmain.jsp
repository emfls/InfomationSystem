<%@page import="login.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String name=(String)session.getAttribute("name"); 
   session.setAttribute("searchSql", null);
   String id = (String) session.getAttribute("stuNum");
   int stuid = Integer.parseInt(id);
   int stupro = 0;%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>학사관리 시스템</title>

    <!-- Bootstrap CSS를 불러옴 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/homestyle.css">
    <SCRIPT language="javascript" SRC="../js/mail.js"></SCRIPT>
</head>

<body>
    <div class="wrapper">
        <!-- 사이드바 -->
        <nav id="sidebar">
            <!-- 사이드바 상단(교통대 로고를 집어넣을 것)-->
            <div class="sidebar-header">
                <table>
                    <tr>
                        <td><img src="../knutLogo.png" width="90px" height="90px"></td>
                        <td>
                            <div style="padding-left: 25px; font-size: 1.8em;">학사관리</div>
                        </td>
                    </tr>
                </table>
            </div>

            <ul class="list-unstyled components">
                <p><%=name %> 님 반갑습니다.<br><a href="../loginpage/sessionLogout.jsp">(로그아웃)</a></p>
                <li><a href="../home.jsp">HOME</a></li>

                <!-- href를 통하여 하위 항목 리스트 아이디를 불러올 수 있다. 
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">수업관리</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                    </ul>
                </li>
                -->

                <li><a href="../applypage/apply.jsp">수강신청</a></li>
                <li><a href="../applypage/registview.jsp">수강확인</a></li>
                <li><a href="../schedule.jsp" onclick="window.open(this.href, '_blanck','width=900, height=1000'); return false">수업시간표</a></li>
                <li><a href="../gradepage/grade.jsp">성적확인</a></li>
                <li><a href="../profilepage/inquiry.jsp">학적조회</a></li>
                <li><a href="../rollbookpage/studentcheck.jsp">출결확인</a></li>
               <li><a href="../bus/busmain.jsp">통학버스</a></li>
            </ul>
        </nav>

        <style>

        </style>
        <!-- 오른쪽에 보여질 페이지 -->
        <div id="content">
            <div class="topBar">
                <button type="button" id="sidebarCollapse" class="btn btn-style sidebar-btn">
                        <i class="glyphicon glyphicon-align-left"></i>
                    </button>
                    <%   LogonDBBean logon = LogonDBBean.getInstance();
                       int msgcnt=logon.getMessageCount((String)session.getAttribute("stuNum"));%>
                <button class="badge1 glyphicon glyphicon-envelope btn btn-style sidebar-btn navbar-right" data-badge=<%=msgcnt %> onClick="javascript:openmail(<%=stuid %>,<%=stupro%>)">
                </button>
                <span class="navbar-right"><%=name %></span>
            </div>
            <div class="contents">
                <div>
                    <h3 class="dashHeader">통학버스</h3>
                </div>
                <div class="dashboard-style">
               
         <div class="container">
         <input type="button" value="예약하기" class="btn-style" href="#" onClick="showPopup();">
        <input type="button" value="예약확인" class="btn-style" href="#" onClick="showPopupp();">
        <script language="javascript">
        function showPopup(){window.open("Pay.jsp", "a", "width=400, height=200, left=100, top=50");}
        function showPopupp(){window.open("Check.jsp", "a", "width=400, height=200, left=100, top=50");}
        </script>
      </div>
    
    
    <div class="container">
    
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>충주캠퍼스</h2>
          <div>
          <img alt="a" src="../images/a1.jpg">
          </div>
        </div>
        <div class="col-md-4">
          <h2>증평캠퍼스</h2>
                    <div>
          <img alt="a" src="../images/b1.jpg">
          </div>
       </div>
        <div class="col-md-4">
          <h2>의왕캠퍼스</h2>
          <div>
          <img alt="a" src="../images/c1.jpg">
          </div>
       </div>
      </div><br><br>

      <div style='text-align:center'>
         <table class="table table-bordered">
         <caption>충주캠퍼스(통학버스 이용요금 편도 3,000원)</caption>
  <thead>
    <tr>
      <td colspan="2">충주캠퍼스 ↔ 경기도 이천 부발역</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>등교</td>
      <td>하교</td>
    </tr>
    <tr>
      <td>07:50 (부발역 앞)</td>
      <td>18:10 (충주캠퍼스 체육관 앞)</td>
    </tr>
  </tbody>
</table>
</div>
<font color="red"><h>
<small>충주캠퍼스↔청주, 제천은 통학정보-시외고속/직행버스의 교통대 정문 앞 정차 노선 이용</small>
</h></font>

 <div style='text-align:center'>
         <table class="table table-bordered">
         <caption>충주캠퍼스(통학버스 이용요금 월 200,000원)</caption>
  <thead>
    <tr>
      <td colspan="2">충주캠퍼스 ↔ 서울(종합운동장, 강변, 신도림, 노원)</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>등교</td>
      <td>하교</td>
    </tr>
    <tr>
      <td>07:00, 08:20, 10:00 (종합운동장 7번 출구 150M 전방 앞)</td>
      <td>17:40 (충주캠퍼스 체육관 앞)</td>
    </tr>
  </tbody>
</table>
</div>

<font color="red"><h>
<small>하교 시 17:40 체육관 앞에서 승차하여 건국대학교 터미널 이동 후 18:10 강변, 신도림, 노원 하교 차량 이용</small></br>
<small>※ 2017.9.19.부터 건국대학교(글로컬캠퍼스) 서울권, 부평권, 수원권, 동탄, 평택권 등 전 노선 이용 가능하며. 하교방법은 위와 동일(상세노선은 건국대학교 글로컬캠퍼스 홈페이지 참조)</small></br>
<small>※ 수도권 노선은 건국대에서 운영하고 있는 노선으로 추후 조정 변경(폐지)될 수 있음</small></br>
<small>구매절차</small></br>
<small>-http://www.purplebus.co.kr/konkuk/ 접속하여 회원가입</small></br>
<small>-로그인 후 통학버스 상품 구매(문의 010 - 4692 - 9892)</small></br>
<small>-구매내역 조회 후 통학증 할인</small></br>
<small>-휴대폰에 통학증 저장 후 탑승 시 기사에게 보여줌</small></br>
</h></font>
<div style='text-align:center'>
         <table class="table table-bordered">
         <caption>증평캠퍼스(무료 셔틀버스)</caption>
  <thead>
    <tr>
      <td colspan="2">증평캠퍼스 ↔ 증평군청</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>등교</td>
      <td>하교</td>
    </tr>
    <tr>
      <td>08:30</td>
      <td>09:15</td>
    </tr>
    <tr>
       <td>09:30</td>
       <td>10:15</td>
    </tr>
    <tr>
       <td>16:30</td>
       <td>17:15</td>
    </tr>
    <tr>
       <td>17:30</td>
       <td>18:15</td>
    </tr>
  </tbody>
</table>
</div>
<font color="red"><h>
<small>청주 노선버스 111번 이용(1일 50회, 20분 간격)</small>
</h></font>

<div style='text-align:center'>
         <table class="table table-bordered">
         <caption bold="2">캠퍼스 간 행정용 버스</caption>
  <thead>
    <tr>
      <td rowspan="2">운행차량(구간)</td>
      <td rowspan="2">구분</td>
      <td colspan="3" scope="colgroup">출발시간</td> 
    </tr>
    <tr>
      <td scope="col">충주</td> 
      <td scope="col">증평</td> 
      <td scope="col">의왕</td> 
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">71보6556(충주캠↔증평캠)</td>
      <td>오전</td>
      <td>09:00</td>
      <td>11:00</td>
      <td></td>
    </tr>
    <tr>
      <td>오후</td>
      <td>13:10</td>
      <td>17:00</td>
      <td></td>
    </tr>
    <tr>
       <td rowspan="2">77노3287(증평캠↔충주캠)</td>
      <td>오전</td>
      <td>11:00</td>
      <td>09:00</td>
      <td></td>
    </tr>
    <tr>
      <td>오후</td>
      <td>17:00</td>
      <td>13:10</td>
      <td></td>
    </tr>
    <tr>
       <td rowspan="2">76서9146(충주캠↔의왕캠)</td>
      <td>오전</td>
      <td></td>
      <td></td>
      <td>09:00(월,목,금)</td>
    </tr>
    <tr>
      <td>오후</td>
      <td>13:00(월,목,금)</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/homeScript.js"></script>
</body>

</html>