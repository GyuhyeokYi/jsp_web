package com.gnirfix.jsp3;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 8, maxRequestSize = 1024 * 1024 * 8)
@WebServlet(name = "mutiPartServlet", value = "/file-upload")
public class MutiPartServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       fileUpload(request, response);
    }

    public void fileUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "upload";
//        String uploadPath = request.getServletContext().getRealPath("") + File.separator + "upload";

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = null;
        try {
            for (Part part : request.getParts()) {
                fileName = part.getSubmittedFileName();
                part.write(uploadPath + File.separator + fileName);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("FileUpProc.jsp?uploadYn=N&fileName=" + encoding(fileName));
            return;
        }
        response.sendRedirect("FileUpProc.jsp?uploadYn=Y&fileName=" + encoding(fileName));
    }

    public String encoding(String name) {
        String nameUrl = URLEncoder.encode(name, StandardCharsets.UTF_8);
        return Base64.getEncoder().encodeToString(nameUrl.getBytes(StandardCharsets.UTF_8));
    }
}
