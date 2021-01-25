// instructions to play game: use WASD to move the pinkish-orange ball to eat the blue one

int x=100;
int y=200;
int foodx=300;
int foody=200;
int mover = 0;
int movel = 0;
int moveu = 0;
int moved = 0;
int score = 0;
boolean check = true;
boolean gameOver = false;


void setup() {
  size(400, 400);
  frameRate(70);

}

void draw() {
  background(255);

  template();
  snake();
  grow();
  move();
  keyPressed();
}
  

void template() {
  noStroke();
  fill(#FC886B);
  ellipse(x, y, 20, 20);

  fill(0, 100, 200);
  ellipse(foodx, foody, 20, 20);
  fill(0);
  textSize(20);
  text(score, 20,20);
  if (gameOver == true){
    move();
    keyPressed();
    grow();
     background(255);
    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("Game Over", 190, 150);
    textSize(40);
    text("Your Score: "+ score,190,250);
  }

}

void snake() {
  if (blue(get(x+20,y))<10 || blue(get(x,y+20))<10 || blue(get(x-20, y))<10 || blue(get(x-20, y))<10) {
    background(255);
    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("Game Over", 190, 150);
    textSize(40);
    text("Your Score: "+ score,190,250);
    textSize(30);
    text("Press r to restart", 190, 300);
    gameOver = true;
    check = false;
  }

}

void grow() {
  if (get(x+10, y)==color(0, 100, 200) || get(x, y+10)==color(0, 100, 200) || get(x-10, y)==color(0, 100, 200) || get(x, y+10)==color(0, 100, 200)) {
    foodx=int(random(380));
    foody=int(random(370));
    score = score+10;
  }
}

 void move(){
   if (mover > 0){
    x = x + 5;
  }
  if (movel > 0){
    x = x - 5;
  }
  if (moved > 0){
    y = y + 5;
  }
  if (moveu > 0){
    y = y - 5;
  }
  if (key=='r') {
    gameOver=false;
    check=true;
    x=100;
    y=200;
    foodx=300;
    foody=200;
    score = 0;
  }

 }
void keyPressed(){
    if (key=='w') {
      moveu = 1;
      moved = 0;
      mover = 0;
      movel = 0;
    }
    if (key=='s') {
      moveu = 0;
      moved = 1;
      mover = 0;
      movel = 0;
    }
    if (key=='a') {
      moveu = 0;
      moved = 0;
      mover = 0;
      movel = 1;
    }
    if (key=='d') {
      moveu = 0;
      moved = 0;
      mover = 1;
      movel = 0;
    }
  }
