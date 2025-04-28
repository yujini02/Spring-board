<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>게시글 수정</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        th { background-color: #f2f2f2; width: 150px; }
        .btn-area { margin-top: 30px; text-align: right; }
        button { padding: 8px 20px; margin-left: 5px; }
    </style>
</head>
<body>

<h2>📄 게시글 상세보기</h2>

<form method="post" action="/board/modify">
    <input type="hidden" name="bno" value="${boardDTO.bno}" />

    <table>
        <tr>
            <th>등록자명</th>
            <td>${boardDTO.writer}</td>
            <th>등록일</th>
            <td>${boardDTO.regDate}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">
                <input type="text" name="title" value="${boardDTO.title}" style="width: 100%;" required />
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3">
                <textarea name="content" style="width: 100%; height: 200px;" required>${boardDTO.content}</textarea>
            </td>
        </tr>
    </table>

    <div class="btn-area">
        <button type="submit">수정</button>
        <button type="button" onclick="deleteBoard()">삭제</button>
        <a href="/board/list"><button type="button">목록</button></a>
    </div>
</form>

<!-- 삭제 전용 폼 추가 -->
<form id="deleteForm" method="post" action="/board/delete" style="display:none;">
    <input type="hidden" name="bno" value="${boardDTO.bno}" />
</form>

<script>
    function deleteBoard() {
        if (confirm('정말 삭제하시겠습니까?')) {
            document.getElementById('deleteForm').submit();
        }
    }
</script>

</body>
</html>