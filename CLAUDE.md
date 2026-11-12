# Automatismos Industriales — I.E.S. Trinidad Arroyo (Palencia)

Web de clase para alumnos de FP (unos 16 años, muchos con problemas de atención): apuntes y prácticas en PDF y animaciones HTML interactivas de los esquemas. Se publica con **GitHub Pages** desde la rama `main`, carpeta raíz:
**https://bernardotorio.github.io/automatismos/** (repositorio `BernardoTorio/automatismos`, carpeta local `C:\dev\automatismos`).

Los alumnos entran desde **códigos QR impresos en los apuntes**, que apuntan a `https://bernardotorio.github.io/automatismos/<archivo>.html`. Por eso:
- **Los nombres de archivo no se cambian nunca**: al corregir algo se sobrescribe el mismo archivo.
- **Las animaciones se quedan en la raíz** (no se mueven a subcarpetas, o los QR dejarían de funcionar).

## Estructura del repositorio
```
index.html                 portada: «Ahora en clase», el curso tema a tema y las pestañas Apuntes, Prácticas, Ejercicios, Animaciones, Tests, Medidas
test_28oct.html            test examen 28 de octubre (T1-T4, P1 y P2; modos en orden, al azar y por temas; saltos de 1 en 1 y de 10 en 10)
test_28oct_II.html         test II examen 28 de octubre (100 preguntas nuevas, con peso en medidas y averías; mismo motor)
test_diciembre.html        test examen de diciembre (Práctica 3)
test_t5_t6.html            test Temas 5 y 6 (100 preguntas: dimensionar protecciones, temporizadores, cambio de sentido y pinza)
test_repaso.html           antiguo test: ahora redirige a index.html#tests
medidas.html               práctica de medidas: polímetro (V~, Ω) y pinza en 7 circuitos, ligada a las preguntas de medida del test
pinza.html                 cómo se usa la pinza amperimétrica (pestaña Medidas): arranque directo con 6 sitios para la pinza, selector A~/V~/Ω, motor normal, sobrecargado o sin una fase; vuelve a index.html#medidas
*.html                     una animación por archivo (en la raíz)
temas/                     apuntes en PDF
  T1_Esquemas_basicos_Automatismos.pdf
  T2_Dispositivos_basicos_Automatismos.pdf
  T3_Conexionado_basico_II_Automatismos.pdf   (+ R3 resumen, T4, T5 y T6)
ejercicios/                problemas en PDF (T6_Ejercicios_Dimensionamiento_protecciones.pdf)
practicas/                 fichas de prácticas en PDF
  P1_Automatismos.pdf      Cableados iniciales
  P2_Automatismos.pdf      Cableados iniciales II   (+ P3, P4, P5 y el examen práctico)
subir.bat                  publica todo con doble clic
.gitignore                 contiene *.zip (los zip no se suben nunca)
```
- Apuntes y prácticas se suben **solo en PDF** (nunca .docx). Para actualizar uno, se sustituye el PDF con el **mismo nombre**.
- El Tema 3 se llama **"Conexionado básico II"** (no "Conexionado complejo").

## index.html
- Arriba, el bloque **«Ahora en clase»** (apuntes, ejercicios y animaciones del tema que se está dando). Al pasar de tema solo se cambia un número: `var HOY = 6;`, al final del archivo. Los temas están en la lista `T` que va justo debajo.
- Después, una fila de pestañas: `#inicio` («Por temas», por defecto: el curso tema a tema, el último arriba), `#temas` (Apuntes), `#practicas`, `#ejercicios`, `#animaciones`, `#tests` y `#medidas`. Las secciones tienen id `sec-inicio`, `sec-temas`, `sec-practicas`, `sec-ejercicios`, `sec-animaciones`, `sec-tests`, `sec-medidas` para que el navegador no salte al abrir con `#…`. **Los nombres de las pestañas (`#…`) no se cambian**: las animaciones y los tests vuelven a ellas.
- En las demás páginas, la miga «Automatismos» lleva a `index.html` (la portada).
- **Marca «✓ vista»**: las animaciones que ya se han abierto en ese navegador salen marcadas (clave `visto:<archivo>` en `localStorage`). La pone la portada al tocar una tarjeta y, además, cada animación de los Temas 5 y 6 al abrirse (también desde un QR). No se marca en tests ni en medidas.
- Ejercicios: PDF de problemas y, debajo, las animaciones que ayudan a hacerlos (también salen en Animaciones). Esas animaciones vuelven a `index.html#ejercicios`.
- Temas y Prácticas: un recuadro por PDF con enlace `download`. Si el PDF todavía no está en el servidor, un `fetch HEAD` lo marca en gris como "próximamente".
- Las soluciones animadas de las prácticas aparecen en dos sitios: en Prácticas y en Animaciones (por partes: Tema 3, Práctica 1, 2 y 3).
- Tests: una tarjeta por test; el test vuelve a `index.html#tests`.

