float x, y, velX, velY, gravity;
int sz = 100;
void setup() {
  size(800, 600);
  x = width/2;
  y = height*.1;
  velX = 0;        //assign value for horizontal velocity
  velY = 0;        //assign value for vertical velocity
  gravity = 2;     //assign value for gravity (vertical acceleration)
  textSize(25);
  //  noLoop();
}

void draw() {
  background(105, 50, 200);
  ellipse(x, y, sz, sz);      //draw an ellipse
  velY += gravity;            //add vertical acceleration (gravity) to vertical velocity
  x += velX;                  //add horizontal velocity to horizontal position
  y += velY;                  //add vertical velocity to vertical position


  if (y + sz/2 > height) {    //if ball hits bottom...
    y = height - sz/2;
    velY = -abs(velY);        //...reverse vertical velocity
  }
}

//void mousePressed() {
//  redraw();
//}

