<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<script type="text/javascript">
var openWin;

function selectCancel(){
	document.getElementById("students").value="";
}

function stuPopupOpen(gradeNo) {
    window.name = "studentForm";

    var option = "width=550, height=400, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
    openWin = window.open("/integration/popup/"+gradeNo, "stuForm", option);
}

</script>
</head>
<body>
	<form action="/integration/send" method="post">
	<div id="wrap">
		 <div id="main">
		 	 <header>
                <div class="container_16 clearfix">
                    <%@ include file="/WEB-INF/jsp/layout/menu.jsp" %>
                    <div id="pagetitle" class="clearfix"><h1 class="left">학생관리</h1></div>
                </div>
            </header>
            
            <div class="container_16 clearfix" id="actualbody">
                <div class="clear"></div>
                <div class="grid_16 widget first">
                	<div class="widget_title clearfix"><h2>학생 관리</h2></div>
                    <div class="widget_body" style="padding-bottom: 20px;">
                    	  <div id="table3">
                    	  	
	                    	  	<table class="simple">
	                    	  		<tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>제목</strong></label>
	                                    </td>
	                                    <td>
	                                    	<input type="text" name="title" size="70">
	                                    </td>
	                                </tr>
	                                <tr>
	                                	<td width="15%" style="padding-left: 10px;">
	                                        <label><strong>학생</strong></label>
	                                    </td>
										
										<td>
											<input type="button" name="grade" size="70" value="1학년" onclick="stuPopupOpen('1')">
											<input type="button" name="grade" size="70" value="2학년" onclick="stuPopupOpen('2')">
											<input type="button" name="grade" size="70" value="3학년" onclick="stuPopupOpen('3')">
											<input type="button" name="grade" size="70" value="4학년" onclick="stuPopupOpen('4')"><br>
											<input type="text" id="students"  name="students" size="100" readonly/>
											<input type="button" name="selectGrade" size="70" value="초기화" onclick="selectCancel()">
										</td>
									</tr>
									<tr>
										<td width="15%" style="padding-left: 10px;">
	                                        <label><strong>내용</strong></label>
	                                    </td>
										<td><textarea rows="18" cols="72" name="content"></textarea><br />
										</td>
									</tr>
	                    	  	</table>
	                    	  	
	                    	  
                    	  	<div class="clear"></div>
                            <div class="center" style="margin-top: 10px;">
                                <div id="navigator"></div>
                            </div>
                            <div class="clear"></div>
                    	  </div>
                    </div>
                    <div style="text-align: right; padding-top: 10px;">
					        <a href="<c:url value="/integration/find" />">
					            <input type="button" id="button_list" 
					                name="button_list" value="목록" />
					        </a>
					        <input type="submit" value="등록" />
					</div>
                </div>
                <div class="clear"></div>
            </div>
		 </div>
	</div>
</form>
</body>
</html>