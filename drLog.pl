print(Term) :-
    write_term(Term, [ portray(true),
                       numbervars(true),
                       quoted(true)
                     ]).
%Inicio de una conversacion
saludo([hola|S],S).
saludo([disculpe|S],S).
saludo([buenos_dias|S],S).
saludo([buenas_tardes|S],S).
saludo([buenas_noches|S],S).

%Fin de una conversacion
despedida([gracias|S],S).
despedida([adios|S],S).
despedida([hasta_luego|S],S).
despedida([chao|S],S).

%verbos
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
% Aqui se va a colocar la composicion de una oracion para lograr identificar las partes de la oracion.
% Pronombres
pronombre(él).
pronombre(él).
pronombre(ella).
pronombre(ella).
pronombre(yo).


% Articulos
articulo([el|S],S).
articulo([lo|S],S).
articulo([la|S],S).
articulo([las|S],S).
articulo([los|S],S).
articulo([me|S],S).
articulo([un|S],S).
articulo([una|S],S).

%Nombres
nombre([doctor|S],S).
nombre([enfermedad|S],S).
nombre([enfermo|S],S).
nombre([enfermedad|S],S).
% Separacion de las oraciones en listas
% Lo que hace es que recibe, un parametro X y lo convierte a una lista L

sintaxis_nominal(Z,S):-articulo(Z,Y),nombre(Y,S).
sintaxis_nominal(Z,S):-saludo(Z,Y),nombre(Y,S).
sintaxis_nominal(Z,S):-despedida(Z,S).
%sintaxis para verbos
sintaxis_verbal(Z,S,E):-verbo(Z,Y),sintaxis_verbal(Y,S,E).
sintaxis_verbal(Z,S,E):-verbo(Z,Y), sintaxis_nominal(Y,S),E.
%sintaxis_verbal(Z,S):-verbo(Z,Y), sintoma(Y,S).
%sintaxis_verbal(Z,S):-verbo(Z,Y), sintoma(Y,X).

sintaxis_verbal(Z,S,E):-sintoma(Z,Y),sintoma(Y,A),sintoma(A,S),pregunta_enfermedad(Z,Y,A,S,E).


%sintomas
sintoma(tos).
sintoma(dolor).
sintoma(diarrea).
sintoma(sudoracion).
sintoma(escalofrios).
sintoma(estreñimiento).
sintoma(sangrado).
sintoma(congestion).
sintoma(nauseas).
sintoma(vomito).
sintoma(estornudos).
sintoma(migraña).
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
presion(baja).
presion(alta).


%Sistoma analis
sintoma([tos|S],S).
sintoma([dolor|S],S).
sintoma([diarrea|S],S).
sintoma([sudoracion|S],S).
sintoma([escalofrios|S],S).
sintoma([estreñimiento|S],S).
sintoma([sangrado|S],S).
sintoma([congestion|S],S).
sintoma([nauseas|S],S).
sintoma([vomito|S],S).
sintoma([estornudos|S],S).
sintoma([migraña|S],S).
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

%para el analisis semantico
dolor([cabeza|S],S).
dolor([estomago|S],S).
dolor([dientes|S],S).
dolor([muscular|S],S).
dolor([piernas|S],S).
dolor([oido|S],S).
dolor([espalda|S],S).
dolor([glandulas|S],S).
dolor([cuerpo|S],S).
dolor([ovarios|S],S).
dolor([todo|S],S):-dolor([cabeza|S],S), dolor([estomago|S],S),dolor([dientes|S],S),dolor([muscular|S],S),dolor([piernas|S],S),dolor([oido|S],S),dolor([espalda|S],S),dolor([glandulas|S],S),dolor([cuerpo|S],S),dolor([ovarios|S],S).



enfermedad(vertigo,mareo).
enfermedad(vertigo,desvanecimiento).
enfermedad(vertigo,migraña).
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
enfermedad(colitis,estreñimiento).
enfermedad(colitis,calambres).
enfermedad(colitis,indigestion).

enfermedad(cordales,dientes).
enfermedad(cordales,cabeza).
enfermedad(cordales,sangrado).
enfermedad(cordales,migraña).
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

enfermedad(sarampión,sarpullido).
enfermedad(sarampión,tos).
enfermedad(sarampión,fiebre).
enfermedad(sarampión,calentura).
enfermedad(sarampión,escalofrios).
enfermedad(sarampión,todo).

pregunta(que).
pregunta(cuando).
pregunta(como).
pregunta(donde).
pregunta(cuanto).

%prevencion
prevencion(vertigo,no_salir_de_la_casa).
prevencion(vertigo,someterse_a_revisiones_auditivas_periodicas).
prevencion(vertigo,mantener_una_buena_postura_corporal).

prevencion(gripe,no_estar_cerca_de_la_suciedad).
prevencion(gripe,tener_todas_las_vacunas_al_dia).
prevencion(gripe,evitar_contacto_con_personas_con_gripe_o_fiebre).
prevencion(gripe,abrigarse_bien).

prevencion(colitis,mantener_una_dieta_balanceada).
prevencion(colitis,evitar_el_tabaco).
prevencion(colitis,controlar_el_estres).
prevencion(colitis,no_dejar_tratamientos_a_medias).

prevencion(cordales,no_tomar_cosas_calientes).

prevencion(dengue,evitar_recipientes_con_agua_acomulada).
prevencion(dengue,instalar_mosquiteros).
prevencion(dengue,utilizar_repelentes).

prevencion(zika,evitar_recipientes_con_agua_acumulada).
prevencion(zika,instalar_mosquiteros).
prevencion(zika,utilizar_repelentes).

