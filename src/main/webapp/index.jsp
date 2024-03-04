<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <style>
    .custom-file-upload {
      display: inline-block;
      padding: 6px 12px;
      cursor: pointer;
      border: 1px solid #ccc;
      border-radius: 4px;
      background-color: #f8f9fa;
      color: #495057;
    }

    .custom-file-upload:hover {
      background-color: #e9ecef;
    }

    .custom-file-upload i {
      margin-right: 5px;
    }

    /* Esconder o input original */
    #file-upload {
      display: none;
    }
  </style>
  <title>GCP - APP</title>
</head>
<body>
<div class="container">
  <div class="card">
    <div class="card-header">
      Dados do Usuário
    </div>
    <div class="card-body">
      <form class="needs-validation" novalidate action="/uploadFileToStorage" method="post" enctype="multipart/form-data">
        <div class="row">
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
          <div class="col-md-4 mb-3">
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
          <div class="col-md-4 mb-3">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*\W)(?=.*\S).{8,20}" required
                   placeholder="Password">
            <div class="valid-feedback">
              Password válido.
            </div>
            <div class="invalid-feedback">
              A senha deve ter entre 8 e 20 caracteres e conter pelo menos um número, uma letra, um caractere especial e não pode conter espaços em branco
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 mb-3">
            <div class="card" style="width: 18rem;">
              <img src="" class="card-img-top" alt="Eu" id="uploaded-image">
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="form-group">
              <label for="file-upload" class="custom-file-upload">
                <i class="fas fa-cloud-upload-alt"></i> Escolher Arquivo
              </label>
              <input type="file" id="file-upload" name="file" accept="image/png, image/jpeg">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-2">
            <button class="btn btn-primary" type="submit">Enviar</button>
          </div>
        </div>
      </form>
    </div>
  </div>
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

<script>
  const fileUpload = document.getElementById('file-upload');
  const uploadedImage = document.getElementById('uploaded-image');

  fileUpload.addEventListener('change', function(event) {
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.onload = function(e) {
      uploadedImage.src = e.target.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    } else {
      uploadedImage.src = '';
    }
  });
</script>
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