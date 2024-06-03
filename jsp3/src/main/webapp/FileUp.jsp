<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-03
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일업로드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container text-center">
    <form action="file-upload" method="post" enctype="multipart/form-data">
        <table class="table text-center align-middle">
            <tr>
                <td>이름</td>
                <td><input class="form-control" type="text" name="name"></td>
            </tr>
            <tr>
                <td>파일 선택</td>
                <td><input class="form-control" type="file" name="filedata"></td>
            </tr>
            <tr>
                <td colspan="2"><button class="btn btn-primary" type="submit">파일업로드</button></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
