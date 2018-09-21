boolean jump = false;
int fscount;
int ffcount;
class SPug {
  float x;
  float y;
  float w;
  float h;
  int frame = 0;

  SPug(float tempX, float tempY, float tempW, float tempH) 
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }

  void display() 
  {
    fill(#fe9f97, 0);
    noStroke();
    rect(Sdim[0], Sdim[1], w, h);
    if (!jump) {
      frame = frame + 1;
      if (frame == 8)
      {
        frame = 0;
      }
    } else if (jump)
    {
      for (int f = 6; f > 7; f++)
      {
        frame = f;
      }      
      jump = false;
    }
    image(spugr[frame], Sdim[0], Sdim[1]);
  }

  void hit()
  {
    if ((Sdim[0] + Sdim[2] > Fdim[0] && Sdim[0] + Sdim[2]  < Fdim[0] + Fdim[2]) && (Sdim[1] + Sdim[3] > Fdim[1]) ) //&&Sdim[1] + Sdim[3] < Fdim[1] + Fdim[3]
      {
      hit = true;
    fill(255);
    text(str(int(((timer+delayTime)-millis())/1000)+1), width/2, height/2);
    if (trigger == false)
    {
      timer = millis();
      startTiming = true;
      delayTime = 2000; //8 SECS TO COMPLETE
      trigger = true;
    }
  } else
{
  hit = false;
}
}

void hover() {
  float x = dist((Sdim[0] + Sdim[2]), (Sdim[1] + Sdim[3]), Ex, Ey+Ed/2);
  if (x < Ed/2 + 15)
  {
    eat.trigger();
  }
  if (x < Ed/2)
  {
    if (staminaS <= 75)
    {
      staminaS += 15;
    }
    Ex = -50;
  }
}

void move() {
  if (!hit)
  {
    if (staminaS > 1)
    {
      if (Sdim[0] < 1280-spugr[0].width) {
        if (keys2[3])
        {
          Sdim[0] = Sdim[0] + 6 * 0.8;
        }
        if (keys2[0] && !jump)
        {
          jump = true;
          jump2();
        }
      }
      if (Sdim[0] > 0) {
        if (keys2[1])
        {
          Sdim[0] = Sdim[0] - 4;
        }

        if (keys2[2])
        {
          //for (float i = 0; i < 4; i = i + 0.3)
          //{
          //  Sdim[1] = Sdim[1] + i;
          //}
        }


        if (!(keys2[1] || keys2[2] || jump))//|| keys2[3]))
        {
          if (staminaS < 30) {
            staminaS += 0.05;
          }
          float x = Sdim[0] + sin(-sine[0]) * 5;
          if (sine[0] <= 2*PI)
          {
            sine[0] += 0.05;
          } else {
            sine[0] = 0;
          }
          Sdim[0] = x;
        }
      }
      if ((jump || keys2[3]) && staminaS > 0)
      {
        staminaS -= 0.1;
      }
    }

    //if (Sdim[0]+Sdim[2]+30 < 0 || Fdim[0]> width + 100) //if its out of bounds
    //{
    //  screen = 2;
    //}
  }

  if (hit)
  { 
    suspens.play();
    Sdim[1] = Fdim[1]+10;
    if ((millis() > timer + delayTime) && (startTiming == true)) {
      if (ffcount >= fscount) //releases
      {
        suspens.pause();
        println("nothit");
        jump2();
        if (Sdim[1] == 500)
        {
          jump = false;
        }
                Sdim[0] -= 30;
      }
    }
    if (!hit) // resets counter
    {
      suspens.pause();
      
        fscount = 0;
        ffcount = 0;
    }
  }
  println(fscount);
  println(ffcount);
}


}