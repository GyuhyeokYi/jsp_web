package com.gnirfix.jsp3;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
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
        String uplaodYn = "Y";
        try {
            for (Part part : request.getParts()) {
                fileName = part.getSubmittedFileName();
                part.write(uploadPath + File.separator + fileName);
            }
        } catch (Exception e) {
            e.printStackTrace();
            uplaodYn = "N";
        }

        try {
            sendResult(uplaodYn, fileName, response);
        } catch (Exception e) {
            throw new IOException(e.getMessage());
        }

    }

    public void sendResult(String uploadYn, String fileName, HttpServletResponse response) throws IOException {
        String fileNameURL = URLEncoder.encode(fileName, "UTF-8");
        String fileNameBase64 = Base64.getEncoder().encodeToString(fileNameURL.getBytes(StandardCharsets.UTF_8));
        response.sendRedirect("FileUpProc.jsp?uploadYn=Y&fileName=" + fileNameBase64);
    }
}
