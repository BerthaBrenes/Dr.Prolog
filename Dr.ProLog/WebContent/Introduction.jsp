<html >
<head>
<link href="styleIntroduction.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Consultorio Prolog</title>
<img src="kirbi.png" alt="kirbi" height="4" width="5" >
</head>
<body>
<ul>
    <li><a class="active" href="Form.jsp">Agregar</a></li>
    <li><a href="Introduction.jsp">Consultar</a></li>
    <li class="title"><p text-center>Dr.Prolog</p></li>
    <li class="imgKirbi"><img  src="kirbi.png" alt="kirbi" height="43" width="45" ></li>
</ul>  
<div>
   <p>Este es el portal del consulturo del Doctor Log, puedes aca consultar cual es su enfermedad de acuerdo a sus sintomas, por lo que se le solicita que ingrese sus sintomas</p>
</div>

<div id="wrapper">
    <form action="DoctorController" method="post">
        <input name="usermsg" type="text" id="usermsg" size="63" />
        <input class="button" name="submitmsg" type="submit"  id="submitmsg" value="Enviar" />
    </form>
</div>
</body>
</html>