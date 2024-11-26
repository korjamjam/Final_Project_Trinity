<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>첨부파일 상세보기</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
            <!-- Custom CSS -->
            <link rel="stylesheet"
                href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
        </head>

        <body>
            <div class="container my-5">
                <!-- 첨부파일이 있는 경우에만 표시 -->
                <c:if test="${not empty attachedFiles}">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">첨부파일 목록</h5>
                            <button class="btn btn-outline-primary btn-sm" onclick="downloadAllFiles()">
                                <i class="bi bi-cloud-download"></i> 모두 저장
                            </button>
                        </div>
                        <ul class="list-group list-group-flush">
                            <c:forEach var="file" items="${attachedFiles}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-file-earmark me-3" style="font-size: 1.5rem;"></i>
                                        <c:choose>
                                            <c:when test="${file.allowDownload == 'Y'}">
                                                <a href="${pageContext.request.contextPath}/downloadFile?fileName=${file.changeName}&fileNo=${file.fileNo}"
                                                    download="${file.originName}">
                                                    ${file.originName}
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <span>${file.originName}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <c:choose>
                                        <c:when test="${file.allowDownload == 'Y'}">
                                            <span class="badge bg-success">
                                                <i class="bi bi-check-circle"></i>
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">
                                                <i class="bi bi-x-circle"></i>
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

            <script>
                function downloadAllFiles() {
                    alert("모두 저장 기능은 아직 구현되지 않았습니다.");
                    // 서버 호출로 모든 파일 다운로드 기능 추가 가능.
                }
            </script>
        </body>

        </html>