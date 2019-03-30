<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> -->
<html>
<head>
<link href="Form.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Enter your sickness</title>
</head>

<body>
    <ul>
        <li><a class="active" href="Form.jsp">Agregar</a></li>
        <li><a href="Introduction.jsp">Consultar</a></li>
        <li class="title"><p text-center>Dr.Prolog</p></li>
        <li class="imgKirbi"><img  src="kirbi.png" alt="kirbi" height="43" width="45" ></li>
</ul>
<div>
    <h1>Esta pagina es para agregar informacion de su nueva enfermedad</h1>
</div> 

<form action="FormController" method= "post">
	<div>
        <label for="name">Enfermedad:</label>
        <input type="text" id="name" name="sickness_name" />
    </div>
    <div>
        <label for="cause">Causas (separadas por ","):</label>
        <textarea id="cause" name="sickness_cause"></textarea>
    </div>
    <div>
        <label for="symptoms">Sintomas(separados por ","):</label>
        <textarea id="text" name="sickness_symptoms"></textarea>
    </div>
    <div>
        <label for="treatment">Tratamiento:</label>
        <textarea id="treatment" name="sickness_treatment"></textarea>
    </div>
    <div>
        <label for="recomendation">Recomendaciones:</label>
        <textarea id="recomendation" name="sickness_recomendation"></textarea>
    </div>
    <div class="button">
        <button type="submit">Envia tu enfermedad</button>
    </div>
</form>

</body>
</html>