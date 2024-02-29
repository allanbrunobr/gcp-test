package com.ecore.bruno.servlets;

import com.google.cloud.storage.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

//@WebServlet(name = "Upload", urlPatterns = {"/upload"})
//@MultipartConfig
public class UploadServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectId = "western-lambda-415113";
        String bucketName = "western-lambda-415113-ecore";

        Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();

        String fileName = UUID.randomUUID().toString(); // Gerar um nome de arquivo único
        BlobId blobId = BlobId.of(bucketName, fileName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();

        // Salvar o arquivo no Cloud Storage
        Blob blob = storage.create(blobInfo, request.getPart("file").getInputStream());

        response.getWriter().println("Arquivo enviado com sucesso: " + blob.getName());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../webapp/index.jsp").forward(request, response);
    }

}