## Tests: mapa y test a medias
- A la izquierda, el mapa de preguntas con colores (verde, rojo, gris) y, a la derecha, «Cómo vas»; en el móvil, una barra abajo que abre el mapa.
- El test a medias **se guarda solo en ese navegador** (`localStorage`, clave `testProg:<archivo>`): al volver, la pantalla de inicio ofrece «Seguir donde lo dejé» o «Borrarlo». Se borra al terminarlo entero.

## Tests: letras en los puntos de medida
- En cada esquema sobre el que se mide, los tornillos que se usan van marcados con una **letra en una bolita amarilla** (A, B, C…), una serie por figura. No se usan I, L, N ni O (se confunden con 1, la fase, el neutro y el 0).
- En `DATA` los puntos se escriben con la letra en círculo (`Ⓐ`, `Ⓑ`…): el test (`pts()`) la pinta como la bolita del dibujo, y así no se confunde con las opciones A-B-C-D ni con `-F2`, `-H1`, `-KM1`.
- La pregunta lleva solo la letra («negra en N y roja en Ⓓ»); el **«¿Por qué?» empieza diciendo qué tornillo es** («Ⓓ es el 3 de -S1.»). `L` y `N` se siguen llamando así.
- La letra va a la izquierda del hilo con una guía hasta el tornillo; si no cabe, al lado del número. En la fuerza solo caben en los hilos de fuera (L1 y L3): las medidas entre fases se hacen entre esos dos.
- Las figuras van dentro de cada test (`IMGS`, en base64) y la misma figura se repite en varios tests: si se cambia una, se cambia en todos. «En orden» coincide con el test en papel (mismo número y mismo orden de respuestas).
- `medidas.html`: las tareas ligadas a una pregunta dicen el tornillo y, entre paréntesis, la letra del dibujo del test.
- Animaciones: una tarjeta por animación, **numerada con el apartado de los apuntes** (3.1, 3.2…) y en ese orden. Cada animación nueva se añade aquí con número, título y una línea de descripción.

## Animaciones actuales (Tema 3 · Conexionado básico II)
| Apdo. | Archivo | Qué muestra |
|---|---|---|
| 3.1 | `pulsadores_na.html` | 3 NA en paralelo (→ KM1) y 3 NA en serie (→ KM2) |
| 3.2 | `pulsadores_nc.html` | 3 NC en serie (→ KM1) y 3 NC en paralelo (→ KM2) |
| 3.3 | `realimentacion.html` | Marcha-paro con prioridad al paro, pilotos H1/H2, quitar el 13-14 |
| 3.3 | `realimentacion_marcha.html` | Realimentación con prioridad a la marcha (paro solo en la rama del 13-14) |
| 3.4 | `combinaciones.html` | Paros S1‖S2 en serie con S3; marchas (S4+S5 en serie) ‖ S6 ‖ 13-14 |
| 3.5 | `condicionada.html` | Activación condicionada: 53-54 de KM1 en serie con la bobina de KM2 |
| 3.6 | `enclavamiento.html` | Enclavamiento con los 61-62; sin él → cortocircuito |
| 3.7 | `rele_auxiliar.html` | KA1 con 3 conmutados (11-12-14, 21-22-24, 31-32-34) maneja KM1, H1, H2 |
| 3.8 | `rele_base.html` | Base (1-14), pegatina de dos fabricantes y esquema; modos Explorar / Polímetro / Reto |
| 3.9 | `arranque_motor.html` | Arranque directo: fuerza + mando, térmico con sobrecarga y RESET |
| 3.10 | `inversion_giro.html` | Inversión de giro: fuerza (KM2 cruza L1-L3) + mando con enclavamiento y F2 |

