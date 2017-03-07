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