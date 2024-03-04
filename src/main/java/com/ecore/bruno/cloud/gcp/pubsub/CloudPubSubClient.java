package com.ecore.bruno.cloud.gcp.pubsub;

import com.google.cloud.pubsub.v1.Publisher;
import com.google.protobuf.ByteString;
import com.google.pubsub.v1.ProjectTopicName;
import com.google.pubsub.v1.PubsubMessage;

public class CloudPubSubClient {

    public void sendMessageToTopic(String projectId, String topicId, String message) throws Exception {
        // Configurar o nome do tópico
        ProjectTopicName topicName = ProjectTopicName.of(projectId, topicId);
        Publisher publisher = null;

        try {
            // Criar um publisher para o tópico
            publisher = Publisher.newBuilder(topicName).build();

            // Codificar a mensagem como um array de bytes
            ByteString data = ByteString.copyFromUtf8(message);

            // Criar uma mensagem Pub/Sub
            PubsubMessage pubsubMessage = PubsubMessage.newBuilder().setData(data).build();

            // Publicar a mensagem no tópico
            publisher.publish(pubsubMessage);

            System.out.println("Mensagem publicada com sucesso no tópico: " + topicName.toString());
        } finally {
            // Fechar o publisher após o uso
            if (publisher != null) {
                publisher.shutdown();
            }
        }
    }
}

