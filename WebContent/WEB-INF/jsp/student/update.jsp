<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 <%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
</head>
<body>
	<form action="/student/update" method="post">
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
                	<div class="widget_title clearfix"><h2>학생 수정</h2></div>
                    <div class="widget_body" style="padding-bottom: 20px;">
                    	  <div id="table3">
                    	  	
	                    	  	<table class="simple">
	                    	  		 <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>이름</strong></label>
	                                    </td>
	                                    <td>
	                                        <input type="text" name="name" value="${searchStudentInfo.studentName}" />
	                                    </td>
                                    </tr>
                                    <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>학년</strong></label>
	                                    </td>
	                                    <td>
	                                        <select name="grade">
												<option value = "1" /> 1학년
												<option value = "2" /> 2학년
												<option value = "3" /> 3학년
												<option value = "4" /> 4학년
											</select>
	                                    </td>
                                    </tr>
                                    <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>학과</strong></label>
	                                    </td>
	                                    <td>
	                                        <c:out value="${searchStudentInfo.subjectName}"/>
	                                    </td>
                                    </tr>
                                    
                                    <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>학번</strong></label>
	                                    </td>
	                                    <td>
	                                        <c:out value="${searchStudentInfo.studentNo}"/>
	                                    </td>
	                                    <input type="hidden" name="studentNo" value="${searchStudentInfo.studentNo}">
                                    </tr>
                                    <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>패스워드</strong></label>
	                                    </td>
	                                    <td>
	                                    	15자리 이내만 입력 가능합니다<br>
	                                        <input type = "password" name="pwd"/>
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
					        <a href="<c:url value="/student" />">
					            <input type="button" id="button_add" 
					                name="button_add" value="목록" />
					        </a>
					        <input type="submit" value="수정"/>
					</div>
                </div>
                <div class="clear"></div>
            </div>
		 </div>
	</div>
	</form>
</body>
</html>