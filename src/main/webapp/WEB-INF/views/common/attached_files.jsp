<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Footer</title>

    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">  
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/attached_files.css">
</head>

<body>
    <div class="attached-file-section">
        <div class="attached-header">
            <h4>첨부파일 :&nbsp</h4>
            <button class="white-button">모두저장</button>
        </div>
    
        <!-- 첨부파일 리스트 반복문 - 최대 3개의 파일만 표시 -->
        <c:forEach var="file" items="${attachedFiles}" varStatus="status">
            <c:if test="${status.index < 3}">
                <div class="file-container">
                    <div class="file-info">
                        <span class="file-name">
                            ${file.name}
                        </span>
                        <span class="file-size">(${file.size}MB)</span>
                    </div>
                    <div class="file-download">
                        <c:choose>
                            <c:when test="${file.isDownloadable}">
                                <button class="download-button">&#8681;</button>
                            </c:when>
                            <c:otherwise>
                                <span class="download-button disabled">&#128274;</span> <!-- 자물쇠 아이콘 -->
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</body>

</html>
