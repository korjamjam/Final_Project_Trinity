<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Post Management Detail</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/post_management_detail.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp"/>

<div class="post-management-detail">
    <h2>예약관리</h2>

    <div class="post-info">
        <table>
            <tr>
                <th>게시글번호</th>
                <td>1</td>
            </tr>
     
            <tr>
                <th>작성자 아이디</th>
                <td>user01</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>user01@kh.com</td>
            </tr>
            <tr>
                <th>글제목</th>
                <td>이 병원은 가지마세요</td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td>자유</td>
            </tr>

            <tr>
                <th>글내용</th>
                <td>
                    <p>병원 시설도 안 좋고 무엇보다 주차 공간이 없습니다.</p><br>
                    <p>간호사분들도 불친절하고 뭐하나 좋은게 없습니다.</p>
                </td>
            </tr>
    
            <tr>
                <th>작성일</th>
                <td>
                    2024-10-24
                </td>
            </tr>

            <tr>
                <th>조회수</th>
                <td>
                    33
                </td>
            </tr>
        
            <tr>
                <th>비밀글</th>
                <td>
                    <select>
                        <option value="예약완료">공개</option>
                        <option value="확인중">비공개</option>
                    
                    </select>
                </td>
            </tr>
        </table>
        <button class="save-button">저장하기</button>
    </div>
</div>

</body>
</html>
