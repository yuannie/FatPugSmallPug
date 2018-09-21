boolean[] keys = new boolean[6];
//keys[6] = {UP, DOWN, LEFT RIGHT);

boolean[] keys2 = new boolean[6];
//keys2[6] = {W A S D 0 -)

void keyPressed()
{ 

  if (key == 'w' || key == 'W')
  {
    start = true;
    sjump.trigger();
    keys2[0] = true;
  }

  if (key == 'a' || key == 'A')
  {
    if (instr > 0)
    {
      tscounter += 1;
    }
    if (hit)
    {
        if (Sdim[0] < 1280-spugr[0].width &&  Sdim[0] > 0 && Fdim[0] < 1280-fpugb[0].width &&  Fdim[0] > 0){
        Sdim[0] -= 2;
        Fdim[0] -= 2;
        }
    }
    keys2[1] = true;
  }

  if (key == 's' || key == 'S')
  {
    keys2[2] = true;
  }

  if (key == 'd' || key == 'D')
  {
    if (!start) {
      instruct = true;
    }
    if (instruct)
    {
      instr += 1;
    }
    if (instr > 0)
    {
      tscounter += 1;
    }
    if (hit)
    {
      fscount += 1;
        if (Sdim[0] < 1280-spugr[0].width &&  Sdim[0] > 0 && Fdim[0] < 1280-fpugb[0].width &&  Fdim[0] > 0){
        Sdim[0] -= 2;
        Fdim[0] -= 2;
        }
    }
    keys2[3] = true;
  }

  if (key == '0')
  {
    if (hit && screen == 0)
    { 
      fill(#3dbd5d);
      text("shake!", width/2, height/1.75);
      count++;
      Sdim[0] -= 2;
      Fdim[0] -= 2;
    }
    keys2[4] = true;
  }

  if (key == '-')
  {
    if (hit && screen == 0)
    {
      fill(#fe9f97);
      text("shake!", width/2, height/1.75);
      count++;
      Sdim[0] += 2;
      Fdim[0] += 2;
    }
    keys2[5] = true;
  }

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      start = true;
      fjump.trigger();
      keys[0] = true;
    }
    if (keyCode == DOWN)
    {
      keys[1] = true;
    }
    if (keyCode == LEFT)
    {
      if (instr > 0)
      {
        tfcounter += 1;
      }
      if (hit)
      {
        ffcount += 1;
        if (Sdim[0] < 1280-spugr[0].width &&  Sdim[0] > 0 && Fdim[0] < 1280-fpugb[0].width &&  Fdim[0] > 0){
        Sdim[0] += 2;
        Fdim[0] += 2;
        }
      }
      keys[2] = true;
    }
    if (keyCode == RIGHT)
    {
      if (instruct)
      {
        instr += 1;
      }    
      if (!start) {
        instruct = true;
      }
      keys[3] = true;
    }
    if (instr > 0)
    {
      tfcounter += 1;
    }
    if (hit)
    {
      ffcount += 1;
        if (Sdim[0] < 1280-spugr[0].width &&  Sdim[0] > 0 && Fdim[0] < 1280-fpugb[0].width &&  Fdim[0] > 0){
        Sdim[0] += 2;
        Fdim[0] += 2;
        }
    }
    if (key == '1')
    {
      keys[4] = true;
    }
    if (key == '2')
    {
      keys[5] = true;
    }
  }
}

void keyReleased()
{
  sine[0] = 0;
  if (key == 'w' || key == 'W')
  {
    sjump.stop();
    //keys[0] = false;
  }

  if (key == 'a' || key == 'A')
  {
    keys2[1] = false;
  }

  if (key == 's' || key == 'S')
  {
    keys2[2] = false;
  }

  if (key == 'd' || key == 'D')
  {
    instruct = true;
    keys2[3] = false;
  }

  if (key == '0')
  {
    keys2[4] = false;
  }

  if (key == '-')
  {
    keys2[5] = false;
  }

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      fjump.stop();
      sinef[0] = 0;    
      //keys2[0] = false;
    }
    if (keyCode == DOWN)
    {
      keys[1] = false;
    }
    if (keyCode == LEFT)
    {
      keys[2] = false;
    }
    if (keyCode == RIGHT)
    {
      keys[3] = false;
    }
    if (key == '1')
    {
      keys[4] = false;
    }
    if (key == '2')
    {
      keys[5] = false;
    }
  }
}