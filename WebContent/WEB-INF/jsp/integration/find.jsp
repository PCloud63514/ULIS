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
                	<div class="widget_title clearfix"><h2>통합메시지 목록 조회</h2></div>
                    <div class="widget_body" style="padding-bottom: 20px;">
                    	  <div id="table3">
                    	  	<table class="simple">
                    	  		<thead>
                    	  			<tr>
										<th class="center">메시지 번호</th>
										<th class="center">학년</th>
										<th class="center">수신인</th>
										<th class="center">제목</th>
										<th class="center">일자</th>
										<th class="center">발신유무</th>
										<th class="center" style="width: 54px;">보기</th>
									</tr>
                    	  		</thead>
                    	  		<tbody>
                    	  			<c:if test="${!empty sendList}">
										<c:forEach items="${sendList}" var="integrationMessage"
											varStatus="status">
											<tr>
												<td style="text-align: center;">
												<c:out value="${status.count}"/></td>
												<td style="text-align: center;"><c:out
														value="${integrationMessage.grade }" /></td>
												<td style="text-align: center;"><c:out
														value="${integrationMessage.studentName }" /></td>
												<td style="text-align: left;"><c:out
														value="${integrationMessage.title }" /></td>
												<td style="text-align: center;"><c:out
														value="${integrationMessage.sendDate }" /></td>
												<td style="text-align: center;"><c:out
														value="${integrationMessage.sendStatus }" /></td>
												<td style="text-align: center;"><a
													href="<c:url value="/integration/view/${integrationMessage.sendNo}" />">
														<input type="button" id="button_view" name="button_view"
														value="보기" />
												</a></td>
											</tr>
										</c:forEach>
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
						<a href="<c:url value="/integration/send" />"> <input type="button"
							id="button_add" name="button_add" value="메시지 발신" />
						</a>
					</div>
                </div>
                <div class="clear"></div>
            </div>
		 </div>
	</div>
</body>
</html>