## Animaciones del Tema 5 · Temporizadores y cambio de sentido
| Apdo. | Archivo | Qué muestra |
|---|---|---|
| 5.2 | `cronograma_temporizadores.html` | Un pulsador da tensión a la vez a -KT1 (a la conexión) y -KT2 (a la desconexión): cronograma en directo con los 67-68 y los 55-56; pulsos cortos, cámara lenta y congelar |
| 5.5 | `usos_temporizadores.html` | Para qué se usa un temporizador: los cuatro usos de la Práctica 4 (1 se para solo: conexión + 55-56 en serie; 2 arranca más tarde: -KT1 realimentado con su 13-14 y su 67-68 alimenta -KM1; 3 sigue un rato más: desconexión + 67-68; 4 hay que mantener pulsado: -KT1 detrás del NA de la marcha y su 67-68 en paralelo con el 13-14 de -KM1). Se abre en un caso con `#1`…`#4` |

- Vuelven a `index.html#animaciones` y llevan la tira del tema (`.t6nav`, «Tema 5 · n de 2») y el botón grande «Siguiente»; se marcan como vistas al abrirse. Si se añade otra animación del tema, hay que actualizar la tira en todas.
- `usos_temporizadores.html` sale en dos sitios de la portada: en Animaciones (Tema 5) y en Prácticas (grupo «Práctica 4 · antes de empezar»).
- En 5.5 cada caso lleva tres columnas, de izquierda a derecha: **la parte del mando que hace falta** (sin -Q2, sin 95-96, sin fuerza y sin pilotos), **el cronograma** (al abrir, uno de ejemplo ya dibujado; «Ver cómo funciona» lo repite paso a paso y al tocar un pulsador se dibuja en directo) y **«Para qué sirve»**. Aquí «Para qué sirve» va a la derecha y no debajo porque así se pidió; «Qué está pasando» sigue debajo.
- Los cronogramas de 5.5 llevan **pocas filas**: con muchas, lían. El del caso 1 solo tiene la marcha -S2, la bobina de -KT1 (con la flecha T) y -KM1; **sin -S1 y sin el 55-56**. Las filas de cada caso están en `rows` (y `ivRow` dice en cuál va la flecha del tiempo).
- 5.5 **no da las soluciones de la Práctica 4**: solo las piezas. No lleva los cronogramas de la 4.5 ni de la 4.8 (son los que se entregan); de esos dos ejercicios solo dice, con las palabras de la pista del enunciado, qué casos se juntan.
- Temporizador del aula: contactor con bloque temporizado delante; -KT1 tiene A1-A2, su 13-14 y los temporizados **55-56 (NC)** y **67-68 (NA)**. Paraguas `(` a la conexión y `)` a la desconexión; bobina con cuadro aspado (conexión) o relleno (desconexión).

