package com.ecore.bruno.cloud.gcp.storage;

import com.ecore.bruno.cloud.gcp.functions.CloudFunctionClient;
import com.google.cloud.storage.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

public class UploadImageToStorage extends HttpServlet {
    private CloudFunctionClient cloudFunctionClient = new CloudFunctionClient();
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

        // Chamar a Cloud Function para analisar a imagem
        //String cloudFunctionResponse = cloudFunctionClient.callCloudFunction(fileName);

        // Configurar atributo para passar a resposta da função para a próxima página JSP
        //request.setAttribute("cloudFunctionResponse", cloudFunctionResponse);

        // Redirecionar para a página JSP que exibirá a resposta da função
       // request.getRequestDispatcher("pages/result.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../webapp/index.jsp").forward(request, response);
    }

}
