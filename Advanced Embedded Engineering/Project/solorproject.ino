#include <Servo.h>

Servo servoX;  // left-right
Servo servoY;  // up-down

int ldrTop = A0;
int ldrBottom = A1;
int ldrLeft = A2;
int ldrRight = A3;

int posX = 90;  // starting servo positions
int posY = 90;

void setup() {
  servoX.attach(9);  // horizontal
  servoY.attach(10); // vertical

  servoX.write(posX);
  servoY.write(posY);

  delay(1000);
}

void loop() {
  int top = analogRead(ldrTop);
  int bottom = analogRead(ldrBottom);
  int left = analogRead(ldrLeft);
  int right = analogRead(ldrRight);

  int threshold = 50; // how close the values need to be to be considered "equal"

  // differences
  int diffX = abs(left - right);
  int diffY = abs(top - bottom);

  // STOP condition (when all readings are close)
  if (diffX < threshold && diffY < threshold) {
    // do nothing - already centered
  } else {
    // Horizontal adjustment
    if (diffX > threshold) {
      if (left > right) posX -= 1;
      else posX += 1;
      posX = constrain(posX, 0, 180);
      servoX.write(posX);
    }

    // Vertical adjustment
    if (diffY > threshold) {
      if (top > bottom) posY -= 1;
      else posY += 1;
      posY = constrain(posY, 0, 180);
      servoY.write(posY);
    }
  }

  delay(100); 
}

