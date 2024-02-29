<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecore.bruno.HelloAppEngine" %>
<html>
<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="./css/bootstrap.min.css">

  <title>GCP - APP</title>
</head>
<body>
<div class="container">
  <h1>Preencha os campos abaixo </h1>
  <form class="needs-validation" action="/upload" method="post" enctype="multipart/form-data">
    <div class="form-group col-md-4">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Digite email" required>
      <div class="valid-tooltip">
        Looks good!
      </div>
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group col-md-4">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    <div class="form-group col-md-4">
      <label for="exampleFormControlFile1">Selecione o arquivo</label>
      <input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
    </div>
    <div class="form-group col-md-2">
      <button type="submit" class="btn btn-primary">Enviar</button>
    </div>
  </form>
</div>

<!-- Bootstrap JavaScript -->
<script src="./js/bootstrap.bundle.js"></script>

</body>

</html>


<!--
comando para criar um projeto novo:
mvn archetype:generate -Dappengine-version=1.9.59 -Djava17=true -DCloudSDK_Tooling=true -Dapplication-id=your-app-id -Dfilter=com.google.appengine.archetypes:
escoher a opcao 2 - A skeleton application with Google App Engine-->

<!--comando para testar local
mvn package -DskipTests
mvn jetty:run
-->

<!--comando para deploy no app engine
mvn package appengine:deploy -DskipTests -Dapp.deploy.projectId=western-lambda-415113
-->