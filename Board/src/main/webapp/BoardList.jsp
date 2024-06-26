<%@ page import="model.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BoardBean" %>
<%@ page import="model.Pagination" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-14
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<style>
    td a, p a {
        text-decoration: none;
    }
</style>
<script>
    function change(target, over) {
        if (over) {
            target.style.textDecoration = "underline"
        } else {
            target.style.textDecoration = "none"
        }

    }
</script>
<body>
<%
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    // 현재 보고자하는 페이지 숫자를 저장
    int currentPage = Integer.parseInt(pageNum);

    BoardDAO dao = new BoardDAO();
    // 전체 게시글의 갯수를 읽어드리는 메소드 호출.
    int count = dao.getAllCount();

    int paeSize = 10;
    int pageBlock = 7;
    Pagination pagi = new Pagination(count, currentPage, paeSize, pageBlock);
    ArrayList<BoardBean> list = dao.getAllBoard(pagi.getStartRow(), pagi.getEndRow());
%>
<div class="container text-center">
    <h2>전체 게시글 보기</h2>
    <div class="container text-end">
        <button type="button" class="btn btn-primary" onclick="location.href='BoardWriteForm.jsp'">글쓰기</button>
    </div>
    <table class="table table-striped align-middle text-center">
        <colgroup>
            <col style="width: 7%;">
            <col style="width: auto;">
            <col style="width: 15%;">
            <col style="width: 15%;">
            <col style="width: 15%;">
            <col style="width: 10%;">
        </colgroup>
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">수정일</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (BoardBean board : list) {
        %>
        <tr>
            <th scope="row"><%= pagi.getNumber() - list.indexOf(board) %></th>
            <td class="text-start">
                <%
                    if (board.getRe_step() > 1) {
                        for (int i = 0; i < (board.getRe_step() - 1) * 2; i++) {
                %>
                &nbsp;
                <%
                        }
                    }
                %>
                <a href="BoardInfo.jsp?num=<%= board.getNum() %>" onmouseover="change(this, true)" onmouseout="change(this, false)"><%= board.getSubject() %></a>
                <%
                    if ("Y".equals(board.getNewYn())) {
                %>
                &nbsp;<span class="badge rounded-pill bg-danger">N</span>
                <%
                    }
                %>
            </td>
            <td><%= board.getWriter() %></td>
            <td><%= board.getReg_date() %></td>
            <td><%= board.getModi_date() %></td>
            <td><%= board.getReadcount() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="container">
        <p>
            <%
                if (pagi.getCount() > 0) {
                    // 이전이라는 링크를 만들건지 파악
                    if (pagi.getPreviousPage() > 0) {
            %>
            <a href="BoardList.jsp?pageNum=<%= pagi.getPreviousPage() %>"> [이전] </a>
            <%
                }
                for (int i = pagi.getStartPage(); i <= pagi.getEndPage(); i++) {
                    if ( i == pagi.getCurrentPage()) {
            %>
            <a href="BoardList.jsp?pageNum=<%= i %>"> <strong>[<%= i %>]</strong> </a>
            <%
            } else {
            %>
            <a href="BoardList.jsp?pageNum=<%= i %>"> [<%= i %>] </a>
            <%
                    }
                }
                // 다음이라는 링크를 만들건지 파악
                if (pagi.getNextPage() > 0) {
            %>
            <a href="BoardList.jsp?pageNum=<%= pagi.getNextPage() %>"> [다음] </a>
            <%
                    }
                }
            %>
        </p>
    </div>
</div>
</body>
</html>
