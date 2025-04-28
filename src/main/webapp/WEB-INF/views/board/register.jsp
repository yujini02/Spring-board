<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>게시글 등록</title>
    <style>
        body {
            margin: 40px;
            font-family: '맑은 고딕', sans-serif;
        }

        h2 {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f9f9f9;
            width: 150px;
            padding: 12px;
            text-align: right;
            border-right: 1px solid #ddd;
        }

        td {
            padding: 12px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        textarea {
            height: 150px;
            resize: vertical;
        }

        .btn-box {
            margin-top: 20px;
            text-align: right;
        }

        .btn {
            padding: 8px 16px;
            border: 1px solid #ccc;
            margin-left: 6px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #005bac;
            color: white;
            border: none;
        }
    </style>
</head>
<body>

<h2>📝 게시글 등록</h2>

<form method="post" action="/board/register">
    <table>
        <tr>
            <th>작성자</th>
            <td>
                ${writerName}
                <input type="hidden" name="writer" value="${writerName}" />
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title" required /></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" required></textarea></td>
        </tr>
    </table>

    <div class="btn-box">
        <a href="/board/list" class="btn btn-primary">취소</a>
        <button type="submit" class="btn">등록</button>
    </div>
</form>

</body>
</html>