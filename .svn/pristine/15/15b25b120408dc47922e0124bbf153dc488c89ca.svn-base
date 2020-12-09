<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<script type="text/javascript">
function setStudentText() {
   // console.log(studentCheck);
    var ff = document.getElementsByName("studentCheck");
    var names = "";
    for(i=0; i<ff.length; i++){
    	if(ff[i].checked){
    		names = names+ ","+ff[i].value;	    		
    	}
    }
    opener.document.getElementById("students").value = opener.document.getElementById("students").value+names;
    window.close();
}

function clearChecks(){ 
	var ff = document.getElementsByName("studentCheck");
    for (var i = 0; i <ff.length; ++i) { 
       ff[i].checked = false; 
    } 
 } 
function allChecks(){ 
	var ff = document.getElementsByName("studentCheck");
    for (var i = 0; i <ff.length; ++i) { 
       ff[i].checked = true; 
    } 
 }

</script>
</head>
<body>
    <form id="/login" class="formee" action="/login" method="post">
        <div class="container_16 clearfix">
            <div class="push_5 grid_6"></div>
            <div class="clear"></div>
            
        </div>
    </form>

    <script type="text/javascript">
        $("#btn_login").on("click", function(e) {
            $("#form_login").submit();
        });
    </script>


	<form action="/integration/send" method="post" enctype="multipart/form-data">
		<div class="container_16 clearfix">
            
            	<table id="checkedStudent">
		            <c:if test="${!empty studentList}">
		            
		                <tr>
		                	<td width="15%" style="padding-left: 10px;">
								<input type="button" value="전체선택" onclick="allChecks()"/>
							</td>
		                	<td>
		                		<input type="button" value="선택해제" onclick="clearChecks()"/>
		                	</td>
		                </tr>
		                <c:forEach items="${studentList}" var="student" varStatus="status">
		                	<tr>
		                		<td width="15%" style="padding-left: 10px;">
		                        	<input type="checkbox" name="studentCheck" value="${student.studentNo}"/> <c:out value="${student.studentName}"/> <br>
		                		</td>
		                		<td>
		                			<c:out value="${student.studentNo}"/>
		                		</td>
		                	</tr>
		                </c:forEach>
		                <tr>
			            	<td width="15%" style="padding-left: 10px;">
					            <input type="button" value="선택" onclick="setStudentText()"/>
			            	</td>
			            	<td>
					            <input type="button" value="종료" onclick="window.close()"/>
			            	</td>
		            	</tr>
		            </c:if>
		            <c:if test="${empty studentList}">
		             <tr>
		             	<td width="15%" style="padding-left: 10px;">
			             	해당학년에 학생이 없습니다
		             	</td>
		                <td>
				            <input type="button" value="종료" onclick="window.close()"/>
		            	</td>
		            </tr>
		            </c:if>
		     </table>
        </div>
</form>
</body>
</html>