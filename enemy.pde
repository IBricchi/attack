class enemy{
  float x;
  float y;
  
  float f = 0;
  float h = height/14;
  float w = h/2;
  
  PShape santa = loadShape("santa2.svg");
  
  enemy(){
    x = random(w,width-w);
    y = height-3*h;
  }
  
  void update(){
    w += height/400;
    h += height/244;
    x -= height/400;
    y -= 1;
    shape(santa,x-w/2,y,w,h);
    f++;
  }
}