<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				    <nav>
				        <div id="navcontainer" class="clearfix">
                            <div id="user" class="clearfix">
	                            <c:if test="${not empty id}">
							        <form id="form_login" action="<%= request.getContextPath() %>/login/logout" method="get" theme="simple">
                                        <img src="/demo/avatar.png" alt="" />
		                                <strong class="username"><c:if test="${'S' eq roleType}">학생</c:if><c:if test="${'A' eq roleType}"> <c:out value="${administratorName}"/></c:if> [<c:out value="${id}" />]</strong>
		                                <ul class="piped">
		                                    <li><a href="/logout" id="btn_logout" title="로그아웃">로그아웃</a></li>
		                                </ul>
							        </form>
							    </c:if>
                            </div>
				            <div id="navclose"></div>
                            <ul class="sf-menu">
	                            <li>
                                    <a href="#" style="margin-right: 40px;">
		                                <span class="icon"><img src="/image/menu/pages.png" /></span>
		                                <span class="title">공지사항</span>
		                            </a>
                                    <ul>
                                        <li><a href="/notice/find">공지사항 목록 조회</a></li>
                                        <li><a href="/notice/add">공지사항 등록</a></li>
                                    </ul>
	                            </li>
                                <li>
                                    <a href="#" style="margin-right: 40px;">
                                        <span class="icon"><img src="/image/menu/styles.png" /></span>
                                        <span class="title">통합메시지</span>
                                    </a>
                                    <ul>
                                        <li><a href="/integration/find">통합메시지 목록 조회</a></li>
                                        <li><a href="/integration/send">통합메시지 발신</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" style="margin-right: 40px;">
                                        <span class="icon"><img src="/image/menu/dashboard.png" /></span>
                                        <span class="title">학생관리</span>
                                    </a>
                                    <ul>
                                        <li><a href="/student">학생관리</a></li>
                                    </ul>
                                </li>
                            </ul>
				       </div>
				    </nav>

                    <script type="text/javascript">
				        $("#btn_logout").on("click", function(e) {
				        	$('#form_login').submit();
				        });
					</script>