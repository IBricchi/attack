class blood{
  float ox;
  float oy;
  float l;
  blood(){
    l = 15;
    ox = mouseX;
    oy = mouseY;
  }
  void update(){
    fill(0,255,255);
    triangle(ox,oy,ox+cos(PI/6)*l*6/4,oy+sin(PI/6)*l*6/4,ox+cos(2*PI/6)*l*6/4,oy+sin(2*PI/6)*l*6/4);
    triangle(ox,oy,ox+cos(4*PI/6)*l*6/4,oy+sin(4*PI/6)*l*6/4,ox+cos(5*PI/6)*l*6/4,oy+sin(5*PI/6)*l*6/4);
    triangle(ox,oy,ox+cos(7*PI/6)*l*6/4,oy+sin(7*PI/6)*l*6/4,ox+cos(8*PI/6)*l*6/4,oy+sin(8*PI/6)*l*6/4);
    triangle(ox,oy,ox+cos(10*PI/6)*l*6/4,oy+sin(10*PI/6)*l*6/4,ox+cos(11*PI/6)*l*6/4,oy+sin(11*PI/6)*l*6/4);
    l--;
  }
}