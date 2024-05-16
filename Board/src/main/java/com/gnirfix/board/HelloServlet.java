package com.gnirfix.board;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.BoardBean;
import model.BoardDAO;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");

        BoardBean boardBean = new BoardBean();
        boardBean.setNum(1);
        boardBean.setWriter("gyuhyeok");
        boardBean.setContent("안녕하세요!");

        out.println("<div>");
        out.println(boardBean.toString());
        out.println("</div>");

        BoardDAO dao = new BoardDAO();
        int result = dao.testCon();
        out.println("<div> 게시글 갯수 : " + result + "</div>");

        out.println("</body></html>");
    }

    public void destroy() {
    }
}