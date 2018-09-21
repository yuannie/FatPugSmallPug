import ddf.minim.*;
Minim minim;
Minim samp;
AudioPlayer suspens;
AudioSample bark;
AudioSample end;
AudioSample eat;
AudioSample fjump;
AudioSample sjump;
boolean barking = false;
boolean ended = false;
static final int QTY = 6;
final AudioPlayer[] players = new AudioPlayer[QTY];

float[] Fdim = {600, 420, 142, 200}; //FATPUG: x, y, w, h
float[] Sdim = {400, 500, 150, 120}; // x y w h
float[] sine = {0.0, 100, 0.2};
float[] sinef = {0.0, 100, 0.2};//SINE: angle, scalar, speed
PImage [] spugr = new PImage[8];
PImage [] fpugb = new PImage[9];
PImage [] trees = new PImage[4];
PImage [] grass = new PImage[3];
PImage [] home = new PImage[3];
PImage hill;
PImage bone;
PImage spugb;
PFont pixel;
PFont pixel50;

int ground = 620;
int sframe = 0;
int fframe = 0;

//hit and stamina
boolean hit = false;
boolean trigger = false; // protects for timer
float stamina = 100;
float staminaS = 40;
int count = 0; //how many times lil pugs been shaken

//timer
int timer;
int hometime;
float delayTime = 0;
boolean startTiming = false;

boolean startHome = false;
boolean triggerHome = false;

//food
float Ex = -50;
float Ey = 615;
float Ed = 10;
int alpha = 255; // alpha of food

//home
float Ehome = 1280;

float angle = 0;

FPug fatPug;
SPug smallPug;

void setup() {
  frameRate(24);
  noCursor();
  noSmooth();
  size(1280, 720);
  pixel = loadFont("04b30-30.vlw");
  pixel50 = loadFont("04b30-50.vlw");
  textAlign(CENTER, CENTER);
  textFont(pixel);

  minim = new Minim(this);
  samp = new Minim(this);
  players[0] = minim.loadFile("bobabeach.mp3");
  suspens = minim.loadFile("chase3.mp3");
  bark = samp.loadSample("dogcristina.mp3");
  end = samp.loadSample("lose.mp3");
  eat = samp.loadSample("eat1.mp3");
  sjump = samp.loadSample("sjump.wav");
  fjump = samp.loadSample("fjump.wav");

  smallPug = new SPug(Sdim[0], Sdim[1], Sdim[2], Sdim[3]);
  fatPug = new FPug(Fdim[0], Fdim[1], Fdim[2], Fdim[3]);

  for ( int i = 0; i < spugr.length; i++ )
  {
    spugr[i] = loadImage("sr" + i + ".png");
  }
  for ( int i = 0; i < fpugb.length; i++ )
  {
    fpugb[i] = loadImage("fpb" + i + ".png");
  }
  for (int i = 0; i < trees.length; i++)
  {
    trees[i] = loadImage("bt" + i + ".png");
  }
  for (int i = 0; i < grass.length; i++)
  {
    grass[i] = loadImage("g" + i + ".png");
  }
  for (int i = 0; i < home.length; i++)
  {
    home[i] = loadImage("home" + i + ".png");
  }
  spugb = loadImage("sr8.png");
  hill = loadImage("bg.png");
  bone = loadImage("bon.png");

  for (int i = 0; i < 5; i++) // sets all keys to false
  {
    keys[i] = false;
    keys2[i] = false;
  }
  players[0].play();
  players[0].loop();
  timer = millis();
  
    hometime = millis();
  println(timer);
}

void draw() {
  screens();

  if ((millis() > timer + delayTime) && (startTiming == true)) {
    if (hit)
    {
      screen = 1;
    }
  startTiming = false;
  trigger = false;
  
}
}