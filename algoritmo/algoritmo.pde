/**********************************/
/*Gen. Algorítmica de Imágenes    */
/*Proyecto Visual 3               */
/*Buioli Ignacio                  */
/*Año 2013                        */
/*Processing: 2.0+                */
/**********************************/

//Configuración Global
int d = 700;
int a, b;
int num = 7;
int maxnum = (int)(pow(num, 2))+1;
int cantlineas = 3000;
int carpeta;
float dx, dy, impacto, t;

//Configuración de Color
int resoEnBits = 128;
int colorPal = 0;
color[] elColor = new color[512];

Estructura[] cuadrados;

void setup() {
  size(800, 800, P3D);  //Modo 3D otorga mejor rendimiento y calidad de Píxel
  
  //elegirColor("paleta-A.gif");  //Paleta A
  //elegirColor("paleta-B.gif");  //Paleta B
  //elegirColor("paleta-C.gif");  //Paleta C
  elegirColor("paleta-D.gif");  //Paleta D

  noCursor();
  background(0);

  /////////////////////////////////////////
  cuadrados = new Estructura[maxnum];

  impacto = d/num;

  int i=0;
  for (int x=0;x<num;x++) {
    for (int y=0;y<num;y++) {
      cuadrados[i] = new Estructura((int)(x*impacto+impacto/2), (int)(y*impacto+impacto/2), i);
      i++;
    }
  }
  //////////////////////////////////////////
  
  carpeta = (int)random(800);
}

void draw() {
  for (int i=0; i < cantlineas;) {
    a = int(floor(random((pow(num, 2)))));
    b = int(floor(random((pow(num, 2)))));

    if ((a >= num*num) || (b >= num*num)) {
      //Dejar de Dibujar
    } 
    else if (a != b) {
      if (Estructura_dis(a, b) < resoEnBits) {

        t = random(HALF_PI);  //Variación con Medio PI
        //t = random(QUARTER_PI);  //Variación con un Cuarto de PI

        /*Variante 1*/
        dx = sin(t*2)*(cuadrados[b].x-cuadrados[a].x)+cuadrados[a].x;
        dy = sin(t/2)*(cuadrados[b].y-cuadrados[a].y)+cuadrados[a].y;

        /*Variante 2*/
        //dx = sin(t*2)*(cuadrados[a].x-cuadrados[a].x)+cuadrados[a].x;
        //dy = sin(t/2)*(cuadrados[a].y-cuadrados[a].y)+cuadrados[a].y;

        if (random(1000)>d+100) {
          dx += random(-2.6, 8.5);
          dy += random(-8.5, 0.5);
        }

        pushMatrix();
        if (width == 400) {
          translate(25, 25);
          scale(0.5);
        }
        else if (width == 800) {
          translate(50, 50);
          scale(1);
        }
        else if (width == 1600) {
          translate(100, 100);
          scale(2);    //Mejor Tamaño
        }
        stroke(red(cuadrados[b].elegido), green(cuadrados[b].elegido), blue(cuadrados[b].elegido), random(40, 80));

        strokeWeight(random(0.8));
        point(dx, dy);//Variacion Puntos

        /*strokeWeight(random(0.3));
         line(dx, dy, dx+random(-5, 5), dy+random(-5, 5));//Variación Lineas*/

        popMatrix();

        i++;
      }
    }
  }

  for (int i=0; i < (num*num); i++) {
    cuadrados[i].mover();
    cuadrados[i].procesar();
  }
}

