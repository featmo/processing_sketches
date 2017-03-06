class Flow{
  PVector[][] grid;
  int row, col, res;
  
  Flow(){ 
    res = 100;
    col = width/res;
    row = height/res;
    grid = new PVector[col][row];
    //create();
  }
  void create(){
    for(int i = 0; i < col; i++){
      for(int j = 0; j< row; j++){
        grid[i][j] = new PVector(i,j);
      
      }
    }
  }
  void display(){
     for(int i = 0; i < col; i++){
      for(int j = 0; j< row; j++){
        
      }
    }
  }

}