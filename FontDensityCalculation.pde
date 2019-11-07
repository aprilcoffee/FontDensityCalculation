char[] index = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 
  'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 
  'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
  'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 
  'W', 'X', 'Y', 'Z', '~', '!', '@', '#', '$', '%', '^', '&', 
  '*', '(', ')', '-', '+', ' '};


//Already finished Calculation, feel free to try by your self
float[] index_density = {4.595, 5.98, 3.475, 5.964, 4.46, 3.819, 6.538, 5.446, 2.25, 
3.421, 5.131, 2.788, 7.01, 4.547, 4.703, 5.808, 5.809, 2.502, 3.456, 3.181,
4.626, 3.487, 6.27, 3.945, 4.296, 4.2, 6.145, 7.078, 5.328, 7.283, 5.367, 
4.456, 6.068, 6.606, 2.782, 3.793, 5.865, 3.744, 9.116, 7.354, 7.154, 5.516,
8.077, 6.755, 4.99, 4.363, 5.898, 4.961, 9.212, 5.624, 4.408, 5.674, 1.737,
2.119, 7.047, 5.383, 5.19, 6.321, 2.727, 7.452, 1.506, 2.689, 2.71, 1.173,
2.911, 0.0};


void setup() {
  size(800, 800, P3D);

  int index_length = index.length;
  index_density = new float[index_length];

  for (int s=0; s<index_length; s++) {
    calculate(s);
  }
  for (int i=0; i<index_length-1; i++) {
    for (int j=i+1; j<index_length; j++) {
      if (index_density[i]>index_density[j]) {
        float tempF = index_density[i];
        index_density[i] = index_density[j];
        index_density[j] = tempF;

        char tempC = index[i];
        index[i] = index[j];
        index[j] = tempC;
      }
    }
  }
  
}
void draw() {
  background(255);
  fill(0);
  for (int s=0; s<index.length; s++) {
    textSize(30);
    text(index[s],(s/15)*150+20,(s%15)*50+50);
    text(index_density[s],(s/15)*150+40,(s%15)*50+50);
    noFill();
    stroke(0);
    rectMode(CENTER);
    rect((s/15)*150+80,(s%15)*50+40,150,50);
  }
  saveFrame("Table.jpg");
}
void calculate(int _num) {
  background(255); 
  textAlign(CENTER, CENTER); 
  textSize(500); 
  fill(0); 
  int total = 0; //totalAmount
  text(index[_num], width/2, height/2); 

  for (int s=0; s<1000000; s++) {
    textAlign(LEFT, CENTER); 
    int getX = floor(random(width)); 
    int getY = floor(random(height)); 
    if (get(getX, getY) == color(0)) {
      total++; 

      //colorMark
      //set(getX, getY, color(255, 0, 0));
    } else {
      //colorMark
      //set(getX, getY, color(0, 0, 255));
    }
  }

  float density = float(nfc((float(total)/float(1000000))*100, 3));

  index_density[_num] = density;
  println(index[_num],density);

  //colorMark
  //textSize(40); 
  //fill(0); 
  //text("Density:", 10, 20); 
  //text(density, 150, 20);
}
