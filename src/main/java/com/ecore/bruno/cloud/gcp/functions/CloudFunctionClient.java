package com.ecore.bruno.cloud.gcp.functions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class CloudFunctionClient {

    public String callCloudFunction(String imageUrl) throws IOException {

        String cloudFunctionUrl = "https://us-central1-western-lambda-415113.cloudfunctions.net/storage2vision-function";
        String bucketName = "western-lambda-415113-ecore";

        URL url = new URL(cloudFunctionUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        String requestBody = "{\"bucket\": \"" + bucketName + "\", \"name\": \"" + imageUrl + "\"}";

        connection.getOutputStream().write(requestBody.getBytes());

        StringBuilder response = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String line;
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
        }
        return response.toString();
    }
}
