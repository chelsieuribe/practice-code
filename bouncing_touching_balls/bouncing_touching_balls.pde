//declare loc, vel, and acc
PVector loc, vel, acc;
PVector loc2, vel2, acc2;
PVector loc3, vel3, acc3;
int sz = 150;
int sz2 = 200;
int sz3= 250;

void setup() {
  size(800, 600);
  //initialize loc, vel, and acc
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();    //random unit vector
  acc = new PVector(0, 0);
  loc2 = new PVector(width*.25, height*.25);
  vel2 = PVector.random2D();
  acc2 = new PVector(0, 0);
  loc3 = new PVector (width*.50, height*.50);
  vel3 = PVector.random2D();
  acc3 = new PVector(0, 0);
}

void draw() {
  background(0);
  //move the balls
  vel.add(acc);
  loc.add(vel);
  vel2.add(acc2);
  loc2.add(vel2);
  vel3.add(acc3);
  loc3.add(vel3);


  //check to see if the circles are touching
  if (loc.dist(loc2) < sz/2 + sz2/2) { //...if it is...
    if (loc.x < loc2.x) {    //if ball 1 is on the left
      vel.x = -abs(vel.x);
      vel2.x = abs(vel2.x);
    } else {
      vel.x = abs(vel.x);
      vel2.x = -abs(vel2.x);
    }
    if (loc.y < loc2.y) {
      vel.y = -abs(vel.y);
      vel2.y = abs(vel2.y);
    } else {
      vel.y = abs(vel.y);
      vel2.y = -abs(vel2.y);
    }
  }
  if (loc2.dist(loc3) < sz2/2 + sz3/2) {
    if (loc2.x < loc3.x) {
      vel2.x = -abs (vel2.x);
      vel3.x = abs(vel3.x);
    } else {
      vel2.x = abs(vel2.x);
      vel3.x = -abs(vel3.x);
    }
    if ( loc2.y < loc3.y) {
      vel2.y = -abs(vel2.y);
      vel3.y = abs(vel3.y);
    } else {
      vel2.y = abs(vel2.y);
      vel3.y = -abs(vel3.y);
    }
  }
  if ( loc3.dist(loc) < sz3/2 + sz/2) {
    if (loc3.x < loc.x) {
      vel3.x = -abs(vel3.x);
      vel.x = abs(vel.x);
    } else {
      vel3.x = abs(vel3.x);
      vel.x = -abs(vel.x);
    }
    if (loc3.y < loc.y) {
      vel3.y = -abs(vel3.y);
      vel.y = abs(vel.y);
    } else {
      vel3.y = abs(vel3.y);
      vel.y = -abs(vel.y);
    }
  }


  //draw the ball
  fill(50, 50, 250);
  ellipse(loc.x, loc.y, sz, sz);
  ellipse(loc2.x, loc2.y, sz2, sz2);
  ellipse(loc3.x, loc3.y, sz3, sz3);

  //bounce the ball
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }
  if (loc2.x + sz2/2 > width || loc2.x - sz2/2 < 0) {
    vel2.x *= -1;
  }
  if (loc2.y + sz2/2 > height || loc2.y - sz2/2 < 0) {
    vel2.y *= -1;
  }
  if (loc3.x + sz3/2 > width || loc3.x - sz3/2 < 0) {
    vel3.x *= -1;
  }
  if (loc3.y + sz3/2 >height || loc3.y - sz3/2 < 0) {
    vel3.y *= -1;
  }
}


void mouseReleased() {
  loc3.set(mouseX, mouseY);
}

