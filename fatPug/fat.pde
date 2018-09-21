float boxSpeed = 5; 
float backSpeed = 0.8;
boolean jumpf = false;
class FPug {
  float x;
  float y;
  float w;
  float h;
  int framef = 0;

  FPug(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }

  void hover() {
    float x = dist((Fdim[0] + Fdim[2]), (Fdim[1] + Fdim[3]), Ex, Ey+Ed/2);
    if (x < Ed/2 + 15)
    {
      eat.trigger();
    }
    if (x < Ed/2)
    {   
      if (stamina <= 75)
      {
        stamina += 15;
        if (boxSpeed > 0){
        boxSpeed -= 2;
        }
        backSpeed += 1.5;
      }
      Ex = -50;
    }
  }

  void display() {
    fill(#fe9f97, 0);
    noStroke();
    rect(Fdim[0], Fdim[1], w, h);
    image(fpugb[framef], Fdim[0], Fdim[1]);

    framef += 1;
    if (framef == 8)
    {
      framef = 0;
    }

    float pugs = dist(Sdim[0] + Sdim[2], Sdim[1] + Sdim[3], Fdim[0], Fdim[1]);
    println(pugs); 
    if (pugs < 230 && !hit)
    {
      if (!barking) {
        barking = true;
        bark.trigger();
      }
      fill(#0095a3, int(random(-2, 2))*255);
      textFont(pixel);
      text("!", Fdim[0]+Fdim[2], height/1.6);
    } else if (pugs > 180)
    {
      barking = false;
    }
  }

  void move()
  {
    if (stamina > 0 && !hit) {
      if (keys[0] && !jumpf)
      { 
        jump();
      }
      if (Fdim[0] < 1280-fpugb[0].width){
              if (keys[3])
      {
        Fdim[0] = Fdim[0] + boxSpeed * 0.6;
      }
      }
      if(Fdim[0] > 0)
      if (keys[1])
      {
        //for (float i = 0; i < 4; i = i + 0.3)
        //{
        //  Fdim[1] = Fdim[1] + i;
        //}
      }

      if (keys[2])
      {
        Fdim[0] = Fdim[0] - boxSpeed;
      }
      if ((jumpf || keys[3]) && stamina > 0)
      {
        stamina -= 0.25;
      }
    }

    if (stamina < 1 && !hit)
    {
      Fdim[0] = Fdim[0] - backSpeed;
    }

    if (!( keys[1] || keys[2] || keys[3]) && !hit)
    {
      Fdim[0] = Fdim[0] - backSpeed;
      if (stamina < 100)
      {
        stamina++;
      }
    }
    
  }



  void offScreen()
  {
    if (Fdim[0]+Fdim[2] < 0)
    {
      backSpeed = 0;
    } else
    {
      backSpeed = 0.8;
    }
  }
}