## Animaciones del Tema 6 · Dimensionamiento de protecciones (carpeta Ejercicios)
| Apdo. | Archivo | Qué muestra |
|---|---|---|
| 6.4 | `intensidad_calor.html` | Motor de 11 kW: intensidad y calor del cable según tensión (230/400/690 V) y sección; pico de arranque a cámara lenta; sobrecarga |
| 6.5 | `regla_ib_in_iz.html` | Regla IB ≤ In ≤ Iz: motores de placa y corrientes del ejercicio 2; subir/bajar calibre y sección; tabla del calibre máximo de cada cable; reto (vale cualquier calibre que quede entre IB e Iz, motor bloqueado) |
| 6.6 | `curvas_disparo.html` | Curvas B/C/D en veces y en amperios según el calibre (al cambiar el calibre los amperios no cambian); zona, tiempos de la tabla (columna siguiente) y comprobación de arranque; para qué se usa cada curva |
| 6.7 | `arranque_curvas.html` | Varias curvas (B/C/D) a la vez y hasta 4 motores de placa con pico y duración: escalón de arranque y tabla de si arranca con cada curva |
| 6.8 | `proteger_motor.html` | Cuatro motores (3, 7,5, 11 y 22 kW): magnetotérmico + térmico / 3 fusibles aM o gG + térmico / guardamotor, con el rango que contiene la corriente; arranque, eje duro (sobrecarga, pinza en las tres fases), cortocircuito; ruleta alta → salta tarde o se quema, baja → salta en el funcionamiento normal del motor |
| 6.11 | `cuadro_motores.html` | Hasta 4 motores con su placa (se elige qué caja se lee, Y o Δ); receta de los 6 pasos del motor elegido; líneas y general calculadas; pinzas L1-L2-L3; falta de fase; cortocircuito con y sin selectividad |

### Reglas propias de las animaciones del Tema 6
- Vuelven a `index.html#ejercicios` (botón, Esc y Retroceso; Retroceso no actúa con el foco en un desplegable).
- Bajo la barra de arriba, la tira `.t6nav`: «‹ anterior · Tema 6 · n de 6 · siguiente ›» y los seis pasos (6.4 … 6.11). Al final de la página, botón grande «Siguiente». Si se añade o se quita una animación del tema, hay que actualizar la tira en las seis.
- Bajo el título, «Te sirve para los ejercicios …».
- Debajo de «Qué está pasando», un cajón fijo **«Para qué sirve»** (dos o tres frases). En la tira del tema, las animaciones ya abiertas llevan un ✓.
- Móvil (dibujo de menos de 620 px): cada una tiene un **dibujo estrecho propio** con texto de 10 px reales o más; el dibujo va fijo arriba (`.stick`) y lleva debajo una línea de veredicto (`#verd`).
- Mismas listas en todas: 13 calibres (6 a 160 A), cables hasta 70 mm², los once motores de placa. Nombres `-M1`, `-Q1`, `-F1`.
- Redacción: «salta en el funcionamiento normal del motor» (nunca «sin avería»); «Eje duro (sobrecarga)», un 18 % más.
- Las tres zonas de la curva se llaman siempre **«Zona térmica», «Zona dudosa» y «Zona magnética»** (no «salta seguro» ni «dudosa» a secas). En 6.6 van en una tira de colores encima de la gráfica, en dos líneas cuando no caben en una.
- Orden para dimensionar (apuntes, ejercicios, tests y animaciones): **corriente → cable → protección**. Primero el cable más fino que aguante IB; después vale **cualquier calibre** que quede entre IB e Iz (todos igual de buenos: el magnetotérmico protege el cable, no el motor); si no cabe ninguno, se sube la sección. Nunca «el primer calibre» ni «la solución más ajustada».
- Modelo de clase acordado (no «corregir» hacia la norma): en la zona dudosa no se dan tiempos (puede saltar al instante); con menos de 2 veces «tarda mucho: de 20 s a 1 hora»; «caja equivocada» es caja mal leída (el motor pide su corriente real y la línea queda mal dimensionada); la general no salta por debajo de 1,13 veces; el térmico salta si el motor pide más que la ruleta (2 % de margen); arranque de 6 veces y 0,4 s en 6.11.
- Solo se redibuja cuando cambia algo y se respeta `prefers-reduced-motion`.

