int amt = 1000;
Particles[] parts = new Particles[amt];
Particles part;
void setup(){
  frameRate(80);
  size(1080,720);
  for(int obj = 0; obj < amt; obj++){
    parts[obj] = new Particles();
  }
  part = new Particles();
}
void draw(){
  background(255,255,255);
  //ellipse(width/2, height/2, 10, 10);
   for(int i = 0; i < amt; i++){
     parts[i].spawn();
     parts[i].moveTo();
     parts[i].speedReg();
     parts[i].contain();
   }
   if(keyPressed){
     clear();
   }
}