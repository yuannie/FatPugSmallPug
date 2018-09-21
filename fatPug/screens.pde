int screen = 0;
boolean start = false;
boolean instruct = false;
int instr = 0;

int tscounter = 0;
int tfcounter = 0;
void screen0() {
  ended = false;
  background(#fbae17);
  fill(#0095a3);
  rect(0, ground, width, 220);

  trees();
  image(home[1], Ehome, ground-home[1].height);
  if (hit)
  {
    image(spugb, Fdim[0]-50, Fdim[1]);//attaches
  }
  fatPug.display();
  if (!hit) {
    smallPug.display();
    fscount = 0;
    ffcount = 0;
  }

  image(bone, Ex - bone.width/2, Ey - 30);

  if (start) {
    fill(#dddddd);
    ellipse(Ex, Ey, Ed, Ed);
    if (triggerHome == false)
    {
      startHome = true;
      hometime = millis();
      triggerHome = true;
    }
    home();
    fatPug.move();
    fatPug.hover();
    fatPug.offScreen();

    smallPug.move();
    smallPug.hit();
    smallPug.hover();
    randomFood();

    image(home[2], Ehome, ground-home[2].height);
    enviro();

    //stamina bars
    fill(#fe9f97);
    rect(width-320, 20, stamina*3, 10);
    rect(20, 20, staminaS*3, 10);
  }

  if (!start && !instruct) {
    beginning();
  }

  if (instruct && !start)
  {
    if (instr == 0) {
      instruct1();
    } else if (instr > 0)
    {
      instruct2();
    }
  }
}

void screen1() {
  textAlign(CENTER);
  if (!ended) {
    end.trigger();
    ended = true;
  }
  suspens.pause();
  fill(#f77e5e);
  rect(0, 0, width, height);
  fill(255);

  float y = sin(angle)*20;
  text("little pug has taken the scooter!", width/2, height/2);
  image(spugr[sframe], width/4 + y*15, height/1.9, spugr[sframe].width*3, spugr[sframe].height*3);
  sframe = sframe + 1;
  if (sframe == 7)
  {
    sframe = 0;
  }
  angle += 0.05;
  if (keyPressed && (keyCode == UP || key == 'w'))
  {
    keys2[0] = false;
    bark.stop();
    start = false;
    instruct = false;

    triggerHome = false;
    startHome = false;
    instr = 0;
    fscount = 0;
    ffcount = 0;
    tscounter = 0;
    tfcounter = 0;
    hit = false;
    screen = 0;
    timer = millis();
    Fdim[0] = 600;
    Sdim[0] = 400;
    Sdim[1] = 500;
    boxSpeed = 5; 
    backSpeed = 0.8;
    Ex = width+100;
    Ehome = 1280;
    stamina = 100;
    staminaS = 40;
  }
}

void screen2()
{

  if (!ended) {
    end.trigger();
    ended = true;
  }
  suspens.pause();
  fill(#fbae17);
  rect(0, 0, width, height);
  fill(255);
  float y = sin(angle)*20;
  image(fpugb[fframe], 55 + y, 100, fpugb[fframe].width*3, fpugb[fframe].height*3);
  image(home[0], width-500, -360, home[0].width*3, home[0].height*3);
  text("fat pug has gotten away!", width/2 + 100, height/2.3);
  fframe += 1;
  if (fframe == 8)
  {
    fframe = 0;
  }    

  angle += 0.05;
  if (keyPressed && (keyCode == UP || key == 'w'))
  {
    keys2[0] = false;
    start = false;
    hit = false;
    instruct = false;
    instr = 0;

    triggerHome = false;
    startHome = false;
    screen = 0;
    Ehome = 1280;
    fscount = 0;
    ffcount = 0;
    tscounter = 0;
    tfcounter = 0;
    timer = millis();
    Fdim[0] = 600;
    Sdim[0] = 400;
    Sdim[1] = 500;
    boxSpeed = 5; 
    backSpeed = 0.8;
    Ex = width+100;
    stamina = 100;
    staminaS = 40;
  }
}

void beginning() {
  int start = 150;
  float y = sin(angle)*20;
  fill(#fbae17);
  rect(0, 0, width, height);

  fill(#dddddd); //grey
  textFont(pixel50);

  text("fat", width/2-100, start + y);
  text("pug", width/2+125, start - y);

  text("small", width/2-125, start*1.5 + y/2);
  text("pug", width/2+175, start*1.5 - y/2);
  textFont(pixel);
  text("press up to start", width/2, height/1.9 + y/5);
  text("right for instructions", width/2, height/1.7 + y/5);

textFont(pixel50);
  fill(#f7772c);
  text("fat", width/2-100, start - 4 + y);
  text("pug", width/2+125, start - 4 - y);
  
  fill(#f77e5e);
    text("small", width/2-125, start*1.5 - 4 + y/2);
  text("pug", width/2+175, start*1.5 - 4 - y/2);
  textFont(pixel);
  
  frameRate(24);
  image(spugr[sframe], width/14 + y, height/2.1 + y*1.5, spugr[sframe].width*1.5, spugr[sframe].height*1.5);
  image(spugr[sframe], width/2 + y*8, height/3, spugr[sframe].width*3, spugr[sframe].height*3);
  image(spugr[sframe], width/4 + y*5, height/1.5 + y*3, spugr[sframe].width*2, spugr[sframe].height*2);
  image(spugr[sframe], width/5 + y*50, height/1.5 + y*10, spugr[sframe].width*2, spugr[sframe].height*2);
  sframe = sframe + 1;
  if (sframe == 7)
  {
    sframe = 0;
  }
  angle += 0.05;
}

void instruct1() {
  fill(#fbae17);
  rect(0, 0, width, height);
  float y = sin(angle)*20;
  image(spugr[sframe], 50 + y, 50, spugr[sframe].width*1.5, spugr[sframe].height*1.5);
  image(fpugb[fframe], 55 + y, 270, fpugb[fframe].width*1.5, fpugb[fframe].height*1.5);
  image(bone, 330, 625 + y/3, bone.width*1.5, bone.height*1.5);
  image(home[0], width-500, 30+y/4, home[0].width*1.5, home[0].height*1.5);

  fill(#dddddd);
  text("small pug!\nfat pug has just \npushed you off \nthe scooter!\nchase him and \nget back on!!", 330, 75 + y/5);
  text("fat pug!\nrun, run, run! \nmake it home,\nand keep the scooter \nfor yourself!! \n\n*you'll get slower\nif you eat too much!", 330, 325 + y/5);    
  fill(#F7725D); //#BE3305 //#F7772C
  text("small pug!", 330, 73 + y/5);
  text("fat pug!", 330, 323 + y/5);


  text("= food*", 450, 650 + y/3);

  textAlign(LEFT);
  text(">", width-50, height/2);
  text("! = small pug is close", 700, 650 + y/3);
  fill(#0095a3, int(random(-2, 2))*255); //blue
  text("!", 700, 650 + y/3);

  fframe += 1;
  sframe += 1 ;
  if (sframe == 7)
  {
    sframe= 0;
  }
  if (fframe == 8)
  {
    fframe = 0;
  }    

  angle += 0.05;
}

void instruct2() {
  fill(#fbae17);
  rect(0, 0, width, height);
  float y = sin(angle)*20;
  image(spugb, width/2.8 + y/3, 250, spugb.width*1.5, spugb.height*1.5);
  image(fpugb[fframe], width/2.8 + 75 + y/3, 250, fpugb[fframe].width*1.5, fpugb[fframe].height*1.5);

  fill(#dddddd); //grey
  textAlign(CENTER);
  text("if small pug catches up, alternate < and > buttons to", width/2, 75);
  text("and the one who taps most, wins the battle\n\npress up to start!", width/2, 600);

  fill( #0095a3);
  text("\npress up to start!", width/2, 623);
  textAlign(LEFT);
  fill(#dddddd);
  text("...stay on!", 170, height/2);
  text("...shake \nsmall pug off!", 790, height/2);
  textFont(pixel50);

  textAlign(CENTER);
  fill( #0095a3);
  text(tscounter, 270, height/2.4);
  fill(#3dbd5d);
  text(tfcounter, 960, height/2.4);

  textAlign(LEFT);
  fill(#dddddd);
  text("<", 200, height/1.5);
  text(">", 300, height/1.5);
  text("<", 900, height/1.5);
  text(">", 1000, height/1.5);

  if (keys2[1])
  {
    fill( #0095a3);
    text("<", 200, height/1.5);
  } 
  if (keys2[3])
  {
    fill( #0095a3);
    text(">", 300, height/1.5);
  }
  if (keys[2])
  {
    fill(#3dbd5d); //green
    text("<", 900, height/1.5);
  }
  if (keys[3])
  {
    fill(#3dbd5d); //green
    text(">", 1000, height/1.5);
  }
  textFont(pixel);
  fill( #0095a3);
  text("...stay on!", 170, height/2-2);
  fill(#3dbd5d);
  text("...shake \nsmall pug off!", 790, height/2-2);

  if (fframe == 8)
  {
    fframe = 0;
  }

  angle += 0.5;
}

void screens() {
  if (screen == 0)
  {
    screen0();
  }
  if (screen == 1)
  {
    screen1();
  }
  if (screen == 2)
  {
    screen2();
  }
}