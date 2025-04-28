<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>게시판 목록</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        th { background-color: #f2f2f2; }
        .content-preview { text-align: left; }
    </style>
</head>
<body>

<h2>📄 게시판 목록</h2>

<!-- 🔍 검색 영역 -->
<form method="get" action="/board/list">
    <select name="type">
        <option value="">-- 검색선택 --</option>
        <option value="t" ${param.type == 't' ? 'selected' : ''}>제목</option>
        <option value="c" ${param.type == 'c' ? 'selected' : ''}>내용</option>
        <option value="w" ${param.type == 'w' ? 'selected' : ''}>등록자명</option>
    </select>

    <input type="text" name="keyword" value="${param.keyword}" placeholder="검색어를 입력하세요" />
    <button type="submit">🔍검색</button>
    <a href="/board/list">초기화</a>
</form>

<br/>

<!-- 📋 목록 테이블 -->
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성자</th>
        <th>등록일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${boardDTOList}" varStatus="status">
        <tr>
            <td>${boardDTOList.size() - status.index}</td>
            <td><a href="/board/modify?bno=${dto.bno}">${dto.title}</a></td>
            <td>${dto.content}</td>
            <td>${dto.writer}</td>
            <td>${dto.regDate}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 📄 페이지네이션 -->
<div style="margin-top: 20px;">
    <c:forEach begin="1" end="${totalPage}" var="i">
        <a href="?page=${i}&keyword=${param.keyword}"
           style="${page == i ? 'font-weight:bold; color:red;' : ''}">${i}</a>&nbsp;
    </c:forEach>
</div>

<!-- 📝 글쓰기 버튼 -->
<br/>
<a href="/board/register">
    <button>글쓰기</button>
</a>

</body>
</html>