public class Estructura {
  int x, y, idx;
  float mueveX, mueveY, xp, yp, vx, vy;

  color elegido = colorAzar();

  Estructura(int xp_, int yp_, int idx_) {
    xp = xp_;
    yp = yp_;
    x = xp_;
    y = yp_;
    idx = idx_;

    mueveX = (int)(random(num)) * impacto + impacto/2.7;
    mueveY = (int)(random(num)) * impacto + impacto/1.5;
  }

  void mover() {
    vx += (mueveX-xp)/2000;
    vy += (mueveY-yp)/2000;

    vx *= random(0.820, 0.980);
    vy *= random(0.820, 0.980);
  }

  void procesar() {
    xp += vx;
    yp += vy;

    x = (int)xp;
    y = (int)yp;
  }
}

