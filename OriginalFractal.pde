float rX = 0;
float rY = 0;
float scrX = 0;
float scrY = 0;
int depth = 0;

void setup(){
  size(1000,1000,P3D);
}


void draw(){
  background(255,255,255);
  rX+=0.01;
  rY+=0.01;
  sponge(500,500,0,200, depth);
}

void sponge(int x, int y, int z, int size, int depth){
  pushMatrix();
  translate(x,y,z);
  rotateX(rX);
  rotateY(rY);
  text(""+size, 500,500);
  if(size==2)
    fill(237, 247, 181);
  if(size==7)
    fill(237, 247, 210);
  if(size==22)
    fill(201, 193, 159);
  if(size==66)
    fill(125, 124, 122);
  if(size==200)
    fill(91, 91, 91);
  box(size);
  popMatrix();
  
  
  if(depth>0){  
    sponge(x+size, y+size, z+size, size/3, depth-1);
    sponge(x+size, y+size, z-size, size/3, depth-1);
    sponge(x+size, y-size, z+size, size/3, depth-1);
    sponge(x+size, y-size, z-size, size/3, depth-1);
    sponge(x-size, y+size, z+size, size/3, depth-1);
    sponge(x-size, y+size, z-size, size/3, depth-1);
    sponge(x-size, y-size, z+size, size/3, depth-1);
    sponge(x-size, y-size, z-size, size/3, depth-1);
  }
}

void keyPressed(){
  if(keyCode == UP && depth<4){
    depth++;
  }
  if(keyCode == DOWN && depth>0){
    depth--;
  }
}
