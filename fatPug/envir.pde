int gx = 1300;
int gx1 = 1500;
int gx2 = 1700;
int gSpeed = 5;

int tx = 1300;
int tx1 = 1600;
int tx2 = 1800;
int tx3 = 2000;
int tSpeed = 10;

int bx = 0;

void trees() //trees + hill
{
  image(hill, bx, ground - hill.height);
  image(hill, bx+hill.width, ground - hill.height);
  
  image(hill, bx-hill.width, ground - hill.height);
  {
  if (bx + hill.width < 0)
  {
    bx = 1300;
  }
  if (bx < 1301)
  {
    bx -= gSpeed;
  }
  }
  
  image(trees[2], tx2, ground - trees[2].height);
  if (tx2 + trees[2].width < 0) 
  {
    tx2 = 1800;
  }
  if (tx2 < 1801)
  {
    tx2 -= tSpeed/1.5;
  }

  image(trees[3], tx3, ground - trees[3].height);
  if (tx3 + trees[3].width < 0) 
  {
    tx3 = 2000;
  }
  if (tx3 < 2001)
  {
    tx3 -= tSpeed/1.5;
  }
  image(trees[1], tx1, ground - trees[1].height);
  if (tx1 + trees[1].width < 0) 
  {
    tx1 = 1600;
  }
  if (tx1 < 1601)
  {
    tx1 -= tSpeed;
  }
}
void enviro() // grass + 1 tree
{
    image(trees[0], tx, ground - trees[0].height);
  if (tx + trees[0].width < 0) 
  {
    tx = 1300;
  }
  if (tx < 1301)
  {
    tx -= tSpeed;
  }
  
  image(grass[0], gx, ground - grass[0].height);
  if (gx + grass[0].width < 0) 
  {
    gx = 1300;
  }
  if (gx < 1301)
  {
    gx -= gSpeed;
  }

  image(grass[1], gx1, ground - grass[1].height);
  if (gx1 + grass[1].width < 0) 
  {
    gx1 = 1500;
  }
  if (gx1 < 1501)
  {
    gx1 -= gSpeed;
  }

  image(grass[2], gx2, ground - grass[2].height);
  if (gx2 + grass[2].width < 0) 
  {
    gx2 = 1700;
  }
  if (gx2 < 1701)
  {
    gx2 -= gSpeed+ 4;
  }
}

class Grass {
  int gx = 1300;

  int gSpeed = 5;
  PImage img;
  int xoffset;
  int gxOff;

  Grass(PImage tempimg, int tempxoffset) {
    img = tempimg;
    xoffset = tempxoffset;
    gxOff = gx + tempxoffset;
  }

  void display()
  {
    image(img, gxOff, ground - img.height);
  }

  void loop()
  {
    //if (gxOff + img.width < 0)
    {
      //gxOf//f = 1300;
    }
    //if (gx//Off < 1600)
    {
      //gxOf//f -= gSpeed;
    }
  }
} 

void enviro2() // implement later with a grass class
{
  Grass g1;
  g1 = new Grass(grass[0], 0);
  g1.display();
  g1.loop();
}


void enviro2(PImage img, int offset, int speed)
{
  int ex = gx - offset;
  image(img, ex, ground - grass[0].height);
  if (ex + img.width < 0) 
  {
    ex = 1300;
  }
  if (ex < 1301 + img.width)
  {
    ex -= speed;
  }
}