class circle
{
  float x,y;
  int   countDown;
  String str;
  int moveMode;
  
  
  circle()
  {
    x = int(random(0,(width-80)/200))*200;
    y = int(random(0,height/100))*100;
    countDown = 50;
    str = diary[int(random(1,1755))];
    moveMode = round(random(0,1));
  }
  
  void display()
  {
    stroke(255);
    textAlign(LEFT);
    fill(255,255);
    if(moveMode == 0){
      x += countDown/2;
      text(str,x,y);
    }else{
      y += countDown/3;
      text(str,x,y);
    }
    
    countDown--;
  }
}


ArrayList<circle> circles;
String diary[] = new String[1756];
Boolean onoff;
void setup()
{
  size(800,450);
  circles = new ArrayList<circle>();
  frameRate(30);
  background(0);
  
  String TXTs[] = loadStrings("alltime.txt");
  for(int i =1;i<TXTs.length;i++){
    diary[i] = TXTs[i];
  }
}

void draw()
{
  //background(0);
  fill(0,90);
  rect(0,0,width,height);
  if(onoff){
    for (int i = circles.size()-1; i >=0; i--)
    {
      circles.get(i).display();
      if(circles.get(i).y>height-50 || circles.get(i).x>width-50 || circles.get(i).countDown==0)
      {
        circles.remove(i);
      }
    }
    for(int i =0;i<1;i++){
      circle newCircle = new circle();
      circles.add(newCircle);
    }
  }else{
    if(circles.size()>0){
      for (int i = circles.size()-1; i >=0; i--){
        circles.remove(i);
      }
    }
    textAlign(CENTER,CENTER);
    fill(255,255);
    text("Click to Start or Stop",width/2,height*3/4);
  }
}

void mousePressed()
{
  onoff = !onoff;
}
