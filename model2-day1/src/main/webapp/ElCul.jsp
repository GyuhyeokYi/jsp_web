<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-13
  Time: 오전 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>계산기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<script>

</script>
<div class="container text-center">
    <h2>계산기</h2>
    <form action="ElCul.jsp" method="post">
        <div class="d-flex justify-content-center">
            <table class="table align-middle text-center w-auto">
                <tr>
                    <td><input id="exp1" class="form-control w-auto inputNum" type="text" name="exp1" value="${param.exp1}"></td>
                    <td><select class="form-select w-auto" name="exp2" value="${param.exp2}">
                        <option value="+">+</option>
                        <option value="-">-</option>
                        <option value="*">*</option>
                        <option value="/">/</option>
                    </select></td>
                    <td><input class="form-control w-auto inputNum" type="text" name="exp3" value="${param.exp3}"></td>
                    <td>=</td>
                    <%
                        String exp2 = request.getParameter("exp2");
                        if ("-".equals(exp2)) {
                    %>
                    <td><input class="form-control w-auto" type="text" value="${param.exp1 - param.exp3}"></td>
                    <%
                        } else if ("*".equals(exp2)) {
                    %>
                    <td><input class="form-control w-auto" type="text" value="${param.exp1 * param.exp3}"></td>
                    <%
                        } else if ("/".equals(exp2)) {
                    %>
                    <td><input class="form-control w-auto" type="text" value="${param.exp1 / param.exp3}"></td>
                    <%
                        } else {
                    %>
                    <td><input class="form-control w-auto" type="text" value="${param.exp1 + param.exp3}"></td>
                    <%
                        }
                    %>
                    <td><button class="btn btn-primary" type="submit">결과보기</button></td>
                </tr>
            </table>
        </div>
    </form>
    <script>
        const data = {
            '+' : 0,
            '-' : 1,
            '*' : 2,
            '/' : 3
        }
        const list = document.querySelectorAll("select option")
        list[data['${param.exp2}']].selected = true

        const inputNums = document.querySelectorAll(".inputNum")
        inputNums.forEach((element) => {
            element.addEventListener("change", (e) => {
                e.target.value = e.target.value.replace(/[^0-9(.)]/g,"")
            })
        })
    </script>
</div>
</body>
</html>
