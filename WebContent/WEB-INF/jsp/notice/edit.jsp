<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	 <%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
</head>
<body>
	<form action="/notice/edit/${noticeBoard.noticeBoardNo}" method="post">
		<div id="wrap">
		 <div id="main">
		 	 <header>
                <div class="container_16 clearfix">
                    <%@ include file="/WEB-INF/jsp/layout/menu.jsp" %>
                    <div id="pagetitle" class="clearfix"><h1 class="left">공지시항</h1></div>
                </div>
            </header>
            
            <div class="container_16 clearfix" id="actualbody">
                <div class="clear"></div>
                <div class="grid_16 widget first">
                	<div class="widget_title clearfix"><h2>공지사항 수정</h2></div>
                    <div class="widget_body" style="padding-bottom: 20px;">
                    	  <div id="table3">
                    	  	
	                    	  	<table class="simple">
	                    	  		<thead>
	                                    <tr>
	                                        <th class="center">구분</th>
	                                        <th class="center">내용</th>
	                                    </tr>
                                </thead>
	                                <tbody id="result_table">
	                                	 <tr>
		                                    <td width="15%" style="padding-left: 10px;">
		                                        <label><strong>제목</strong></label>
		                                    </td>
		                                    <td style="text-align: left;">
		                                        <input type="text" name="title" value="${noticeBoard.title}"/>
		                                    </td>
		                                </tr>
		                                <tr>
		                                	<td width="15%" style="padding-left: 10px;">
		                                        <label><strong>대상학년</strong></label>
							                <td style="text-align: left;">
							                    <c:if test="${noticeBoard.gradeOne =='Y'}">
							               			<input type="checkbox" name="gradeOne" value=Y checked="checked" />1학년
							               		</c:if>
							               		<c:if test="${noticeBoard.gradeOne =='N'}">
							               			<input type="checkbox" name="gradeOne" value=Y />1학년
							               		</c:if>
							               		
							               		<c:if test="${noticeBoard.gradeTwo =='Y'}">
							               			<input type="checkbox" name="gradeTwo" value=Y checked="checked" />2학년
							               		</c:if>
							               		<c:if test="${noticeBoard.gradeTwo =='N'}">
							               			<input type="checkbox" name="gradeTwo" value=Y />2학년
							               		</c:if>
							               		
							               		<c:if test="${noticeBoard.gradeThree =='Y'}">
							               			<input type="checkbox" name="gradeThree" value=Y checked="checked" />3학년
							               		</c:if>
							               		<c:if test="${noticeBoard.gradeThree =='N'}">
							               			<input type="checkbox" name="gradeThree" value=Y />3학년
							               		</c:if>
							               		
							               		<c:if test="${noticeBoard.gradeFour =='Y'}">
							               			<input type="checkbox" name="gradeFour" value=Y checked="checked" />4학년
							               		</c:if>
							               		<c:if test="${noticeBoard.gradeFour =='N'}">
							               			<input type="checkbox" name="gradeFour" value=Y />4학년
							               		</c:if>
							                </td>
							            </tr>
		                                <tr>
		                                	<td width="15%" style="padding-left: 10px;">
		                                        <label><strong>종료일자</strong></label>
		                                    </td>
							                <td style="text-align: left;">
							                    <input type="date" name="endDate" value="${noticeBoard.endDate}">
							                </td>
							            </tr>
							            <tr>
							            	<td width="15%" style="padding-left: 10px;">
		                                        <label><strong>내용</strong></label>
		                                    </td>
							                <td style="text-align: left;">
							                    <textarea rows="15" cols="72" name="content">${noticeBoard.content}</textarea>
							                </td>
							            </tr>
	                                </tbody>
	                    	  	</table>
	                    	 
                    	  	<div class="clear"></div>
                            <div class="center" style="margin-top: 10px;">
                                <div id="navigator"></div>
                            </div>
                            <div class="clear"></div>
                    	  </div>
                    </div>
                    <div style="text-align: right; padding-top: 10px;">
					        <a href="<c:url value="/notice/find" />">
					            <input type="button" id="button_list" name="button_list" value="목록" />
					        </a>
					        <input type="submit" id="button_list" name="button_list" value="변경" />
					</div>
                </div>
                <div class="clear"></div>
            </div>
		 </div>
	</div>
	</form>
</body>

</html>