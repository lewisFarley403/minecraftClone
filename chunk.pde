import java.rmi.Remote;
import java.rmi.RemoteException;
class Chunk{
    Block sample = new Block(0,0,0,"air"); 
   int w=16;
   int h=16;
   int depth=32;
   int totalHeight =256;
   float x;
   float y;
   float z;
   Block[][][] blocks;
   Chunk(float x_,float y_,float z_){
     this.blocks = new Block[this.w][this.h][this.depth+1];
     this.x=x_;
     this.y = y_;
     this.z=z_;
     this.populateChunk();
   }
   void populateChunk(){
     float n1 = random(0,1);

     float increment = 0.001;
     Block b = new Block(0,0,0,"solid");
     float blockSize = b.w;
     float x=this.x;
     float y = this.y;
     float z=this.z;
     
       for(int i =0;i<this.w;i++){
         for(int j =0;j<this.h;j++){
           
           float h = (int)this.depth*noise(n1);

           
           //h=32%(i+1);
           println(h);
           for(int k=0;k<h;k++){
             this.blocks[i][j][k] = new Block(x,-z,y,"solid");
             z+=blockSize;
         }
         n1+=increment;
         x+=blockSize;
         
         //x+=blockSize;
         z=this.z;
       }
       //x=this.x;
       x=this.x;
       y+= blockSize;
       println(y);
     }
   }
   int[] getXZ(float playerX,float playerZ){
     float deltaX = abs(playerX - this.x)/sample.w;
     float deltaY = abs(playerZ-this.y)/sample.d;
     println(deltaX,deltaY);
     int xIndex = (int)Math.ceil(deltaX);
     int zIndex = (int)Math.ceil(deltaY);
     int[]indexs={xIndex,zIndex};
     return indexs;
     
   }
   Block getFirstNonAirBlock(Block[] blocks){
     Block res;
       for(int i=blocks.length-1;i>0;i--){
       
          if (blocks[i]!=null){
            return blocks[i];
          }
        }
        return null;
     
   }
   void show(){
     //println(this.blocks);
     int shows =0;
       for(int i=0;i<this.w;i++){
         for(int j=0;j<this.h;j++){
            
           for(int k=0;k<this.blocks[i][j].length-1;k++){
             
             
           //println(this.blocks[i][j][k]!=null);
             //if((k==0||(i==0||i==this.w)||(j==0||j==this.w)) && this.blocks[i][j][k]!=null){//fix me at a later date, im causing crap render, fps fix
             if(this.blocks[i][j][k]!=null ){
             //  boolean n1,n2,n3,n4,n5,n6;
             //  try{
             //  n1=this.blocks[i+1][j][k].type =="air";
             //  //println("no errror 1");
             //  }
             //  catch(Exception e){
             //    n1=false;
             //  }
               
               
             //  try{
             //  n2=this.blocks[i-1][j][k].type =="air";
             //  //println("no errror 2 ");
             //  }
             //  catch(Exception e){
             //    n2 =false;}
                 
                 
             //  try{
             //  n3=this.blocks[i][j+1][k].type =="air";
             //  //println("no errror 3");
             //  }
             //  catch(Exception e){
             //    n3=false;
             //  }
               
             //  try{
             //  n4=this.blocks[i][j-1][k].type =="air";
             //  //println("no errror 4");
             //  }
             //  catch(Exception e){
             //    n4=false;
             //  }
               
               
             //  try{
             //  n5=this.blocks[i][j][k+1].type =="air";
             //  //println("no errror 5");
             //  }
             //  catch(Exception e){
             //    n5=false;
             //  }
               
               
             //  try{
             //  n6=this.blocks[i][j][k-1].type =="air";
             //  //println("no errror 6");
             //}
             //catch(Exception e){
             // n6=false; 

             //}
             
             //if (n1||n2||n3||n4||n5||n6){
             //  println("no air");
             //  println(i,j,k);
             //}
             //if(i==8&&j==8&&k==16){
             //  println(this.blocks[i-1][j][k].type);
             //  println(this.blocks[i+1][j][k].type);
             //  println(this.blocks[i][j+1][k].type);
             //  println(this.blocks[i][j-1][k].type);
             //  println(this.blocks[i][j][k+1].type);
             //  println(this.blocks[i][j][k-1].type);
               
             //}


             //  if(this.blocks[i][j][k].type!="air" && (n1||n2||n3||n4||n5||n6)){
                 //if(this.blocks[i][j][k].type!="air"){
               this.blocks[i][j][k].show();
               shows++;
               }
             }
             }
         }
       }
     }
     //println(shows);
   //}
   
