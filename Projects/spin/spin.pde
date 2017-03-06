float x,y,a;
float r,g,b,alp;
float t, t1;
PFont font;
String s;
void setup(){
  size(400,600);
  background(0);
  a = 0;
  r = 255; 
  g = 100;
  b = 100;
  alp = 0;
  t = 0;
  t = 0;
  font = createFont("Titania.ttf",40);
  s = "Vnder";
}
void draw(){
  background(0);
  translate(width/2,height/2);
  stroke(255,g,b);
  point(x(t),y(t));
  point(x1(t),y1(t));
  
 
  for(int i = 0;i < 30;i++){
    stroke(255,g,b,alp);
    //line(x1(t+i),y1(t+i),x(t+i),y(t+i));
    //rotate(PI/5);
    line(x1(t+i),y1(t+i),x(t+i)-100,y(t+i)-100);
    noStroke();
    //ellipseMode(CENTER);
    fill(200,50,b,200);
    //ellipse(x1(t+i),y1(t+i),2,2);
  }
   for(int i = 0;i < 70;i++){
    stroke(255,g,b,alp);
    //line(x1(t+i),y1(t+i),x(t+i),y(t+i));
    //rotate(PI/5);
    line(x1(t+i),y1(t+i),x(t+i),y(t+i));
    noStroke();
    ellipseMode(CENTER);
    fill(255,50,b,alp);
    ellipse(x1(t+i),y1(t+i),2,2);
  }
  while(alp < 100){
    alp+=2;
  }
  t++;
  t1++;
  
  fill(255);
  textAlign(CENTER);
  textFont(font);
  text(s,0,150);
  if(keyPressed){
    saveFrame("vnder-##.png");
  }
  
}
float x(float t){
  return sin(t/100)*100;
}
float y(float t){
  return cos(t/100)*100;
}
float x1(float t){
  return sin(t/10)*100;
}
float y1(float t){
  return cos(t/10)*100;
}
float x2(float t){
  return sin(t/15)*200;
}
float y2(float t){
  return cos(t/15)*200;
}