prevencion(asma,evitar_el_polvo).
prevencion(asma,realizar_ejercicios_respiratoris_habituales).
prevencion(asma,cubrir_las_camas_con_fundas_antialergicas).
prevencion(asma,mantener_los_niveles_de_humedad_bajos).

prevencion(sarampion,evitar_contacto_con_personas_contagiadas).
prevencion(sarampion,mantener_vacunas_al_dia).

%recomendacion
recomendacion(vertigo,mantenerse_quieto).
recomendacion(vertigo,sentarse_o_acostarse_durante_los_sintomas).
recomendacion(vertigo,evitar_cambios_subitos_de_posicion).
recomendacion(vertigo,no_intentar_leer_durante_los_sintomas).
recomendacion(vertigo,evitar_las_luces_brillantes).

recomendacion(gripe,descansar).
recomendacion(gripe,beber_abundantes_liquidos).
recomendacion(gripe,evitar_el_consumo_de_tabaco_y_alcohol).
recomendacion(gripe,comer_frutas_y_verduras).

recomendacion(colitis,tomar_al_menos_8_vasos_de_liquido_al_dia).
recomendacion(colitis,masticar_bien).
recomendacion(colitis,mantener_horario_fijo_de_comidas).
recomendacion(colitis,realizar_ejercicio).

recomendacion(cordales,aplicar_hielo_en_la_parte_externa_de_la_cara).
recomendacion(cordales,evitar_el_consumo_de_tabaco).
recomendacion(cordales,evitar_tomar_aspirina).
recomendacion(cordales,mantener_una_correcta_higiene_bucal).

recomendacion(dengue,consultar_al_medico_a_la_brevedad).
recomendacion(dengue,evitar_automedicarse).
recomendacion(dengue,evitar_aspirinas).
recomendacion(dengue,beber_abundantes_liquidos).
recomendacion(dengue,no_utilizar_medicacion_inyectable).

recomendacion(zika,consultar_al_medico_a_la_brevedad).
recomendacion(zika,evitar_automedicarse).
recomendacion(zika,evitar_aspirinas).
recomendacion(zika,beber_abundantes_liquidos).
recomendacion(zika,no_utilizar_medicacion_inyectable).

recomendacion(asma,evitar_esfuerzos_intensos).
recomendacion(asma,seguir_el_tratamiento_recetado_por_su_especialista).
recomendacion(asma,reconoces_los_sintomas_de_Agudizacion_de_la_enfermedad).
recomendacion(asma,utilizar_el_inhalador_correctamente).

recomendacion(sarampion,descansar).
recomendacion(sarampion,beber_abundantes_liquidos).
recomendacion(sarampion,descansar_la_vista_de_luces_brillantes).
recomendacion(sarampion,evitar_ir_a_lugares_concurridos).

%causas
causa(gripe,virus_de_la_influenza).
causa(gripe,contacto_con_personas_infectadas).

causa(vertigo,infecciones_de_oido).
causa(vertigo,regulacion_anormal_de_la_presion_arterial).
causa(vertigo,trastornos_neurologicos).

causa(colitis,infecciones_causadas_por_virus_o_paracitos).
causa(colitis,intoxicacion_alimentaria).

causa(cordales,falta_de_espacio_en_la_boca).

causa(dengue,mosquitos).

causa(zika,mosquitos).

causa(asma,inflamacion_de_las_vias_respiratorias).

causa(sarampion,virus_del_sarampion).
causa(sarampion,contacto_con_personas_infectadas).

%tratamiento
tratamiento(gripe,analgesicos_habituales_como_paracetamol_e_ibuprofeno).

tratamiento(vertigo,diureticos).
tratamiento(vertigo,betahistina).

tratamiento(colitis,antiinflamatorios).
tratamiento(colitis,analgesicos).
tratamiento(colitis,suplementos_de_hierro).
tratamiento(colitis,cirugia).

tratamiento(cordales,extraccion).

tratamiento(dengue,liquidos_en_caso_de_deshidratacion).
tratamiento(dengue,paracetamol).
tratamiento(dengue,reposo).

tratamiento(zika,liquidos_en_caso_de_deshidratacion).
tratamiento(zika,paracetamol).
tratamiento(zika,reposo).

tratamiento(asma,corticoesteroides_inhalados).
tratamiento(asma,broncodilatadores).
tratamiento(asma,ipratropio).
tratamiento(asma,termoplastia_bronquial).

tratamiento(sarampion,antitermicos).
tratamiento(sarampion,antitusigenos).
tratamiento(sarampion,reposo).

pregunta_enfermedad1(X,Y,Z,Enfermedad):-
    sintoma(X),
    sintoma(Y),
    sintoma(Z),
    enfermedad(Enfermedad,X),
    enfermedad(Enfermedad,Y),
    enfermedad(Enfermedad,Z).
pregunta_enfermedad(Y,A,Z,S,E):-pregunta_enfermedadex(Y,A,Z,S,E).
pregunta_enfermedadex(X,Y,A,S,Enfermedad):-
    sintoma(X,Y),
    sintoma(Y,A),
    sintoma(A,S),
    enfermedad(Enfermedad,X),
    enfermedad(Enfermedad,Y),
    enfermedad(Enfermedad,A).


%Gramaticas libres de Contexto
%
%
primerElemento([X|_],X).
inicio(enfermedad,X):-atomic_list_concat(L,' ',X),oracion(L,[],enfermedad).
oracion(L,S,E):-sintaxis_nominal(L,X),sintaxis_verbal(X,S,E).
prueba:-read(X,Y,Z),pregunta_enfermedad(X,Y,Z,Enfermedad),write(Enfermedad).
