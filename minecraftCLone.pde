
boolean computerControlled=false;
float sense=0.03;


boolean moveRight = false;
boolean moveLeft=false;
boolean moveUp=false;
boolean moveDown =false;
boolean backSpace = false;

int deg=0;
float count=0;
float fullTurn =1000;
float camX=0;
float camY =-2500;
float camZ=0;


boolean w = false;
boolean a=false;
boolean s=false;
boolean d=false;
float moveSpeed =10;
Block sample;


Camera cam;

Chunk c;
Chunk [] Chunks;
int chunkDistance=8;
int pastMouseX;
int pastMouseY;
float rotX=0;
float rotY=0;
float gravity = moveSpeed;
//world config
int chunkHeight =2;
int chunkWidth=3;
//float camHeightAboveTheFloor = sample.h;
//chunks = new Chunks[chunkDistance*4];

void setup(){
  //wwwassertEquals(ArithmeticException.class, exception.getCause().getClass());
  sample = new Block(0,0,0,"air");
  cam = new Camera(camX,camY,camZ);

    println("issue");
  
  noCursor();
  
  
  frameRate(60);
  //size(500, 400, P3D);
    
  fullScreen(P3D);//Starting the P3D renderer
  Chunks = new Chunk[chunkHeight*chunkWidth];
  int index=0;
  Block sample = new Block(0,0,0,"solid");
  c =new Chunk(16,0,16);
  for(int i=0;i<chunkWidth*c.w*sample.w;i+=c.w*sample.w){
    for(int j=0;j<chunkHeight*c.h*sample.h;j+=c.h*sample.h){
      Chunks[index]=new Chunk(i,j,0);
      index++;
    }
  }
  for(int i=Chunks[0].blocks[0][0].length-1;i>0;i--){
    if (Chunks[0].blocks[0][0][i]!=null){
      
      camY=Chunks[0].blocks[0][0][i].y-(Chunks[0].blocks[0][0][i].h*2);
      camX=Chunks[0].blocks[0][0][i].x;
      break;
    }
  }
  //camY=Chunks[0].blocks[0][0][Chunks[0].blocks[0][0].length].y;
  pastMouseY=mouseY;
  pastMouseX =mouseX;
}



void draw(){
  //rotateX(radians(-180));
  if (w){
    camX+=moveSpeed;
  }
  if(a){
    camZ-=moveSpeed;
}
  if (d){
    camZ+=moveSpeed;
  }
  if(s){
    camX-=moveSpeed;
  }
    if(backSpace){
   camY+=moveSpeed; 
  }
  
  
  if(moveLeft){
    rotX-=sense;
  }
  if(moveRight){
    rotX+=sense;
  }
  if(moveUp){
    rotY+=sense;
 }
  if(moveDown){
    rotY-=sense;
  }

  
  camera(camX, camY, camZ+10, camX,camY, camZ, 
       0.0, 1.0, 0.0);
    //camera(camX, camY, camZ, camX+1000,camY+10000, 0, 
    //   0.0, 1.0, 0.0);

  background(0);
  //for cam rotations
      //rotateX(rotY); 



  translate(camX,camY,camZ);
  rotateX(rotY); 
  //rotateZ(rotY); 
  
  
  rotateY(rotX);//correct
  translate(-camX,-camY,-camZ);
  
  for(Chunk c:Chunks){
      fill(color(255,255,255));
  c.show();
  }
  //c.show();
  //Chunks[1].show();
  fill(color(255,0,0));
  translate(camX,camY,camZ);
  box(100,100,100);
  translate(-camX,-camY,-camZ);
    //println(frameRate);
  int chunkID=findNearestChunk(Chunks,(float)Math.ceil(camX)+sample.w,(float)Math.ceil(camZ)+sample.h);
  
  Chunk currentChunk= Chunks[chunkID];
  
  int[] blockIndexes= currentChunk.getXZ(camX,camZ);
    println(blockIndexes);
  Block[] currentRow = currentChunk.blocks[blockIndexes[1]] [blockIndexes[0]];
  Block currentBlock=currentChunk.getFirstNonAirBlock(currentRow);
  float currentHeight= currentBlock.y;
  //camY=currentHeight-sample.h*2;
 
  if (camY+sample.h*2<currentHeight){
    camY+=gravity;
  }
  //println(currentChunk.blocks[blockIndexes[0]] [currentChunk.blocks[blockIndexes[1]] [0].y);
  //println(chunkID);
  fill(255,0,0);
  //Chunks[chunkID].show();
  
}


void keyPressed(){
  if(keyCode == 'W'){
    w=true;

  }
  if(keyCode =='A'){
    a=true;
  }
    if(keyCode =='D'){
    d=true;
  }
    if(keyCode =='S'){
    s=true;
  }
  if(keyCode ==UP){
    moveUp=true;
  }
  if(keyCode == DOWN){
    moveDown = true;
  }
  if(keyCode == LEFT){
    moveLeft = true;
  }
  if(keyCode == RIGHT){
    moveRight =true;
  }
  if(keyCode == BACKSPACE){
    backSpace = true;
  }

}
void keyReleased() {
  if(keyCode == 'W'){
    w=false;

  }
  if(keyCode =='A'){
    a=false;
  }
    if(keyCode =='D'){
    d=false;
  }
    if(keyCode =='S'){
    s=false;
  }
  
  
  if(keyCode ==UP){
    moveUp=false;
  }
  if(keyCode == DOWN){
    moveDown = false;
  }
  if(keyCode == LEFT){
    moveLeft = false;
  }
  if(keyCode == RIGHT){
    moveRight =false;
  }
    if(keyCode == BACKSPACE){
    backSpace = false;
  }

 
}

int findNearestChunk(Chunk[]chunks,float x,float z){
  int chunkI=0;
  for(Chunk chunk: chunks){
     float chunkX=chunk.x;
    float chunkZ=chunk.y;
    println(chunkX,chunkZ);
    println(String.valueOf(chunkX+chunk.w*sample.w)+' '+String.valueOf(chunkZ+chunk.h*sample.h));
    
  }
  println("____________________________________________________");
  for(Chunk chunk: chunks){
    float chunkX=chunk.x;
    float chunkZ=chunk.y;
    //println(String.valueOf(chunkX+chunk.w*sample.w)+' '+String.valueOf(chunkZ+chunk.h*sample.h));
    if(abs(x)<chunkX+chunk.w*sample.w &&abs(z)<chunkZ+chunk.h*sample.h){
      //println(String.valueOf(chunks[chunkI].x) +" "+ String.valueOf(chunks[chunkI].z));
      return chunkI;
    }
    chunkI++;
  }
  //println("nooo "+x,z);
  
  return 0;
}

int[] getXZ(float playerX,float playerZ){
     float deltaX = abs(playerX - camX)/sample.w;
     float deltaY = abs(playerZ-camY)/sample.d;
     println(deltaX,deltaY);
     int xIndex = (int)Math.ceil(deltaX);
     int zIndex = (int)Math.ceil(deltaY);
     int[]indexs={xIndex,zIndex};
     return indexs;
     
   }
