class Block{
  String type;
  
  float x;
  float y;
  float z;
  float w =100;
  float h =100;
  float d=100;
  Block(float x_,float y_,float z_,String type_){
    type=type_;
    x=x_;
    y=y_;
    z=z_;
    
    //x=x_;
    //y=z_;
    //z=-1*y_;
    
    
    //x=y_;
    //y=x_;
    //z=z_;
  }
  void show(){
    if (this.type !="air"){
    translate(this.x,this.y,this.z);
    box(this.w,this.h,this.d);
    translate(-this.x,-this.y,-this.z);
    }
  }
}
