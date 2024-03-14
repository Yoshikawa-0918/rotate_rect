class RotateRect{
  float x,y,rotate,r,g,b,alpha,speed;  //x座標,y座標,回転角度,R,G,B,透明度,回転速度
  
  RotateRect(){}
  
  //初期化する
  void init(){
    x = random(0,500);
    y = random(0,500);
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    alpha = random(15,255);
    speed = random(0.02,0.06);
  }
  
  //描画する処理
  void display(){
    push();
    translate(x,y);
    rotate(rotate);
    rectMode(CENTER);
    noStroke();
    fill(r,g,b,alpha);
    rect(0,0,100,100);
    pop();
  }
  
  //アップデートする処理 四角形を回転させる
  void update(){
    rotate += speed;
  }
}

ArrayList<RotateRect> rects = new ArrayList();

void setup(){
  size(500,500);
}

void draw(){
  background(0);
  
  if(!rects.isEmpty()){
    for(RotateRect rect : rects){
      rect.display();
      rect.update();
    }
  }
}

void mousePressed(){
  RotateRect newRect = new RotateRect();
  newRect.init();
  rects.add(newRect);
}

void keyPressed(){
  if(key == ' '){
    rects.removeAll(rects);
  }
}
