<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctoring Footer</title>
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/attached_files.css">
</head>

<body>
	<!-- 첨부파일이 있는 경우에만 표시 -->
	<c:if test="${not empty attachedFiles}">
		<div class="attached-file-section">
			<div class="attached-header">
				<h4>첨부파일 :&nbsp</h4>
				<button class="white-button" onclick="downloadAllFiles()">모두저장</button>
			</div>

			<!-- 첨부파일 리스트 반복문 -->
			<c:forEach var="file" items="${attachedFiles}" varStatus="status">
				<div class="file-container">
					<div class="file-info">
						<span class="file-name"> <!-- allowDownload 조건에 따라 다운로드 링크 표시 -->
							<c:if test="${bf.allowDownload == 'Y'}">
								<a
									href="${pageContext.request.contextPath}/downloadFile?fileName=${file.changeName}&boardNo=${file.boardNo}"
									download="${file.originName}"> ${file.originName} (다운로드 가능)
								</a>
							</c:if> <c:if test="${bf.allowDownload != 'Y'}">
                                ${file.originName} (다운로드 불가)
                            </c:if>
						</span>
						<c:forEach var="file" items="${board.attachedFiles}">
    ${file.fileSize} <!-- 올바른 참조 -->
						</c:forEach>

					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>

</body>

</html>
