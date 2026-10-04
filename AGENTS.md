# Animaciones de Automatismos Industriales — I.E.S. Trinidad Arroyo (Palencia)

Repositorio de animaciones HTML interactivas para alumnos de FP (unos 16 años, muchos con problemas de atención). Se publica con GitHub Pages desde la rama `main`, carpeta raíz. Los alumnos entran desde códigos QR impresos en los apuntes, así que **los nombres de archivo no se cambian nunca**: al corregir una animación se sobrescribe el mismo archivo.

## Estructura
- `index.html`: portada con una tarjeta por animación. Cada animación nueva se añade aquí (número, título y una línea de descripción).
- Una animación = un único archivo `.html` autocontenido (CSS y JS dentro). Nombres en minúsculas, sin tildes ni espacios (`inversor_giro.html`).
- Solo se permiten recursos externos de Google Fonts (Atkinson Hyperlegible, con fuente de respaldo). Nada más externo.

## Criterios de dibujo de los esquemas (obligatorios)
- **Colores**: conductor de fase **rojo**, neutro **azul**; símbolos, nombres y números en **negro**.
- **Nombres** de los aparatos siempre **a la izquierda** del símbolo (`-KM1`, `-S1`…), a la altura de su centro.
- **Números de bornes** pegados al símbolo y **a la derecha del hilo** (el impar arriba, el par abajo).
- Símbolos **sobre el cable, centrados y sin girar**; el hilo entra y sale por los extremos del símbolo.
- Todo se dibuja **en reposo**. Fuerza a la izquierda, mando a la derecha. En mando: L arriba, N abajo.
- Orden en el mando, de arriba abajo: protecciones → paro (NC) → marcha y contactos → bobinas y pilotos.
- **Consumos** (bombillas, bobinas, motores) abajo del todo y **todos a la misma altura**; nada entre A2/X2 y el N.
- El **magnetotérmico** se dibuja completo (contacto, disparo térmico y magnético, mando manual).
- El **accionamiento de los pulsadores** va siempre a la izquierda del contacto.
- Uniones con punto; evitar cruces.

## Letras de los aparatos
Q magnetotérmico/diferencial · F fusible y relé térmico · S pulsadores y detector fotoeléctrico · FC final de carrera · KM contactor · KA relé auxiliar · H piloto · M motor.

## Material real del aula
- Pulsadores: bloque extraíble con **NC 1-2** y **NA 3-4**.
- Contactores: principales 1-2, 3-4, 5-6 + auxiliar **13-14 (NA)**, **sin 21-22**; bloque frontal de 4 contactos **53-54 NA, 61-62 NC, 71-72 NC, 83-84 NA**.
- Relés auxiliares: conmutados de 3 tornillos por contacto, **común arriba** en el símbolo (11 arriba; 12 NC y 14 NA abajo; 21 / 22-24 el segundo).
- Relé térmico: 95-96 NC y 97-98 NA.
- Detector fotoeléctrico: alimentación a 230 V (L, N) y salida por relé conmutado COM / NC / NA sin números (cables por colores según la leyenda del aparato).
- "Borne" = **tornillo** del aparato (así lo entienden mejor).

## Estilo de las animaciones
- Fondo claro, el esquema sobre "papel" blanco; responsive y con modo oscuro para la interfaz.
- La **corriente** se muestra como una línea amarilla discontinua que se mueve (respetar `prefers-reduced-motion`).
- Los aparatos se accionan **tocándolos en el esquema** (pulsadores: mantener pulsado) y también con botones y teclado.
- Un panel de texto explica en frases cortas qué está pasando en cada momento.
- Lenguaje sencillo y directo, en español.

## Antes de subir
Abrir el archivo en el navegador y probar marcha, paro y el resto de acciones. Luego actualizar `index.html`, hacer commit con un mensaje claro y push a `main`.
