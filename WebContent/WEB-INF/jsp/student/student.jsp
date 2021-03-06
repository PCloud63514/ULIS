<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <div id="pagetitle" class="clearfix"><h1 class="left">학생관리</h1></div>
                </div>
            </header>

            <div class="container_16 clearfix" id="actualbody">
                <div class="clear"></div>

                <div class="grid_16 widget first">
                    <div class="widget_title clearfix"><h2>학생 목록 조회</h2></div>
                    <div class="widget_body" style="padding-bottom: 20px;">
                        <div id="table3">
                            <table class="simple">
                                <thead>
                                    <tr>
                                        <th class="center">번호</th>
                                        <th class="center">학번</th>
                                        <th class="center">학년</th>
                                        <th class="center">이름</th>
                                        <th class="center" style="width: 54px;">보기</th>
                                        <th class="center" style="width: 54px;">수정</th>
                                    </tr>
                                </thead>
                                <tbody id="result_table">
                                    <c:if test="${!empty studentList}">
						                <c:forEach items="${studentList}" var="student" varStatus="status">
						                    <tr id="row" class="odd">
						                        <td style="text-align: center;"><c:out value="${status.count}" /></td>
						                        <td style="text-align: center;"><c:out value="${student.studentNo}" /></td>
						                        <td style="text-align: center;"><c:out value="${student.grade}" /></td>
						                        <td style="text-align: center;"><c:out value="${student.studentName}" /></td>
						                        <td style="text-align: center;">
						                            <a href="<c:url value="/student/view/${student.studentNo}" />">
						                                <input type="button" id="button_view" name="button_view"
						                                value="보기" />
						                            </a>
						                        </td>
						                        <td style="text-align: center;">
						                            <a href="<c:url value="/student/update/${student.studentNo}" />">
						                                <input type="button" id="button_view" name="button_view"
						                                value="수정" />
						                            </a>
						                        </td>
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
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        /* 화면 최초 로딩 */
        $(document).ready(function() {
            /* getRows({
                pageNo : "1"
               ,pageItemCount : "10"
            }); */
        });

        /* 검색 */
        $("#btn_search").on("click", function(e) {
            var parameter = {
                name : $('#name').val()
            };
    
            getRows(parameter);
        });

        function drawRows(pageNo) {
            getRows({
                name : $('#name').val()
               ,pageNo : pageNo
               ,pageItemCount : "10"
            });
        }

        /* 목록 */
        function getRows(parameter) {
            $.ajax({
                url : '<%= request.getContextPath() %>/agent/find',
                type : 'get',
                headers : { "Content-Type" : "application/json" },
                dataType : "json",
                data : parameter,
                success : function(data) {
                    var listAgent = data.listAgent;

                    var htmlText = '';
                    if (listAgent.length > 0) {
                        for (var i = 0; i < listAgent.length; i++) {
                            if ((i % 2) == 0) {
                                htmlText += '<tr id="row" class="odd">';
                            } else {
                                htmlText += '<tr id="row" class="even">';
                            }
                            htmlText += '    <td class="center">' + listAgent[i].rowNo + '</td>';
                            htmlText += '    <td class="center">' + listAgent[i].id + '</td>';
                            htmlText += '    <td class="center">' + listAgent[i].name + '</td>';
                            htmlText += '    <td class="center">' + listAgent[i].agencyNo + '</td>';
                            htmlText += '    <td class="center">' + listAgent[i].status + '</td>';
                            htmlText += '    <td class="center"><span><a href="#" data-type="view" data-no="' + listAgent[i].no + '" class="btn blue">보기</a></span></td>';
                            htmlText += '    <td class="center"><span><a href="#" data-type="edit" data-no="' + listAgent[i].no + '" class="btn blue">수정</a></span></td>';
                            htmlText += '    <td class="center"><span><a href="#" data-type="remove" data-no="' + listAgent[i].no + '" class="btn blue">삭제</a></span></td>';
                            htmlText += '</tr>';
                        }
                    } else {
                        htmlText += '<tr class="odd">';
                        htmlText += '    <td colspan="8" class="center">조회된 결과가 없습니다.</td>';
                        htmlText += '</tr>';
                    }

                    htmlText += '</table>';

                    $("#result_table").html(htmlText);
                    $("#navigator").html(data.navigator);
                },
                error: function(request, status, error) {
                    if (request.status == 403) {
                        alert(request.status);
                        // window.location.href = '<%= request.getContextPath() %>/login.do';
                    } else {
                        alert(error);
                    }
                }
            });
        }

        /* 등록 */
        $("#btn_add").on("click", function(e) {
            var addForm = document.createElement("form");
            addForm.setAttribute("method", "get");
            addForm.setAttribute("action", "/agent/add");
            document.body.appendChild(addForm);
            addForm.submit();
        });

        /* 수정 및 삭제 */
        $("#result_table").on("click", function(e) {
            // var dataType = $(this).attr("data-type");

            var dataType = e.target.getAttribute("data-type");
            var dataNo = e.target.getAttribute("data-no");

            if (dataType != null) {
                var form = document.createElement("form");
                if('view' == dataType) {
                    form.setAttribute("method", "get");
                    form.setAttribute("action", "/agent/view/" + dataNo);
                } else if ('edit' == dataType) {
                    form.setAttribute("method", "get");
                    form.setAttribute("action", "/agent/edit/" + escape(dataNo));
                } else if ('remove' == dataType) {
                    form.setAttribute("method", "get");
                    form.setAttribute("action", "/agent/remove/" + dataNo);
                }

                document.body.appendChild(form);
                form.submit();  
            }
        });
    </script>
</body>
</html>
