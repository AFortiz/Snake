int num = 1;   //nuemro de huevos comidos
int speed = 1;  //velocidad
int d = 20;   //tamaño huevos
 //PImage img1;

int[] y = new int[250];
int[] x = new int[250];
int huevoy = 100;
int huevox = 100;
 
void setup() {
  size (800, 800); 
  smooth();
  ellipseMode (CENTER);//cambiar el pivot al centro
  x[0] = 20* int (random (1, 5)); // esto posiciona al huevo de forma aletoria en el escenario
  y[0] = 20* int (random (1, 5));
  //img1 = loadImage("http://undich.net/wordpress/wp-content/uploads/2010/07/Intro.jpg");

}

 
void draw() {
  background (20);
  
  /*if (millis() < 8000)//in milliseconds
  {
    image(img1, 0, 0);
  }
   else{*/
  if (x[0]<=0 || x[0]>= width || y[0]<=0 || y[0]>=height) { //dimensiones
    gameover();
  } else if (keyPressed && (key == CODED)) { //a menos que  presiones y es codifica el for de abajo
    for (int i=num-1; i>0; i--) { //este le suma a la posicion en donde este la serpiente
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    if (keyCode == LEFT) {
      x[0] -= speed*d;
    } else if (keyCode == RIGHT) {
      x[0] += speed*d;
    } else if (keyCode == UP) {
      y[0] -= speed*d;
    } else if (keyCode == DOWN) {
      y[0] += speed*d;
    }
  }
   
  if (x[0]==huevox && y[0]==huevoy) { //si se encuentran crea uno
    num ++;// suma 1 mas
    huevox = 20 * int (random(1, 39));//pocision aletoria del huevo
    huevoy = 20 * int (random(1, 29));
    
  }
   
  fill (250, 50, 0);
  //noStroke ();
  for(int i=0; i<num; i++) {
      ellipse (x[i], y[i], d, d); // creando una de las bolas a base de posicionamineto de la matriz i
  }
  fill (250, 232, 131);
  ellipse (huevox, huevoy, d, d); // creando los huevos, desde la variable huevox huevoy
}

 void gameover() {
  fill (240, 40, 40);
  textSize (65);
  textAlign(CENTER);
  text ("Game Over", width/2, height/2);
  fill (255);
  textSize (30);
  text (num, width/2, height/2+100);
}
