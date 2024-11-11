<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <h4>첨부파일 :</h4>
            <button class="white-button">모두저장</button>
        </div>
    
        <!-- 첫 번째 첨부파일 -->
        <div class="file-container">
            <div class="file-info">
                <span class="file-name">sample-file1.pdf</span>
                <span class="file-size">(10.1MB)</span>
            </div>
            <div class="file-download">
                <button class="download-button">&#8681;</button>
            </div>
        </div>
    
        <!-- 두 번째 첨부파일 -->
        <div class="file-container">
            <div class="file-info">
                <span class="file-name">sample-file2.docx</span>
                <span class="file-size">(2.5MB)</span>
            </div>
            <div class="file-download">
                <button class="download-button">&#8681;</button>
            </div>
        </div>
    
        <!-- 세 번째 첨부파일 -->
        <div class="file-container">
            <div class="file-info">
                <span class="file-name">sample-file3.xlsx</span>
                <span class="file-size">(5.7MB)</span>
            </div>
            <div class="file-download">
                <button class="download-button">&#8681;</button>
            </div>
        </div>
    
        <!-- 네 번째 첨부파일 -->
        <div class="file-container">
            <div class="file-info">
                <span class="file-name disabled-file">sample-file4.pptx</span>
                <span class="file-size">(12.3MB)</span>
            </div>
            <div class="file-download">
                <span class="download-button disabled">&#128274;</span> <!-- 자물쇠 아이콘 -->
            </div>
        </div>
    </div>
    
</body>

</html>
