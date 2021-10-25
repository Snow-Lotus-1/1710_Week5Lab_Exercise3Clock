float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;

float faceSize_Z = 6000;
float faceSize_ZZ = 60000;
float lengthSecondHand = 220;
float lengthMinuteHand = 200;
float offset = TWO_PI * -0.28;

PFont digital;



void setup() {
  frameRate(60);
  size(1500, 1000, P2D); 
  strokeWeight(2);
  digital = createFont("Arial", 120);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  println(h);
  println(m);
  println(s);
  rotHours = TWO_PI * ((float) h / 24 + (float) m / (24*60) + (float) s / (24*60*60));
 
  fill(0, 0, 0);
  rect(0, 0, width, height);
 
  
  //scale 2  
  strokeWeight(4);
  stroke(0, 255, 25);
  for(int i=0; i<(24*60); i++) {
    float rot = ((float) i/(24*60)) * TWO_PI;
    pushMatrix();
    translate(2*width/3+250, 250);
    translate(faceSize_Z * cos(rotHours-TWO_PI/4) /2, faceSize_Z * sin(rotHours-TWO_PI/4)/2);
    rotate(rot);
    line(0, faceSize_Z/2 - 40, 0, faceSize_Z/2);
    popMatrix();
  }
  stroke(0, 127, 255);
  for(int i=0; i<24; i++) {
    float rot = ((float) i/24) * TWO_PI;
    pushMatrix();
    translate(2*width/3+250, 250);
    translate(faceSize_Z * cos(rotHours-TWO_PI/4) /2, faceSize_Z * sin(rotHours-TWO_PI/4)/2);
    rotate(rot);
    line(0, faceSize_Z/2 - 80, 0, faceSize_Z/2);
    popMatrix();
  }
  pushMatrix();
  translate(2*width/3+250, 250);
  translate(faceSize_Z * cos(rotHours-TWO_PI/4) /2, faceSize_Z * sin(rotHours-TWO_PI/4)/2);
  
  rotate(rotHours);
  stroke(255, 0, 0);
  line(0, 0, 0, faceSize_Z/2);
  popMatrix();
  
    //scale 3
  strokeWeight(6);
  stroke(0, 255, 25);
  for(int i=0; i<(24*60); i++) {
    float rot = ((float) i/(24*60)) * TWO_PI;
    pushMatrix();
    translate(2*width/3+250, 750);
    translate(faceSize_ZZ * cos(rotHours-TWO_PI/4) /2, faceSize_ZZ * sin(rotHours-TWO_PI/4)/2);
    rotate(rot);
    line(0, faceSize_ZZ/2 - 80, 0, faceSize_ZZ/2);
    popMatrix();
  }
  pushMatrix();
  translate(2*width/3+250, 750);
  translate(faceSize_ZZ * cos(rotHours-TWO_PI/4) /2, faceSize_ZZ * sin(rotHours-TWO_PI/4)/2);
  
  rotate(rotHours);
  stroke(255, 0, 0);
  line(0, 0, 0, faceSize_ZZ/2);
  popMatrix();
  
  //clear
  fill(255, 255, 255);
  rect(0, 0, 2*width/3, height);
 
  textFont(digital);
  fill(0);
  text("Hour: " + h + "\nMinute: " + m + "\nSecond:" + s, 100, 200);
  
}
