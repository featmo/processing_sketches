int amt = 10;
Particles[] parts = new Particles[amt]; //An array of particle objects size amt=10
void setup(){
  frameRate(80);
  size(1920,1080); 
  /*Iterate across the particle object array forevery index an abject of particle is created*/
  for(int i = 0; i < amt; i++){
    parts[i] = new Particles();    
  }
  
}
void draw(){
  //background(0,0,0);
  background(255,255,255);
  //Iterrate acros the array again
  for(int i = 0; i < amt; i++){    
    //each ibject indexed in the array will call the required methods
    parts[i].display();
    parts[i].move();
    parts[i].direction(mouseX, mouseY);
    parts[i].contain(); 
    /*begin line conection*/
    beginShape();
    if(i != parts.length-1){  
      //a vertex is created between the particle at i and the net particle in the array
      vertex(parts[i].cordX(),parts[i].cordY());
      vertex(parts[i+1].cordX(),parts[i+1].cordY());
    }
    endShape();   
    //if a mouse button even occurs, strings are created from the particle position to the mouse
    if(mousePressed){parts[i].strings(mouseX, mouseY);}
  }
 
}