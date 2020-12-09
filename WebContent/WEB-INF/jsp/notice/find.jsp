<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
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
                    <div id="pagetitle" class="clearfix"><h1 class="left">공지사항</h1></div>
                </div>
            </header>
            
            <div class="container_16 clearfix" id="actualbody">
            	<div class="clear"></div>
            	 <div class="grid_16 widget first">
            	 	<div class="widget_title clearfix"><h2>공지사항 목록 조회</h2></div>
                    <div class="widget_body" style="padding-bottom: 20px;">
                    	<div id="table3">
                    		<table class="simple">
                    			<thead>
                                    <tr>
                                        <th class="center">번호</th>
                                        <th class="center">해당학년</th>
                                        <th class="center">제목</th>
                                        <th class="center">작성일자</th>
                                        <th class="center">만료일자</th>
                                        <th class="center">작성자</th>
                                        <th class="center" style="width: 54px;">보기</th>
                                        <th class="center" style="width: 54px;">수정</th>
                                        <th class="center" style="width: 54px;">삭제</th>
                                    </tr>
                                </thead>
                                 <tbody id="result_table">
                                 	<c:if test="${!empty noticeBoardList}">
						                <c:forEach items="${noticeBoardList}" var="noticeboard" varStatus="status">
						                    <tr>
						                        <td style="text-align: center;"><c:out value="${status.count}"/></td>
						                         <td style="text-align: center;">
						                         	<% String grade=""; %>
						                         		<c:if test="${noticeboard.gradeOne =='Y'}">
						                         			<% grade = grade+ "1,"; %>
						                         		</c:if>
						                         		<c:if test="${noticeboard.gradeTwo =='Y'}">
						                         			<% grade = grade+ "2,"; %>
						                         		</c:if>
						                         		<c:if test="${noticeboard.gradeThree =='Y'}">
						                         			<% grade = grade+ "3,"; %>
						                         		</c:if>
						                         		<c:if test="${noticeboard.gradeFour =='Y'}">
						                         			<% grade = grade+ "4,"; %>
						                         		</c:if>
						                         		<% int indexOfComma = grade.lastIndexOf(",");
						               		
						               					out.println(grade.substring(0, indexOfComma));
						               					%>
						                        </td>
						                         <td style="text-align: left;"><c:out value=" ${noticeboard.title}"/></td>
						                        <td style="text-align: center;"><c:out value="${noticeboard.writeDate}"/></td>
						                        <td style="text-align: center;"><c:out value="${noticeboard.endDate}"/></td>
						                        <td style="text-align: center;"><c:out value="${noticeboard.administratorNo}"/></td>
						                        <td style="text-align: center;">
						                            <a href="<c:url value="/notice/view/${noticeboard.noticeBoardNo}" />">
						                                <input type="button" id="button_view"
						                                    name="button_view" value="보기" />
						                            </a>
						                        </td>
						                        <c:if test="${noticeboard.administratorNo eq id}">
						                        <td style="text-align: center;">
						                            <a href="<c:url value="/notice/edit/${noticeboard.noticeBoardNo}" />">
						                                <input type="button" id="button_edit" 
						                                    name="button_edit" value="수정" />
						                            </a>
						                        </td>
						                        <td style="text-align: center;">
						                            <a href="<c:url value="/notice/remove/${noticeboard.noticeBoardNo}" />">
						                                <input type="button" id="button_remove" 
						                                    name="button_remove" value="삭제" />
						                            </a>
						                        </td>
						                        </c:if>
						                    </tr>
						                </c:forEach>
						            </c:if>
						            <c:if test="${empty noticeBoardList}">
						                <tr>
						                    <td style="text-align: center;" 
						                        colspan="7">목록이 존재하지 않습니다.</td>
						                </tr>
						            </c:if>
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
					        <a href="<c:url value="/notice/add" />">
					            <input type="button" id="button_add" 
					                name="button_add" value="등록" />
					        </a>
					    </div>
            	 </div>
            	 <div class="clear"></div>
            </div>
		</div>
	</div>
</body>
</html>