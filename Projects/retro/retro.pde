int hypRad = 500;
int hypRad1 = 100;
int hypRad2 = 90;
float angle = 0; 
int aftImg = 200;
PFont font;
String text;
void setup(){
  size(19220,1080);
  font = createFont("Titania.ttf",40);
  text = "vnder";
  smooth(8);
}
void keyPressed(){
  if(key == 'p'){
    saveFrame("vnder_img_##.png");
  }
}
void draw(){
  background(40,40,40);
  translate(width/2,height/2);
  
   for(int i = 0; i < aftImg/2; i++){
     noStroke();
     ellipseMode(CENTER);
     fill(200,200,255,10);
     ellipse(circX(angle-i),circY(angle-i),5,5);
  }
  for(int i = 0; i < aftImg; i++){
     stroke(255,50,100,50);
     line(0,0,xpos(angle-i),ypos(angle-i));
     //line(0,0, xpos(angle-i),ypos(angle-i));
     noStroke();
     ellipseMode(CENTER);
     fill(255,200,255,30);
     ellipse(xpos(angle-i),ypos(angle-i),5,5);
    
  }
  
  fill(220,50,100);
  rectMode(CENTER);
  rect(0,155,93,2);
  angle+=40;
  fill(255);
  textAlign(CENTER);
  textFont(font);
  text(text,0,150);
}
float ypos(float angle){
  return sin(angle/15)*hypRad2;
}
float xpos(float angle){
  return cos(angle/5)*hypRad2;
}

float circX(float angle){
  return cos(angle/5)*hypRad1;
}
float circY(float angle){
  return sin(angle/15)*hypRad1;
}
float circX1(float angle){
  return cos(angle/5)*hypRad;
}
float circY1(float angle){
  return sin(angle/15)*hypRad;
}