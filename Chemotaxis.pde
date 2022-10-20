Bacteria[] virus;
Face uninfected;
Face infected;

void setup() {
  size(500,500);
  background(255);
  virus = new Bacteria[20];
  for(int i = 0; i < virus.length; i++) {
    virus[i] = new Bacteria();
  }
  uninfected = new Face(250);
  infected = new Face(116);
}

void draw() {  
  background(255);
  for(int i = 0; i < virus.length; i++) {
    virus[i].move();
    virus[i].show();
  }
  
  if(touched == true) {
    infected.move();
    infected.show();
  } else {
    uninfected.move();
    uninfected.show();
  }
}

void mousePressed() {
  redraw(); //put this here or no?
  touched = false;
}

boolean touched;

class Bacteria {
  int bacX;
  int bacY;
  int bacColor;
  
  Bacteria() {
    bacX = 250;
    bacY = 250;
    bacColor = color((int)(Math.random()*100) + 40,(int)(Math.random()*100) + 130,(int)(Math.random()*100) + 30);
  }
  
  void move() {
    //MEDIUM
    if(mouseX > bacX) {
      bacX += (int)(Math.random()*7) - 2;
    } else {
      bacX += (int)(Math.random()*7) - 4;
    }
    
    if(mouseY > bacY) {
      bacY += (int)(Math.random()*7) - 2;
    } else {
      bacY += (int)(Math.random()*7) - 4;
    }
    
    //FAST
    /*if(mouseX > bacX) {
      bacX += (int)(Math.random()*12) - 3;
    } else {
      bacX += (int)(Math.random()*12) - 9;
    }
    
    if(mouseY > bacY) {
      bacY += (int)(Math.random()*12) - 3;
    } else {
      bacY += (int)(Math.random()*12) - 9;
    } */
    
    if(mouseX == bacX && mouseY == bacY) {
      touched = true;
    }
  }
  
  void show() {
    fill(bacColor);
    ellipse(bacX,bacY,20,20);
  }
}

class Face {
  int faceX;
  int faceY;
  int redTone;
  
  Face(int c) {
    faceX = mouseX;
    faceY = mouseY;
    redTone = c;
  }
  
  void move() {
    faceX = mouseX;
    faceY = mouseY;
  }
    
  void show() {
    fill(redTone,255,18);
    ellipse(mouseX,mouseY,60,60);
    fill(0);
    ellipse(mouseX-13,mouseY-5,8,8);
    ellipse(mouseX+13,mouseY-5,8,8);
    ellipse(mouseX,mouseY+12,15,15);
  }
}
