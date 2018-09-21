void jump() {
  float y = 420 + sin(-sinef[0]) * sinef[1]; // Fdim[2] = GROUND
  if (sinef[0] < PI)
  {
    sinef[0] += sinef[2];
  }   
    Fdim[1] = y;
  if (sinef[0] > PI)
  {
    Fdim[1] = 420;
    jumpf = false;
  }
}

void jump2() {
  float y = 500  + sin(-sine[0]) * 80; // Sdim[2] = GROUND
  if (sine[0] < PI)
  {
      sine[0] += 0.1;
  }
  Sdim[1] = y;
  if (sine[0] > PI)
  {
    Sdim[1] = 500;
    jump = false;
    //keys2[0] = false;
  }
  
  
}

void randomFood() {
  int yesFood = int(random(-10, 10));
  if (yesFood == 1 && Ex < 0)
  {
    Ex = 1300;
  }
  if (Ex < 1301)
  {
    Ex -= 2;
  }
}

void home(){
  if(millis() > hometime + 30000){ //wait for 30 secs before home
  if (Ehome > 0-home[1].width)
  {
    if (!hit){
    Ehome -= 2;
    }
    if ((Fdim[0] > Ehome + home[1].width/4))
    {
      screen = 2;
    }
  }
  }
}