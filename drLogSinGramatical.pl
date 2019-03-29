print(Term) :-
    write_term(Term, [ portray(true),
                       numbervars(true),
                       quoted(true)
                     ]).
%saludo
saludo([hola|S],S).
saludo([disculpe|S],S).
saludo([buenos|S],S).
saludo([buenas|S],S).
saludo([dias|S],S).
saludo([tardes|S],S).
saludo([noches|S],S).

%despedida
despedida([adios|S],S).
despedida([chao|S],S).
despedida([hasta|S],S).
despedida([luego|S],S).
despedida([muchas|S],S).
despedida([gracias|S],S).
despedida([buenos|S],S).
despedida([buenas|S],S).
despedida([dias|S],S).
despedida([tardes|S],S).
despedida([noches|S],S).
%verbos
verbo(tengo).
verbo(tenia).
verbo(tuve).
verbo(siento).
verbo(sentia).
verbo(senti).
verbo(padezco).
verbo(padecia).
verbo(padeci).
verbo(he).
verbo([tengo|S],S).
verbo([tenia|S],S).
verbo([tuve|S],S).
verbo([siento|S],S).
verbo([sentia|S],S).
verbo([senti|S],S).
verbo([padezco|S],S).
verbo([padecia|S],S).
verbo([padeci|S],S).
verbo([he|S],S).
verbo([tomar|S],S).
verbo([conseguir|S],S).
verbo([consigo|S],S).
verbo([tomo|S],S).
verbo([compro|S],S).
verbo([prevenirla|S],S).
verbo([causa|S],S).
verbo([provoca|S],S).
verbo([provoco|S],S).
verbo([es|S],S).
verbo([prevenir|S],S).
verbo([puedo|S],S).


%preguntas 
preguntas([que|S],S).
preguntas([como|S],S).
preguntas([cuando|S],S).
preguntas([donde|S],S).
preguntas([cual|S],S).


