class Particles{
  float posX, posY;
  PVector loc;
  PVector vel;
  PVector acc;
  PVector mouse;
  float dis;
  float r,g,b;
  float maxspeed;
  float maxforce;
  Particles(){
    posX = random(0, width);
    posY = random(0, height);
    loc = new PVector(posX, posY);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    maxspeed = 4;
    maxforce = 1;
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
  }
  void spawn(){
    strokeWeight(1);    
    stroke(r,g,b,100);
    noFill();
    //fill(r,g,b);
    ellipse(loc.x, loc.y, 5, 5);
    ellipse(loc.x, loc.y, 10, 10);
  }
  void moveTo(){   
    
    mouse = new PVector(mouseX, mouseY);    
    PVector desired = PVector.sub(mouse,loc);
    desired.setMag(maxspeed);
    acc.add(desired);
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    //acc.mult(0);
    
  }
  void speedReg(){
    PVector cont = PVector.sub(mouse, loc);
    dis = cont.mag();
    if(dis < 100){
      maxspeed--;
    }
    else{
      maxspeed--;
    }
  }
  void contain(){
    if(loc.x < 0){
      loc.x = width;
    }
    if(loc.x > width){
      loc.x = 0;
    }
    if(loc.y < 0){
      loc.y = height;
    }
    if(loc.y > height){
      loc.y = 0;
    }
  }
}