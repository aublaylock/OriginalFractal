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

  scrX+=0.01;
  scrY+=0.01;
  translate(250,250,0);
  rotateX(scrX);
  rotateY(scrY);
  sponge(500,500,0,200, depth);
}

void sponge(int x, int y, int z, int size, int depth){
  pushMatrix();
  translate(x,y,z);
  rotateX(rX);
  rotateY(rY);
  box(size);
  popMatrix();
  if(depth==5){
    fill(96, 108, 56);
  }
  if(depth==4){
    fill(40, 54, 24);
  }
  if(depth==3){
    fill(254, 250, 224);
  }
  if(depth==2){
    fill(221, 161, 94);
  }
  if(depth==1){
    fill(188, 108, 37);
  }
  
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
  if(key == ' '){
    depth++;
  }
}
