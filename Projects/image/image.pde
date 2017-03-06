PImage image;
int xs = 1920;
int ys = 1080;
int buffer = 300;
int val = 230;
float record = 250*3;
void setup(){
  size(1920,1080);
  image = loadImage("ext.jpg");
  smooth();
}
void draw(){
  imageMode(CENTER);
  //image.resize(500,500);
  image(image,50,50,80,80);
  loadPixels();
  adjustImage();
  updatePixels();
  //adjustBright();
  //adjustGreen();
  //adjustRed();
  //adjustBlue();
  updatePixels();
  
  
  
}
void keyPressed(){
  if(key == 'p'){
    saveFrame("img_##.png");
  }
}
void adjustImage(){
  for(int x = 0; x < width-1; x++ ){
    for(int y = 0; y < height-1; y++){
      int loc = x+y*width;
      int loc1 = (x+1)+y*width;
      int loc2 = x+(y+1)*width;
      pixels[loc] = image.pixels[loc];
      pixels[loc1] = image.pixels[loc1];
      pixels[loc2] = image.pixels[loc2];
      float c = color(pixels[loc]);
      float c1 = color(pixels[loc1]);
      float c2 = color(pixels[loc2]); 
      if(abs(c-c1-c2) > record && brightness(pixels[loc]) >val && brightness(pixels[loc1])> val && brightness(pixels[loc2])> val){
          pixels[loc] = color(y/2,x/2,255);
          
      }
        else{
          pixels[loc] = color(0,0,0);
        }
     }
   }
  
}
void adjustBright(){
  loadPixels();
  for(int x = 0; x < width-1; x++ ){
    for(int y = 0; y < height; y++){
      int loc = x+y*width;
      pixels[loc] = image.pixels[loc];
      if(brightness(pixels[loc]) > 50){
        pixels[loc] = mouseX;
        
      }
    }
    
  }
  updatePixels();
}
void adjustRed(){
  for(int x = 0; x < width; x++ ){
    for(int y = 0; y < height; y++){
      int loc = x+y*width;
      pixels[loc] = image.pixels[loc];
      if(red(pixels[loc]) > 180){
        pixels[loc] -= 50;
      }
    }
  }
  updatePixels();
}
void adjustGreen(){
  for(int x = 0; x < width; x++ ){
    for(int y = 0; y < height; y++){
      int loc = x+y*width;
      pixels[loc] = image.pixels[loc];
      if(green(pixels[loc]) > 180){
        pixels[loc] -= 50;
      }
    }
  }
  updatePixels();
}
void adjustBlue(){
  for(int x = 0; x < width; x++ ){
    for(int y = 0; y < height; y++){
      int loc = x+y*width;
      pixels[loc] = image.pixels[loc];
      if(blue(pixels[loc]) > 180){
        pixels[loc] -= 50;
      }
    }
  }
  updatePixels();
}