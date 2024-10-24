boolean animate = false;
boolean begin = false;
Smoke [] smokeParticles = new Smoke [100];


void setup() {
  size(600, 800);
  frameRate(40);
  drawBackground();
  drawCanister();
}

void draw() {
  if (begin) {
    delayFunc(200);
    begin = false;
    animate = true;
  }
  if (animate) {
    for (int i = 0; i < smokeParticles.length; i++) {
      smokeParticles[i].move();
      smokeParticles[i].show();
    }
  }
}

void mousePressed() {
  animate = false;
  drawBackground();
  drawCanister();
  if (get(mouseX, mouseY) == color(100, 149, 238)) {
    //remove lid and redraw in diff pos
    noStroke();
    fill(200);
    rect(width/2 - 16, 650 - 12, 34, 12);
    stroke(0);
    fill(100, 149, 237);
    rect(width/2 - 44, 650 - 10, 30, 10);
    for (int i = 0; i < smokeParticles.length; i++) {
      int random = (int)(Math.random() * 2);
      if (random == 0) 
        smokeParticles[i] = new Smoke((int)(Math.random() * 25));
      else 
      smokeParticles[i] = new Smoke();
    }
    begin = true;
  }
}

class Smoke {
  int myX, myY, size, opacity, smokeColor;

  Smoke() {
    myX = width/2;
    myY = 650;
    size = 50;
    opacity = 60;
    smokeColor = color(0, 0, 0, 0);
  }

  Smoke(int mySize) {
    myX = width/2;
    myY = 650;
    size = mySize;
    opacity = 60;
    smokeColor = color(0, 0, 0, 0);
  }

  void move() {
    myX += (int)(Math.random() * 50 - 25);
    myY += (int)(Math.random() * 50 - 35);
  }

  void show() {
    noStroke();
    if (opacity > 10)
      opacity-=1;
    int random = (int)(Math.random() * 3);
    if (random == 0)
      smokeColor = color(0, 71, 171, opacity);
    if (random == 1)
      smokeColor = color(20, 52, 164, opacity);
    if (random == 2)
      smokeColor = color(100, 149, 237, opacity);
    fill(smokeColor);
    ellipse(myX, myY, size, size);
  }
}

void delayFunc(int milliseconds) {
  int start = millis();
  while (millis() - start <= milliseconds) {
  }
}

void drawBackground() {
  stroke(0);
  strokeWeight(3);
  background(200);
  fill(150);
  rect(-2, 731, 700, 70);
}

void drawCanister() {
  fill(0);
  rect(width/2 - 15, 650, 30, 100);
  fill(100, 149, 238);
  rect(width/2 - 15, 650 - 10, 30, 10);
  fill(100, 149, 237);
  pushMatrix();
  translate(width/2 + 8, 650 + 87);
  rotate(radians(-90));
  textFont(createFont("Arial Bold", 18));
  textSize(20);
  text("SMOKE", 0, 0);
  popMatrix();
}
