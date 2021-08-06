class Camera{
  float x;
  float y;
  float z;
  Camera(float x_,float y_,float z_){
    x=x_;
    y=y_;
    z=z_;
    
  }
  void display(Block[] blocks){
      rectMode(CENTER);
    println(abs(blocks[1].x-this.x),abs(blocks[0].y-this.y),blocks[0].z-this.z);
    for(int i =0;i<blocks.length;i++){
      Block block = blocks[i];
      translate(abs(block.x-this.x),abs(block.y-this.y),abs(block.z-this.z));
      //println(abs(block.x-this.x),abs(block.y-this.y),abs(block.z-this.z));
        //translate(block.x,block.y,block.z);
      //println(block.y+height/2);
      fill(255,0,0);
      //box(block.w/distZ,block.h/distZ,block.d);
      box(100,100,100);
      
    }
    //translate(0,0);
  }
  void display(){
    rectMode(CENTER);
    //Block b =new Block(100,100,-100);
    //Block b2 =new Block(100,100,-10);
    //b2.show();
    
    //b.show();

  }
}
