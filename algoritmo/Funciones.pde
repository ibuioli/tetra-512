public void mousePressed() {
  setup();
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

