<%@ page import="model.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BoardBean" %><%--
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
    int pageSize = 10;
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    int count = 0;  // 전체 글의 갯수를 저장하는 변수
    int number = 0; // 페이지 넘버링 변수

    // 현재 보고자하는 페이지 숫자를 저장
    int currentPage = Integer.parseInt(pageNum);

    BoardDAO dao = new BoardDAO();
    // 전체 게시글의 갯수를 읽어드리는 메소드 호출.
    count = dao.getAllCount();

    // 현재 페이지에 보여줄 시작번호 설정 = 데이터 베이스에서 불러올 시작번호
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;

    // 최신글 10개를 기분으로 게시글을 리턴 받아주는 메소드 호출

    ArrayList<BoardBean> list = dao.getAllBoard(startRow, endRow);

    number = count - (currentPage - 1) * pageSize;
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
            <col style="width: 10%;">
        </colgroup>
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
<%--            <th scope="col">수정일</th>--%>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (BoardBean board : list) {
        %>
        <tr>
            <th scope="row"><%= number-- %></th>
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
<%--            <td><%= board.getModi_date() %></td>--%>
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
                int pageBlock = 7; // 카운터링 숫자
                if (count > 0) {
                    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
                    int startPage = 1;
                    if (currentPage % pageBlock != 0) {
                        startPage = (int)(currentPage / pageBlock) * pageBlock + 1;
                    } else {
                        startPage = ((int)(currentPage / pageBlock) - 1) * pageBlock  + 1;
                    }

                    int endPage = startPage + pageBlock - 1; //화면에 보여질 페이지의 마지막 숫자

                    if (endPage > pageCount) endPage = pageCount;

                    // 이전이라는 링크를 만들건지 파악
                    if (startPage > pageBlock) {
            %>
            <a href="BoardList.jsp?pageNum=<%= startPage - pageBlock %>"> [이전] </a>
                        <%
                    }
                    for (int i = startPage; i <= endPage; i++) {
                        if ( i == currentPage) {
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
                    if (endPage < pageCount) {
            %>
            <a href="BoardList.jsp?pageNum=<%= startPage + pageBlock %>"> [다음] </a>
            <%
                    }
                }
            %>

        </p>
    </div>
</div>
</body>
</html>