## Criterios de dibujo de los esquemas (obligatorios)
- **Colores**: conductor de fase **rojo**, neutro **azul**; símbolos, nombres y números en **negro**. (Son colores de dibujo, no los de los cables reales.)
- **Nombres** de los aparatos siempre **a la izquierda** del símbolo (`-KM1`, `-S1`…), a la altura de su centro.
- **Números de bornes** pegados al símbolo y **a la derecha del hilo** (el impar arriba, el par abajo).
- Símbolos **sobre el cable, centrados y sin girar**; el hilo entra y sale por los extremos del símbolo.
- Todo se dibuja **en reposo**. Fuerza a la izquierda, mando a la derecha. En mando: L arriba, N abajo.
- Orden en el mando, de arriba abajo: protecciones (magnetotérmico, 95-96 del térmico) → paros (NC) → marchas y contactos → bobinas y pilotos.
- **Consumos** (bobinas, pilotos, motores) abajo del todo y **todos a la misma altura**; nada entre A2/X2 y el N.
- El **magnetotérmico** se dibuja completo (contacto, disparo térmico y magnético, mando manual).
- El **accionamiento** de los pulsadores (y el bimetal del térmico) va siempre **a la izquierda** del contacto, y su **línea discontinua llega a la mitad de la lámina** del contacto, no al tornillo.
- Uniones con punto; evitar cruces (si no hay más remedio, cruce sin punto).
- Paros siempre **NC en serie**; marchas **NA en paralelo**, con el 13-14 en paralelo con ellas.

## Letras de los aparatos
Q magnetotérmico/diferencial · F fusible y relé térmico · S pulsadores y detector fotoeléctrico · FC final de carrera · KM contactor · KA relé auxiliar · H piloto · M motor · T transformador.

## Material real del aula
- Pulsadores: bloque extraíble con **NC 1-2** y **NA 3-4**.
- Contactores: principales 1-2, 3-4, 5-6 + auxiliar **13-14 (NA)**, **sin 21-22**; bloque frontal de 4 contactos **53-54 NA, 61-62 NC, 71-72 NC, 83-84 NA**.
- Relés auxiliares: enchufables en base, conmutados de 3 tornillos por contacto, **común arriba** en el símbolo (11 arriba; 12 NC y 14 NA abajo; 21 / 22-24 el segundo…). De 2, 3 y 4 contactos (8, 11 y 14 tornillos). La base usa además numeración **1-14**: NC = n, NA = n+4, común = n+8, bobina 13 (A1) y 14 (A2). El de 2 contactos usa las posiciones 1.ª y 4.ª; el de 3, las tres primeras (pendiente de confirmar con la pegatina real).
- Relé térmico: 95-96 NC y 97-98 NA.
- Finales de carrera: **NC 1-2** y **NA 3-4** (como los pulsadores).
- Detector fotoeléctrico: alimentación a 230 V (L, N) y salida por relé conmutado COM / NC / NA sin números (cables por colores según la leyenda del aparato).
- El mando del aula va a **230 V**.
- "Borne" = **tornillo** del aparato (así lo entienden mejor).

## Estilo de las animaciones
- Un único archivo `.html` autocontenido (CSS y JS dentro). Nombres en minúsculas, sin tildes ni espacios. Solo se permite Google Fonts (Atkinson Hyperlegible, con fuente de respaldo); nada más externo.
- Fondo claro, el esquema sobre "papel" blanco; responsive y con modo oscuro para la interfaz.
- **Disposición**: esquema a la izquierda y, a la derecha, una columna corta con el estado (leds, motor) y los botones. **Las explicaciones van en cajones debajo del dibujo**, no en una columna lateral alta: "Qué está pasando" (cambia en cada momento) y "Para qué sirve" (fijo).
- Arriba del todo, botón **"← Volver al índice"** que enlaza a `index.html#animaciones`; las teclas **Esc** y **Retroceso** hacen lo mismo. Obligatorio en todas.
- La **corriente** se muestra de forma **sutil**: puntos pequeños y claros que se mueven por dentro del cable (`.flow`: `stroke:#FFE28A; stroke-width:3; stroke-linecap:round; stroke-dasharray:0.5 17.5`, a 0,9 s por ciclo), solo por los caminos cerrados hasta un consumo y **sin huecos** desde L hasta N (un tramo por cada trozo de cable, encendido solo si por él pasa corriente). Nada de la línea amarilla gruesa a trazos. Vale para todos los esquemas de mando, los hechos y los que se hagan. Respetar `prefers-reduced-motion`.
- Los aparatos se accionan **tocándolos en el esquema** y también con botones y teclado.
- Pulsadores: se mantienen pulsados mientras se aprieta; **doble clic** los deja **fijados** (recuadro y borde amarillos) y un clic más los suelta. Así se pueden tener varios pulsados a la vez con el ratón. Obligatorio en todas.
- Cuando tiene sentido, se puede **quitar un contacto** tocándolo (realimentación 13-14, enclavamiento 61-62, condición 53-54): queda en gris con una cruz roja y, si estaba en serie, se sustituye por un puente.
- Lenguaje sencillo y directo, en español; frases cortas.

