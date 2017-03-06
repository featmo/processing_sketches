class Particles{ 
  float x,y;
  PVector loc;
  PVector vel;
  PVector acc;
  PVector target;
  float szx, szy;
  float maxforce, maxspeed;
  float r,g,b, a, alpha;
  Particles(){  
    /*********color*********/    
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    alpha = 40;
    a = 70;
    /**********************/
    szx = 24;
    szy = 24;
    x = random(10, 1070);
    y = random(10, 710);
    acc = new PVector(0,0);
    vel = new PVector(0,1);
    loc = new PVector(x,y);
    
    maxspeed = 7;
    maxforce = 0.02;
   
  }
  //describes the particle look
  void display(){    
    ellipseMode(CENTER);
    fill(r,g,b,alpha);   
    ellipse(loc.x,loc.y,8,8);
    stroke(r,g,b,alpha);
    strokeWeight(1);
    noFill();
    ellipse(loc.x,loc.y,14,14);
    ellipse(loc.x,loc.y,szx,szy);
  }
  //move() velocity plus acc...
  //velocity is ltd to mmaxspeed
  //location add velocity, changes location
  void move(){
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
  }
  //passing two params allows us to pick the target for the particles
  void direction(float x1, float y1){
    target = new PVector(x1, y1); //new vector made
    PVector direc = PVector.sub(target, loc); //vector made describing distance from target to location
    direc.setMag(maxspeed); //magnitude is set according to max speed
    PVector steering = PVector.sub(direc, vel); //vector describing the sterring force graig reynolds steering = direction-velocity
    steering.limit(maxforce); //steering is limited to maxforce, turning force in a sense
    acc.add(steering); //acc plus the new direction
    morph(); //change the shape. see morph() function
  }
  void strings(float x1, float y1){
    PVector l = PVector.sub(target,loc);
    float len = l.mag();
    stroke(r,g,b,a);
    line(loc.x,loc.y,x1,y1);
    //when the kength of the string is greater than 200 and the alpha channel is still visible above 10, fade() method called
    if(len > 200 && a > 10){
      fade();       
    }
    //similar setup to previous statement
    if(len < 200 && a <= 80){
      strengthen();      
    }
       
  }
  /********************************************************************
  fade() and srengthen(), fade the particles in and out depending on howv far 
  they are from the mouse, this gives the effect of smoothly generated lines
  ********************************************************************/
  void fade(){    
    a-=5;
  }
  void strengthen(){
    a+=3;
  }
  //morph() modifies the shape of the particle depending on how close it is to it's target
  void morph(){
    PVector d = PVector.sub(target, loc);
    float m = d.mag();
    if(m < 50 && szx< 70){
      grow();
    }
    if(m > 50 && szx > 24){
      shrink();
    }
  }
  
  //grow(), and shrink() are self explanatory.... the grow or shrink the particle
  void grow(){
    szx+=10;
    szy+=10;
  }
  void shrink(){
    szx--;
    szy--;
  }
  PVector position(){    
    return loc;
  }
  float cordX(){
    return loc.x;
  }
  float cordY(){
    return loc.y;
  }
  
  //contain the particles to the screen
  void contain(){
    if(loc.x < 0){
      //loc.x = width; //resets the position at edge to opposite side
      loc.x*=-1; //bounces parts of the edge
    }
    if(loc.x > width){
      //loc.x = 0;
      loc.x*=-1;
    }
    if(loc.y < 0){ 
      //loc.y = height;
      loc.y*=-1;
    }
    if(loc.y > height){
      //loc.y = 0;
      loc.y*=-1;
    }
  }
}