% Articulos
articulo(lo).
articulo(la).
articulo(las).
articulo(los).
articulo([el|S],S).
For help, use ?- help(
articulo([lo|S],S).
articulo([la|S],S).
articulo([las|S],S).
articulo([los|S],S).
articulo([me|S],S).
articulo([un|S],S).
articulo([una|S],S).
articulo([debo|S],S).
articulo([el|S],S).


%Nombres
nombre(doctor).
nombre([doctor|S],S).
nombre([enfermedad|S],S).
nombre([enfermo|S],S).
nombre([enfermedad|S],S).
nombre([mal|S],S).
% Separacion de las oraciones en listas
% Lo que hace es que recibe, un parametro X y lo convierte a una lista L

%sintaxis nominal 

sintaxis_nominal(Z,S):-articulo(Z,Y),nombre(Y,S).
sintaxis_nominal(Z,S):-saludo(Z,Y),nombre(Y,S).
sintaxis_nominal(Z,S):-articulo(Z,S).
sintaxis_nominal(Z,S):-nombre(Z,S).
%sintaxis_nominal(Z,S):-despedida(Z,S).

%sintaxis para verbos
sintaxis_verbal(Z,S):-verbo(Z,Y),sintaxis_verbal(Y,S).
sintaxis_verbal(Z,S):-verbo(Z,Y), sintaxis_nominal(Y,S).
sintaxis_verbal(Z,S):-verbo(Z,Y),sintoma(Y,S).

%sintaxis preguntas
sintaxis_verbal(Z,S):-preguntas(Z,X),articulo(X,Y),verbo(Y,S).
sintaxis_verbal(Z,S):-preguntas(Z,X),verbo(X,Y),articulo(Y,V),verbo(V,S).
sintaxis_verbal(Z,S):-preguntas(Z,X),verbo(X,Y),verbo(Y,S).
sintaxis_verbal(Z,S):-preguntas(Z,X),articulo(X,Y),verbo(Y,V),verbo(V,S).
%sintaxis saludo
sintaxis_saludo(Z,S):-saludo(Z,Y),nombre(Y,S).
sintaxis_saludo(Z,S):-saludo(Z,Y),saludo(Y,X),nombre(X,S).

sintaxis_despedida(Z,S):-despedida(Z,Y),nombre(Y,S).
sintaxis_despedida(Z,S):-despedida(Z,Y),despedida(Y,X),nombre(X,S).
sintaxis_despedida(Z,S):-despedida(Z,Y),despedida(Y,X),nombre(X,S),despedida(Z,Y),despedida(Y,X).
sintaxis_despedida(Z,S):-despedida(Z,Y),nombre(Y,X),despedida(X,V),despedida(V,S).
sintaxis_despedida(Z,S):-despedida(Z,Y),despedida(Y,X),nombre(X,V),despedida(V,S).

%sintomas
sintoma(tos).
sintoma(dolor).
sintoma(diarrea).
sintoma(sudoracion).
sintoma(escalofrios).
sintoma(estrenimiento).
sintoma(sangrado).
sintoma(congestion).
sintoma(nauseas).
sintoma(vomito).
sintoma(estornudos).
sintoma(migrana).
sintoma(alergia).
sintoma(mareos).
sintoma(deshidratacion).
sintoma(calambre).
sintoma(indigestion).
sintoma(agrura).
sintoma(reflujo).
sintoma(calentura).
sintoma(fiebre).
sintoma(cansancio).
sintoma(devanecimiento).
sintoma(hipoglicemia).
sintoma(hiperglicemia).
sintoma(presion).
sintoma(picazon).
sintoma(sarpullido).
sintoma(conjuntivitis).
sintoma(X):-dolor(X).%dolor
sintoma(X):-presion(X).%presion

%Sistoma analis
sintoma([tos|S],S).
sintoma([dolor|S],S).
sintoma([diarrea|S],S).
sintoma([sudoracion|S],S).
sintoma([escalofrios|S],S).
sintoma([estrenimiento|S],S).
sintoma([sangrado|S],S).
sintoma([congestion|S],S).
sintoma([nauseas|S],S).
sintoma([vomito|S],S).
sintoma([estornudos|S],S).
sintoma([migrana|S],S).
sintoma([alergia|S],S).
sintoma([mareos|S],S).
sintoma([deshidratacion|S],S).
sintoma([calambre|S],S).
sintoma([indigestion|S],S).
sintoma([agrura|S],S).
sintoma([reflujo|S],S).
sintoma([calentura|S],S).
sintoma([fiebre|S],S).
sintoma([cansancio|S],S).
sintoma([devanecimiento|S],S).
sintoma([hipoglicemia|S],S).
sintoma([hiperglicemia|S],S).
sintoma([presion|S],S).
sintoma([picazon|S],S).
sintoma([sarpullido|S],S).
sintoma([conjuntivitis|S],S).

presion(baja).
presion(alta).
%dolor(parte del cuerpo).
dolor(cabeza).
dolor(estomago).
dolor(dientes).
dolor(muscular).
dolor(piernas).
dolor(oido).
dolor(espalda).
dolor(glandulas).
dolor(cuerpo).
dolor(ovarios).
dolor(todo):-dolor(cabeza),dolor(estomago),dolor(dientes),dolor(muscular),dolor(piernas),dolor(oido),dolor(espalda),dolor(glandulas),dolor(cuerpo).

enfermedad(vertigo,mareo).
enfermedad(vertigo,desvanecimiento).
enfermedad(vertigo,migrana).
enfermedad(vertigo,cansancio).
enfermedad(vertigo,nauseas).

enfermedad(gripe,tos).
enfermedad(gripe,calentura).
enfermedad(gripe,fiebre).
enfermedad(gripe,dolor).
enfermedad(gripe,congestion).
enfermedad(gripe,cansancio).
enfermedad(gripe,deshidratacion).
enfermedad(gripe,estornudos).

enfermedad(colitis,agrura).
enfermedad(colitis,estomago).
enfermedad(colitis,reflujo).
enfermedad(colitis,diarrea).
enfermedad(colitis,estrenimiento).
enfermedad(colitis,calambres).
enfermedad(colitis,indigestion).

enfermedad(cordales,dientes).
enfermedad(cordales,cabeza).
enfermedad(cordales,sangrado).
enfermedad(cordales,migrana).
enfermedad(cordales,calentura).
enfermedad(cordales,fiebre).

enfermedad(dengue,sangrado).
enfermedad(dengue,todo).
enfermedad(dengue,picazon).
enfermedad(dengue,sarpullido).
enfermedad(dengue,fiebre).
enfermedad(dengue,calentura).

enfermedad(zika,cansancio).
enfermedad(zika,cabeza).
enfermedad(zika,fiebre).
enfermedad(zika,calentura).
enfermedad(zika,sarpullido).
enfermedad(zika,vomito).
enfermedad(zika,sudoracion).
enfermedad(zika,escalofrios).

enfermedad(asma,tos).
enfermedad(asma,congestion).
enfermedad(asma,estornudos).
enfermedad(asma,mareos).
enfermedad(asma,cansancio).
enfermedad(asma,desvanecimientos).

enfermedad(sarampion,sarpullido).
enfermedad(sarampion,tos).
enfermedad(sarampion,fiebre).
enfermedad(sarampion,calentura).
enfermedad(sarampion,escalofrios).
enfermedad(sarampion,todo).

pregunta(que).
pregunta(cuando).
pregunta(como).
pregunta(donde).
pregunta(cuanto).

%prevencion
prevencion(vertigo,[no,salir,de,la,casa,someterse,a,revisiones,auditivas,periodicas,mantener,una,buena,postura,corporal,evitar,cambios,subitos,de,posicion]).

prevencion(colitis,[mantener,una,dieta,balanceada,controlar,el,estres,tomar,al,menos,8,vasos,de,liquido,al,dia,mantener,horario,fijo,de,comidas]).

prevencion(dengue,[evitar,recipientes,con,agua,acomulada,utilizar,repelentes,evitar,automedicarse,por,ultimo,beber,abundantes,liquidos]).

prevencion(zika,[evitar,recipientes,con,agua,acomulada,utilizar,repelentes,evitar,automedicarse,por,ultimo,beber,abundantes,liquidos]).

prevencion(asma,[evitar,el,polvo,cubrir,las,camas,con,fundas,antialergicas,mantener,los,niveles,de,humedad,bajos,seguir,el,tratamiento,recetado,siempre,utilizar,el,inhalador,correctamente]).

prevencion(sarampion,[evitar,contacto,con,personas,contagiadas,mantener,vacunas,al,dia,beber,abundantes,liquidos,evitar,ir,a,lugares,concurridos]).

prevencion(gripe,[descansar,beber,abundante,liquidos,evitar,consumo,de,tabaco,o,alcohol,y,comer,frutas]).

prevencion(cordales,[aplicar,hielo,en,la,parte,externa,de,la,cara,evitar,el,consumo,de,tabaco,evitar,tomar,aspirina,mantener,una,correcta,higiene,bucal]).

%causas
causa(gripe,[virus,de,la,influenza,o,contacto,con,personas,infectadas]).

causa(vertigo,[infecciones,de,oido,o,regulacion,anormal,de,la,presion,arterial,o,trastornos,neurologicos]).

causa(colitis,[infecciones,causadas,por,virus,o,paracitos,o,intoxicacion,alimentaria]).

causa(cordales,[falta,de,espacio,en,la,boca,al,momento,de,salir,el,diente]).

causa(dengue,[picadura,de,mosquitos]).

causa(zika,[picadura,de,mosquitos]).

causa(asma,[inflamacion,de,las,vias,respiratorias]).

causa(sarampion,[puede,ser,virus,del,sarampion,o,el,contacto,con,personas,infectadas]).

%tratamiento
tratamiento(gripe,[analgesicos,habituales,como,paracetamol,e,ibuprofeno]).

tratamiento(vertigo,[tomar,diureticos,y,betahistina]).

tratamiento(colitis,[tomar,antiinflamatorios,analgesicos,suplementos,de,hierro]).

tratamiento(cordales,[lo,mejor,es,una,extraccion]).

tratamiento(dengue,[tomar,liquidos,en,caso,de,deshidratacion,y,paracetamol,ademas,de,reposo]).

tratamiento(zika,[tomar,liquidos,en,caso,de,deshidratacion,y,paracetamol,ademas,de,reposo]).

tratamiento(asma,[corticoesteroides,inhalados,broncodilatadores,ipratropio,y,termoplastia_bronquial]).

tratamiento(sarampion,[tomar,antitermicos,antitusigenos,reposo]).

pregunta_enfermedad(X,Y,Z,Enfermedad):-
    enfermedad(Enfermedad,X),
    enfermedad(Enfermedad,Y),
    enfermedad(Enfermedad,Z).
% elimine la comprobacion de sintomas ya que en la funcion de
% busqueSintomas compruebo que son sintomas lo que ingresa

/*crea una lista de �tomos. Donde SL es una lista original y L es la list *a a devolver que es la inversa de SL.
*/
atomList(SL, L):- toAtom(SL, [], Y), reverse(L, Y).

/*Una funci�n que crea �tomos para la lista �tomos. Donde la primera Y es la funci�n de parada. Y en la segunda, X es la cabeza, Cola es la cola,  Y
 */
toAtom([],Y, Y).

toAtom([X|Cola], Y, Z):- atom_string(A, X), toAtom(Cola, [A|Y], Z).
digaRecomendacion(Enfermedad):-read(OracionAux),inicio(OracionAux),tratamiento(Enfermedad,L),atomic_list_concat(L,' ',X),string_concat("Vas a tomar: ",X,Tratamiento),write(Tratamiento),digaCausa(Enfermedad).
digaCausa(Enfermedad):-read(OracionAux),inicio(OracionAux),causa(Enfermedad,L),atomic_list_concat(L,' ',X),string_concat("La causa es: ",X,Causa),write(Causa),digaConsejos(Enfermedad).
digaConsejos(Enfermedad):-read(OracionAux),inicio(OracionAux),prevencion(Enfermedad,L),atomic_list_concat(L,' ',X),string_concat("El recomendacion es: ",X,Consejo),write(Consejo),read(despedida),oracionDespedida(despedida,[]),write("hasta luego").


inicio(X):-atomic_list_concat(L,' ',X),oracion(L,[]).
oracion(L,S):-sintaxis_saludo(L,S).
oracion(L,S):-sintaxis_nominal(L,X),sintaxis_verbal(X,S).
oracion(L,S):-sintaxis_verbal(L,S).
oracionDespedida(X,S):-atomic_list_concat(L,' ',X),sintaxis_despedida(L,S).

%Gramaticas libres de Contexto
%
%Inicia el programa, no inicia hasta que reciba un saludo
drLogStart:-write("Hola, este es Doctor Log"),read(SalAux),inicio(SalAux),write("que lo trae a mi consultorio?"),pregunteSintomas.
drLogStart:-write("No entiendo, repite de nuevo"),drLogStart.

% recibe una oracion, la vuelve una lista y busca los sintomas en dicha
% oracion
%***IMPORTANTE: LA ORACION DEBE ESTAR ENTRE COMILLAS ("")
pregunteSintomas:-read(OracionAux),atomic_list_concat(OracionLista,' ',OracionAux),busqueSintomas(OracionLista,[],Sintomas),digaEnfermedad(Sintomas).
pregunteSintomas:-read(OracionAux),inicio(OracionAux),write("que sintomas tiene"),pregunteSintomas.
pregunteSintomas:-write("No entiendo, repita de nuevo lo que tiene"),pregunteSintomas.

% obtiene los primeros 3 valores de la lista de sintomas y los ingresa
% al deductor, lo que devuelve una enfermedad, la concatena con la linea
% que dice que tiene y imprime el diagnostico.
digaEnfermedad(ListaSintomas):-primero(ListaSintomas,A),segundo(ListaSintomas,B),tercero(ListaSintomas,C),pregunta_enfermedad(A,B,C,Enfermedad),atom_string(Enfermedad,EnfermedadString),string_concat("Parece que tiene ",EnfermedadString,Diagnostico),write(Diagnostico),digaRecomendacion(Enfermedad).

%busca sintomas en una lista
busqueSintomas([],Y,Y). %caso base, lista vacia
busqueSintomas([X|Cola], Y, Z):-sintoma(X),busqueSintomas(Cola,[X|Y], Z). %si el inicio es un sintoma lo mete a la lista
busqueSintomas([X|Cola], Y, Z):-not(sintoma(X)),busqueSintomas(Cola,Y, Z). %sino, lo omite

%Obtiene los objetos en las posiciones respectivas de una lista
primero([E|_],E).
segundo([_,E|_],E).
tercero([_,_,E|_],E).

