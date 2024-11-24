<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>첨부 파일</title>
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
                <h4>첨부파일 :</h4>
                <button class="white-button" onclick="downloadAllFiles()">모두저장</button>
            </div>

            <!-- 첨부파일 리스트 반복문 -->
            <c:forEach var="file" items="${attachedFiles}">
                <div class="file-container">
                    <div class="file-info">
                        <span class="file-name">
                            <!-- 다운로드 허용 여부에 따라 조건 표시 -->
                            <c:choose>
                                <c:when test="${file.allowDownload == 'Y'}">
                                    <a href="${pageContext.request.contextPath}/downloadFile?fileName=${file.changeName}&boardNo=${file.boardNo}"
                                        download="${file.originName}">
                                        ${file.originName} (다운로드 가능)
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    ${file.originName} (다운로드 불가)
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <span class="file-size">
                            크기: ${(file.fileSize / 1024).toFixed(2)} KB
                        </span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</body>

</html>
