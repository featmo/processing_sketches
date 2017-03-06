import processing.video.*;
Capture video;
int xs = 640; 
int ys = 480;
void setup(){
  
  size(640,480);
  printArray(Capture.list());
  video = new Capture(this,xs,ys,30);
  video.start();
}
void captureEvent(Capture video){
  
  video.read();
}
void draw(){ 
  background(0);
  video.loadPixels();
  loadPixels();
  for(int x = 0; x < xs-1; x++){
    for(int y = 0; y < ys-1; y++){ 
      int loc = x+ y * xs;
      int loc1 = (x+1) + y * xs;
      int loc2 = x + (y+1) * xs;
      pixels[loc] = video.pixels[loc];
      
      float br1 = (video.pixels[loc]);
      float br2 = (video.pixels[loc1]);
      float br3 = (video.pixels[loc2]);
      float diff = abs(br1-br2);
      
      video.pixels[loc] = color(diff);
      if(diff > 10){
        pixels[loc] = color(100,255,180);
      }
      else{
        pixels[loc] = color(diff);
      }
      
      
      
    }
   
  }
  //image(video, 0, 0);
  updatePixels();
  
  
  
  
}