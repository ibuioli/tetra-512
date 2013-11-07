/**********************************/
/*Proyecto Anual                  */
/*Proyecto Visual 3               */
/*Buioli Ignacio                  */
/*Año 2013                        */
/*Processing: 2.0+                */
/**********************************/

//Configuración Global
int d = 700;
int a, b;
int num = 13;
int maxnum = (int)(pow(num, 2))+1;
int cantlineas = 400;
float dx, dy, impacto, t, angulo;
int r;

//Configuración de Color
int resoEnBits = 128;
int colorPal = 0;
color[] elColor = new color[512];

Estructura[] cuadrados;

void setup() {
  size(displayWidth, displayHeight, P3D);  //Modo 3D otorga mejor rendimiento y calidad de Píxel
  
  frameCount = 0;
  
  num = (int)random(7, 12);
  maxnum = (int)(pow(num, 2))+1;
  cantlineas = (int)random(2000, 4000);
  
  elegirColor("paleta-A.gif");

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
  
  int ran = (int)random(0, 4);
  
  if(ran > 0 && ran < 2){
    angulo = HALF_PI;
  }else{
    angulo = QUARTER_PI;
  }
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

        t = random(angulo);

        /*Variante 1*/
        dx = sin(t*2)*(cuadrados[b].x-cuadrados[a].x)+cuadrados[a].x;
        dy = sin(t/2)*(cuadrados[b].y-cuadrados[a].y)+cuadrados[a].y;

        if (random(1000)>d+100) {
          dx += random(-2.6, 8.5);
          dy += random(-8.5, 0.5);
        }

        pushMatrix();
        translate(width/2-350, height/2-350);
        stroke(red(cuadrados[b].elegido), green(cuadrados[b].elegido), blue(cuadrados[b].elegido), random(40, 80));
        strokeWeight(random(0.9));
        point(dx, dy);

        popMatrix();

        i++;
      }
    }
  }

  for (int i=0; i < (num*num); i++) {
    cuadrados[i].mover();
    cuadrados[i].procesar();
  }

  if (frameCount > 1500) {
    setup();
  }
}

