public void keyPressed() {
  save(carpeta+"/captura.jpg");
}

public void mousePressed() {
  setup();
}

public void elegirColor(String fn) {
  PImage paleta;
  paleta = loadImage(fn);
  image(paleta, 0, 0);

  for (int x=0; x < paleta.width; x++) {
    for (int y=0; y < paleta.height; y++) {
      color c = get(x, y);
      boolean existe = false;
      for (int i = 0; i < colorPal; i++) {
        if (c == elColor[i]) {
          existe = true;
          break;
        }
      }
      if (!existe) {
        if (colorPal < 512) {
          elColor[colorPal] = c;
          colorPal++;
        } 
        else {
          break;
        }
      }
    }
  }

  for (int i=0; i < 6; i++) {
    elColor[colorPal] = #FFFFFF;
    colorPal += 2;
  }

  for (int i=0; i < 12; i++) {
    elColor[colorPal] = #000000;
    colorPal++;
  }
}

public color colorAzar() {
  return elColor[(int)random(colorPal)];
}

public float Estructura_dis(int a, int b) {
  if (a != b) {
    float _dx = cuadrados[b].x-cuadrados[a].x;
    float _dy = cuadrados[b].y-cuadrados[a].y;
    float _d = sqrt(_dx*_dx+_dy*_dy);
    return _d;
  } 
  else {
    return 0.0;
  }
}

