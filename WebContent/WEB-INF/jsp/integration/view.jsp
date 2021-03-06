<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
</head>
<body>
	<div id="wrap">
		 <div id="main">
		 	 <header>
                <div class="container_16 clearfix">
                    <%@ include file="/WEB-INF/jsp/layout/menu.jsp" %>
                    <div id="pagetitle" class="clearfix"><h1 class="left">통합메시지</h1></div>
                </div>
            </header>
            
            <div class="container_16 clearfix" id="actualbody">
                <div class="clear"></div>
                <div class="grid_16 widget first">
                	<div class="widget_title clearfix"><h2>통합메시지 조회</h2></div>
                    <div class="widget_body" style="padding-bottom: 20px;">
                    	  <div id="table3">
	                    	  	<table class="simple">
                                    <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>제목</strong></label>
	                                    </td>
	                                    <td>
	                                        <c:out value="${viewMap.INTEGRATIONMESSAGETITLE}"/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>학번</strong></label>
	                                    </td>
	                                    <td>
	                                        <c:out value="${viewMap.STUDENTNO}"/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>이름</strong></label>
	                                    </td>
	                                    <td>
	                                        <c:out value="${viewMap.STUDENTNAME}"/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>보낸 날짜</strong></label>
	                                    </td>
	                                    <td>
	                                        <c:out value="${viewMap.SENDDATE}"/>
	                                    </td>
	                                </tr>
	                                 <tr>
	                                    <td width="15%" style="padding-left: 10px;">
	                                        <label><strong>내용</strong></label>
	                                    </td>
	                                    <td>
	                                        <c:out value="${viewMap.INTEGRATIONMESSAGECONTENT}"/>
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
					            <input type="button" id="button_add" 
					                name="button_add" value="목록" />
					        </a>
					</div>
                </div>
                <div class="clear"></div>
            </div>
		 </div>
	</div>
</body>
</html>