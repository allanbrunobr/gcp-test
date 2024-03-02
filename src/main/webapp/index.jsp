<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecore.bruno.HelloAppEngine" %>
<html>
<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="/css/bootstrap.min.css">

  <title>GCP - APP</title>
</head>
<body>
<div class="container">
  <h1>Preencha os campos abaixo </h1>
  <form class="needs-validation" novalidate action="/upload" method="post" enctype="multipart/form-data">
    <div class="col-md-4 mb-3">
      <label for="validationCustom01">First name</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="First name" required>
      <div class="valid-feedback">
        Nome válido
      </div>
      <div class="invalid-feedback">
        O nome não pode ser em branco.
      </div>
    </div>
    <div class="form-group col-md-4">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Digite email"
             data-toggle="tooltip" data-placement="top" title="Tooltip on top" required>
      <div class="valid-feedback">
        E-mail válido.
      </div>
      <div class="invalid-feedback">
        Digite um e-mail válido.
      </div>
    </div>
    <div class="form-group col-md-4">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*\W)(?=.*\S).{8,20}" required
             required placeholder="Password">
      <div class="valid-feedback">
        Password válido.
      </div>
      <div class="invalid-feedback">
        A senha deve ter entre 8 e 20 caracteres e conter pelo menos um número, uma letra, um caractere especial e não pode conter espaços em branco
      </div>
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

<script>

  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  })();
</script>

<!-- Bootstrap JavaScript -->
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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