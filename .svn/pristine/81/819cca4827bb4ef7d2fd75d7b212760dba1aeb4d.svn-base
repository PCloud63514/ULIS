<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<script type="text/javascript">
	var rowIndex = 1;
	//첨부파일 추가
	
	function addFile(form) {
		if (rowIndex > 2)
			return false;

		rowIndex++; //갯수 증가
		var getTable = document.getElementById("insertTable");
		var oCurrentRow = getTable.insertRow(getTable.rows.length);
		var oCurrentCell = oCurrentRow.insertCell(0);
		oCurrentCell.innerHTML 
			= "<td colspan=2><input type='file' id='filename" + rowIndex 
				+ "' name='file' size=25 onchange='sizeCheck("+rowIndex+")'/></td>";
	}
	
	//이미지 확인 후 삭제 및 생성
	function imageCheckAndDelete(){
		var getTable = document.getElementById("imageTable");
		getTable.deleteRow(1);
		
		var oCurrentRow = getTable.insertRow(getTable.rows.length);
		var oCurrentCell = oCurrentRow.insertCell(0);
		oCurrentCell.innerHTML 
			= "<td colspan=2><input type='file' id='imageupload' name='image' accept='image/*' onchange='imageCheck()'/></td>";
	}
	
	//파일 확인 후 삭제 및 생성
	function deleteFileInfo(deleteIndex){
		var getTable = document.getElementById("insertTable");
		getTable.deleteRow(deleteIndex);
		
		var oCurrentRow = getTable.insertRow(getTable.rows.length);
		var oCurrentCell = oCurrentRow.insertCell(0);
		oCurrentCell.innerHTML 
			= "<td colspan=2><input type='file' id='filename" + deleteIndex 
				+ "' name='file' size=25 onchange='sizeCheck("+deleteIndex+")'/></td>";
	}
	
	
	//첨부파일 삭제
	function deleteFile(form) {
		if(rowIndex<1){
			return false;
		}
		var getTable = document.getElementById("insertTable");
		getTable.deleteRow(rowIndex);
		--rowIndex;
		if(rowIndex == 0){
			++rowIndex;
			var getTable = document.getElementById("insertTable");
			var oCurrentRow = getTable.insertRow(getTable.rows.length);
			var oCurrentCell = oCurrentRow.insertCell(0);
			oCurrentCell.innerHTML 
				= "<td colspan=2><input type='file' id='filename" + rowIndex 
					+ "' name='file' size=25 onchange='sizeCheck("+rowIndex+")'/></td>";
		}
	}

	function sizeCheck(fileButtonNo) {
		var fileSize = document.getElementById("filename" + fileButtonNo).files[0].size;
		var fileName = document.getElementById("filename" + fileButtonNo).files[0].name;
		var nameSplit = fileName.split(".").reverse();

		if (nameSplit[0].toLowerCase() == 'exe' && fileSize > '5000000') {
			alert("파일 확장자가 .exe이며, 크기가 5MB이상이여서 업로드 되지 않습니다! 다른 파일로 업로드해주세요");
			deleteFileInfo(fileButtonNo);
		}else{
			if (nameSplit[0].toLowerCase() == 'exe') {
				alert("확장자가 .exe인 파일은 업로드 되지 않습니다! 다른 파일로 업로드해주세요");
				deleteFileInfo(fileButtonNo);
			}
			if (fileSize > '50000000') {
				alert("파일의 크기가 50MB이상 파일은 업로드 되지 않습니다! 다른 파일로 업로드해주세요");
				deleteFileInfo(fileButtonNo);
			}
		}
	}
	
	function imageCheck() {
		//크기제한(5MB)
		var imageSize = document.getElementById("imageupload").files[0].size;
		var imageName = document.getElementById("imageupload").files[0].name;
		var imageNameSplit = imageName.split(".").reverse();

		if (imageNameSplit[0].toLowerCase() != "png" && imageNameSplit[0].toLowerCase() != "jpg"
				&& imageNameSplit[0].toLowerCase() != "bmp" && imageNameSplit[0].toLowerCase() != "jpeg"
				&& imageSize > '5000000') {
			alert("이미지파일이 아니며, 파일의 크기가 5MB이상입니다 다른 파일로 업로드해주세요");
			imageCheckAndDelete();
		} else {
			if (imageNameSplit[0].toLowerCase() != "png" && imageNameSplit[0].toLowerCase() != "jpg"
					&& imageNameSplit[0].toLowerCase() != "bmp"
					&& imageNameSplit[0].toLowerCase() != "jpeg") {
				alert("이미지파일이 아닙니다 이미지파일로 업로드해주세요");
				imageCheckAndDelete();
			}
			if (imageSize > '5000000') {
				alert("이미지파일의 크기가 5MB이상으로 업로드 되지 않습니다! 다른 파일로 업로드해주세요");
				imageCheckAndDelete();
			}
		}
	}
	
</script>

</head>
<body>
	<form action="/notice/add" method="post" enctype="multipart/form-data">
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
                	<div class="widget_title clearfix"><h2>공지사항등록</h2></div>
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
											<label><strong>학년</strong></label>
										</td>
										<td>
								            <input type="checkbox" name="gradeOne" value=Y />1학년
									 	    <input type="checkbox" name="gradeTwo" value=Y />2학년
										    <input type="checkbox" name="gradeThree" value=Y />3학년
										    <input type="checkbox" name="gradeFour" value=Y />4학년
										 </td>
									</tr>
									<tr>
										<td width="15%" style="padding-left: 10px;">
											<label><strong>유지기간</strong></label>
										</td>
										<%
											Date date = new Date();
											SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
											String strdate = simpleDateFormat.format(date);
										%>
										
										<td>
											<input type="date" name="endDate" id="datefield" min=<%= strdate%>><br /></td>
									</tr>
                    	  		</table>
								<table class="simple" id="insertTable" border="1">
									<tr>
										<td width="15%" style="padding-left: 10px;">
											<label><strong>파일</strong></label>
										</td>
										<td>
											<input type="button" value="추가" onClick="addFile(this.form)"> 
											<input type="button" value="삭제" onClick="deleteFile(this.form)"> 
											<font color="gray"> 파일 용량은 50MB미만입니다</font>
										</td>
									</tr>
									<tr>
										<td valign=top>
										<input type="file" id="filename1"
											name="file" size="70" onchange="sizeCheck('1')"/></td>
									</tr>
								</table>
								<input type="hidden" name="rowCount" value="1">
								<table id="imageTable" border="1">
									<tr>
										<td width="15%" style="padding-left: 10px;">
											<label><strong>사진 업로드</strong></label>
										</td>
										<td>
											<b><font color="gray">  사진용량은 5MB미만입니다.</font></b>
										</td>
									</tr>
									<tr>
										<!--  <td width="15%" style="padding-left: 10px;"></td> -->
										<td><input type="file" id="imageupload" name="image" accept="image/*" onchange="imageCheck()"> <br /> 
										</td>
									</tr>
								</table>
								<table border="1" align=center>
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
						        <a href="<c:url value="/notice/find" />">
						            <input type="button" id="button_add" 
						                name="button_add" value="목록" />
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