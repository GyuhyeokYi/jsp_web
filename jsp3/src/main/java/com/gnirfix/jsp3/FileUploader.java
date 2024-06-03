package com.gnirfix.jsp3;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 8, maxRequestSize = 1024 * 1024 * 8)
public class FileUploader {

    public void upload(@NotNull HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String uploadPath = getServletContext().getRealPath("") + File.separator + "upload";
        String uploadPath = request.getServletContext().getRealPath("") + File.separator + "upload";

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
            throw new IOException(e.getMessage());
        }
    }
}
