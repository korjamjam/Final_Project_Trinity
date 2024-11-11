<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>병원 조회</title>
</head>
<body>
    <h1>병원 조회</h1>

    <form action="/hospitals" method="get">
        <label for="sido">시도:</label>
        <input type="text" id="sido" name="sido" placeholder="예: 서울특별시" required>

        <label for="sigungu">시군구:</label>
        <input type="text" id="sigungu" name="sigungu" placeholder="예: 강남구">

        <label for="department">진료과목:</label>
        <select id="department" name="department" required>
            <option value="D001">소아청소년과</option>
            <option value="D002">산부인과</option>
        </select>

        <button type="submit">조회</button>
    </form>

    <h2>조회 결과</h2>
    <div>
        <pre>${hospitalInfo}</pre> <!-- JSON 데이터를 출력하는 부분 -->
    </div>
</body>
</html>
