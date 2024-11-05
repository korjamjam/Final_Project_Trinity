<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약관리</title>
    <link rel="stylesheet" href="<%=path %>/resources/css/default/defalut.css">
    <link rel="stylesheet" href="<%=path %>/resources/css/admin/ReservationManagement_Detail.css">
</head>
<body>

<div class="reservation-management-detail">
    <h2>예약관리</h2>

    <div class="reservation-info">
        <table>
            <tr>
                <th>예약번호</th>
                <td>Reservation_num</td>
            </tr>
            <tr>
                <th>예약자명</th>
                <td>홍길동</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>user01</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>user01@kh.com</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>010-1234-5678</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>2000-12-07</td>
            </tr>

            <tr>
                <th>우편번호</th>
                <td><input type="text" value="06025"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" value="서울특별시 강남구 논현로158길 15 (신사동) ANGEM 빌딩">
                    <input type="text" value="1층 101호">
                </td>
            </tr>
            <tr>
                <th>예약병원</th>
                <td>밝은소아청소년과의원</td>
            </tr>
            <tr>
                <th>예약날짜</th>
                <td>
                    2024-10-24
                </td>
            </tr>
            <tr>
                <th>진료시간</th>
                <td>
                    <select>
                        <option value="AM">AM 09:00</option>
                        <option value="PM">Pm 03:00</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>진료과목</th>
                <td>소아청소년과</td>
            </tr>
            <tr>
                <th>증상</th>
                <td>기침, 콧물, 두통</td>
            </tr>
            <tr>
                <th>예약상태</th>
                <td>
                    <select>
                        <option value="예약완료">예약완료</option>
                        <option value="확인중">확인중</option>
                        <option value="진료완료">진료완료</option>
                    </select>
                </td>
            </tr>
        </table>
        <button class="save-button">저장하기</button>
    </div>
</div>

</body>
</html>
