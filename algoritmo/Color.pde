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
}

public color colorAzar() {
  return elColor[(int)random(colorPal)];
}
