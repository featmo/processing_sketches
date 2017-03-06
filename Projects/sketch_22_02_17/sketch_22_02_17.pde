float centrY, centrX;
void setup(){
  size(640,480);
}
void draw(){
  rect(mouseX, mouseY, 15,15);
  if(keyPressed)
    clear();
}