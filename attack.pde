//import peasy.*;
//PeasyCam cam;

PImage backImg;
//PFont font;

ArrayList<enemy> en;
ArrayList<blood> bl;

String[] scores = new String[1];

float freq = 15;
int score = 0;

boolean pause = false;

String highScore;
String scoreStr;

void setup(){
  size(800,600,P2D);
  //fullScreen(P2D);
  frameRate(15);
  colorMode(HSB);
  //cam = new PeasyCam(this, 500);
  
  backImg = loadImage("back.jpg");
  backImg.resize(width,height);
  
  //font = loadFont("helvetica-32.vlw");
  //textFont(font, 32);
  
  en = new ArrayList<enemy>();
  en.add(new enemy());
  en.add(new enemy());
  
  bl = new ArrayList<blood>();
}

void draw(){
  background(backImg);
  if(pause){
    noStroke();
    fill(0,0,0,100);
    rect(0,0,width,height);
    fill(0,0,0,200);
    rect(width/2-50,height/2-50,100,100);
    fill(255,255,255,200);
    triangle(width/2-35,height/2-40,width/2-35,height/2+40,width/2+35,height/2);
    highScore = "Best: " + loadStrings("high.txt")[0];
    text(highScore,width/2-150,100);
    textSize(40);
    stroke(0,0,255);
  }else if(!pause){
    sizeCheckEnemy();
    sizeChackBlood();
    scoreStr = "score : " + score;
    textSize(18);
    stroke(0,0,255);
    text(scoreStr, 30, 30);
    for(int i = en.size()-1; i > 1; i--){
      en.get(i).update();
    }
    for(int i = 0; i < bl.size(); i++){
      bl.get(i).update();
    }
    if(frameCount%int(freq) == 0){
      en.add(new enemy());
    }
  }
}

void mousePressed(){
  if(pause){
    pause = false;
  }else if(!pause){
    clickCheck();
  }
}
/*
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

void clickCheck(){
  for(int i = 1; i < en.size(); i++){
    if(mouseX > en.get(i).x && mouseX < en.get(i).x + en.get(i).w){
      en.remove(i);
      freq /= 1.1;
      if(freq < 7){
        freq = 7;
      }
      bl.add(new blood());
      score++;
      i = en.size();
    }
  }
}

void sizeCheckEnemy(){
 for(int i = 1; i < en.size(); i++){
   if(en.get(i).h >= height/3){
     saveHigh();
     score = 0;
     pause = true;
     en.clear();
   }
 }
}

void sizeChackBlood(){
  for(int i = 0; i < bl.size(); i++){
    if(bl.get(i).l < 2){
      bl.remove(i);
    }
  }
}

void saveHigh(){
  if(parseInt(loadStrings("high.txt")[0]) < score){
    scores[0] = str(score);
    saveStrings("high.txt", scores);
  }
}
*/