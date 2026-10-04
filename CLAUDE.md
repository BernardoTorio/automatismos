# Automatismos Industriales — I.E.S. Trinidad Arroyo (Palencia)

Web de clase para alumnos de FP (unos 16 años, muchos con problemas de atención): apuntes y prácticas en PDF y animaciones HTML interactivas de los esquemas. Se publica con **GitHub Pages** desde la rama `main`, carpeta raíz:
**https://bernardotorio.github.io/automatismos/** (repositorio `BernardoTorio/automatismos`, carpeta local `C:\dev\automatismos`).

Los alumnos entran desde **códigos QR impresos en los apuntes**, que apuntan a `https://bernardotorio.github.io/automatismos/<archivo>.html`. Por eso:
- **Los nombres de archivo no se cambian nunca**: al corregir algo se sobrescribe el mismo archivo.
- **Las animaciones se quedan en la raíz** (no se mueven a subcarpetas, o los QR dejarían de funcionar).

## Estructura del repositorio
```
index.html                 portada con tres "carpetas": Temas, Prácticas, Animaciones
*.html                     una animación por archivo (en la raíz)
temas/                     apuntes en PDF
  T1_Esquemas_basicos_Automatismos.pdf
  T2_Dispositivos_basicos_Automatismos.pdf
  T3_Conexionado_basico_II_Automatismos.pdf
practicas/                 fichas de prácticas en PDF
  P1_Automatismos.pdf      Cableados iniciales
  P2_Automatismos.pdf      Cableados iniciales II
subir.bat                  publica todo con doble clic
.gitignore                 contiene *.zip (los zip no se suben nunca)
```
- Apuntes y prácticas se suben **solo en PDF** (nunca .docx). Para actualizar uno, se sustituye el PDF con el **mismo nombre**.
- El Tema 3 se llama **"Conexionado básico II"** (no "Conexionado complejo").

## index.html
- Arriba, tres carpetas que funcionan como pestañas: `#temas` (por defecto), `#practicas` y `#animaciones`. Las secciones tienen id `sec-temas`, `sec-practicas`, `sec-animaciones` para que el navegador no salte al abrir con `#…`.
- Temas y Prácticas: un recuadro por PDF con enlace `download`. Si el PDF todavía no está en el servidor, un `fetch HEAD` lo marca en gris como "próximamente".
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
- Detector fotoeléctrico: alimentación a 230 V (L, N) y salida por relé conmutado COM / NC / NA sin números (cables por colores según la leyenda del aparato).
- El mando del aula va a **230 V**.
- "Borne" = **tornillo** del aparato (así lo entienden mejor).

## Estilo de las animaciones
- Un único archivo `.html` autocontenido (CSS y JS dentro). Nombres en minúsculas, sin tildes ni espacios. Solo se permite Google Fonts (Atkinson Hyperlegible, con fuente de respaldo); nada más externo.
- Fondo claro, el esquema sobre "papel" blanco; responsive y con modo oscuro para la interfaz.
- **Disposición**: esquema a la izquierda y, a la derecha, una columna corta con el estado (leds, motor) y los botones. **Las explicaciones van en cajones debajo del dibujo**, no en una columna lateral alta: "Qué está pasando" (cambia en cada momento) y "Para qué sirve" (fijo).
- Arriba del todo, botón **"← Volver al índice"** que enlaza a `index.html#animaciones`; las teclas **Esc** y **Retroceso** hacen lo mismo. Obligatorio en todas.
- La **corriente** se muestra como una línea amarilla discontinua que se mueve, solo por los caminos cerrados hasta un consumo (respetar `prefers-reduced-motion`).
- Los aparatos se accionan **tocándolos en el esquema** y también con botones y teclado.
- Pulsadores: se mantienen pulsados mientras se aprieta; **doble clic** los deja **fijados** (recuadro y borde amarillos) y un clic más los suelta. Así se pueden tener varios pulsados a la vez con el ratón. Obligatorio en todas.
- Cuando tiene sentido, se puede **quitar un contacto** tocándolo (realimentación 13-14, enclavamiento 61-62, condición 53-54): queda en gris con una cruz roja y, si estaba en serie, se sustituye por un puente.
- Lenguaje sencillo y directo, en español; frases cortas.

## Cómo se publica
1. Los archivos nuevos llegan en un `automatismos.zip` (con las carpetas `temas/` y `practicas/` dentro). Se deja en Descargas o en esta misma carpeta.
2. Doble clic en `subir.bat`:
   - busca el `automatismos*.zip` más reciente (aquí o en Descargas, también `automatismos (1).zip`), enseña su contenido y lo descomprime;
   - saca el zip de la carpeta (a Descargas como `automatismos_subido_fecha.zip`);
   - `git pull`, `git add -A`, commit con fecha y `push`;
   - abre la web. Recargar con **Ctrl+F5** si se ve la versión vieja.
3. Si se trabaja con Claude Code en vez del .bat: probar la animación en el navegador (marcha, paro, doble clic, volver al índice), actualizar `index.html`, commit con mensaje claro y push a `main`. **No subir nunca zips ni .docx.**