## Los Word originales: `C:\dev\originales`
Los PDF de esta web salen de un Word. Los Word no se suben a GitHub, pero **no se pierden**: están en `C:\dev\originales` (en el PC del profesor, fuera de git), con todas sus versiones. Es la misma carpeta para las tres webs (automatismos, domotica, maquinas).
```
C:\dev\originales\
  automatismos\  domotica\  maquinas\
    temas\  practicas\  ejercicios\  tests\  examenes\  programacion\  otros\
      T6_Dimensionamiento_protecciones.docx                       ← la última versión
      versiones\T6_Dimensionamiento_protecciones__2026-11-02_2055.docx      ← todas, con fecha y hora
  _sin_clasificar\   _registro\ (índice, log, pdf_sin_word.txt)   reglas.csv   LEEME.txt
```
- **El Word se llama igual que el PDF que se publica** (`temas\T6_Dimensionamiento_protecciones.docx` → `temas/T6_Dimensionamiento_protecciones.pdf`) y lleva la asignatura en el nombre (`…_Automatismos`, `2MT-…`, `…_Maquinas_2MB`), para que se coloque solo.
- **Para cambiar un PDF publicado se parte de su Word de `C:\dev\originales`** (la última versión o, si hace falta, una de `versiones\`). Nunca se rehace un Word a partir del PDF sin mirar antes ahí; si no está (lo dice `_registro\pdf_sin_word.txt`), se avisa al profesor antes de reconstruirlo.
- **Todo Word nuevo o cambiado se guarda en su sitio de `C:\dev\originales`** en cuanto está hecho. Antes de escribir encima de la última versión, si en `versiones\` no está ya `nombre__AAAA-MM-DD_HHMM.docx` con la fecha de esa última, se copia allí con ese nombre. Si la sesión no tiene la carpeta, se pide acceso; si no se puede, el Word se deja en esta carpeta o en «Claude outputs» y la tarea de la noche lo recoge. Si un Word se llama distinto que su PDF, se añade su línea en `C:\dev\originales\reglas.csv`.
- Una tarea de Windows («Archivo de Word de clase», cada día a las 23:00 o al encender) guarda en `versiones\` los Word nuevos o cambiados de las tres webs (también «Claude outputs»), de Descargas y del propio archivo, y pone arriba la última. No mueve ni borra nada. Para que pase ya: `C:\dev\originales\archivar_ahora.bat`.

## Cómo se publica
1. Los archivos nuevos llegan en un `automatismos.zip` (con las carpetas `temas/` y `practicas/` dentro). Se deja en Descargas o en esta misma carpeta.
2. Doble clic en `subir.bat`:
   - busca el `automatismos*.zip` más reciente (aquí o en Descargas, también `automatismos (1).zip`), enseña su contenido y lo descomprime;
   - saca el zip de la carpeta (a Descargas como `automatismos_subido_fecha.zip`);
   - `git pull`, `git add -A`, commit con fecha y `push`;
   - abre la web. Recargar con **Ctrl+F5** si se ve la versión vieja.
3. Si se trabaja con Claude Code en vez del .bat: probar la animación en el navegador (marcha, paro, doble clic, volver al índice), actualizar `index.html`, commit con mensaje claro y push a `main`. **No subir nunca zips ni .docx.**
