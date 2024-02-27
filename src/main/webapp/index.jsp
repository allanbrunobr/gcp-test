<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.myapp.HelloAppEngine" %>
<html>
<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="./css/bootstrap.css">

  <title>Hello App Engine Standard Java 8</title>
</head>
<body>
<div class="container">
  <h1>Hello App Engine</h1>
  <form>
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    <div class="form-group form-check">
      <input type="checkbox" class="form-check-input" id="exampleCheck1">
      <label class="form-check-label" for="exampleCheck1">Check me out</label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>

</div>

<!-- Bootstrap JavaScript -->
<script src="./js/bootstrap.bundle.min.js"></script>
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