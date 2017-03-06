int scl = 100;
int w = 1920;
int h = 1080;
int len = 500;
void setup(){
  size(1920,1080);
  
}
void keyPressed(){
  if(key=='p'){
    saveFrame("bg_##.jpg");
  }
}
void draw(){
  translate(width/2,height/2);
 
  rotate(-TWO_PI/2);
  translate(-w/2,-h/2);
  background(255,255,255);
  for(int i = -500; i < width; i++){
    
    stroke(0,0,0,30);
    line(i*scl-len,0-len, i*scl+len,height+len);
  }
  
}