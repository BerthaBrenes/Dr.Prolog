<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<link href="styleIntroduction.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Enfermedad</title>
</head>
<body>
    <ul>
        <li><a class="active" href="Form.jsp">Agregar</a></li>
        <li><a href="Introduction.jsp">Consultar</a></li>
        <li class="title"><p text-center>Resultado de Examenes</p></li>
        <li class="imgKirbi"><img  src="kirbi.png" alt="kirbi" height="43" width="45" ></li>
    </ul> 
    <div>
        <c:forEach var = "tempEnfermedad" items = "${lista_enfermedades}">
                ${tempEnfermedad}<br><br>
        </c:forEach>
    </div>	
</body>
</html>