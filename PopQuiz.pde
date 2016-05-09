import org.firmata.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

int b2 = 2;int b3= 3;int b4= 4;int b5= 5;
int numRonda = 1;
int y; int addingC0 = 0; int addingC1 = 0; int addingC2 = 0; 

String manzana = "¿Cuál es una manzana?", elefante = "¿Cuál es el elefante?", pc = "¿Cuál es la computadora?", suma = "¿Cuánto es 8+8-5"; 
PImage ronda1Obj1, ronda1Obj2, ronda1Obj3, ronda1Obj4;
PImage ronda2Obj1, ronda2Obj2, ronda2Obj3, ronda2Obj4;
PImage ronda3Obj1, ronda3Obj2, ronda3Obj3, ronda3Obj4;
PImage ronda4Obj1, ronda4Obj2, ronda4Obj3, ronda4Obj4;
PImage C0,C1,C2,crowd;

String header = manzana;
String[] entrada = new String[4];
String[] sel = {"1","1","0","1"};
String[] sel2 = {"1","0","1","1"};
String[] sel3 = {"0","1","1","1"};
String[] sel4 = {"1","1","1","0"};

void setup(){
  println(Arduino.list());
  size(1280, 720);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(b2, Arduino.INPUT);
  arduino.pinMode(b3, Arduino.INPUT);
  arduino.pinMode(b4, Arduino.INPUT);
  arduino.pinMode(b5, Arduino.INPUT);
  
  ronda1Obj1 = loadImage("C:/Users/cesar/Desktop/ronda1/obj1.png"); 
  ronda1Obj2 = loadImage("C:/Users/cesar/Desktop/ronda1/obj2.png"); 
  ronda1Obj3 = loadImage("C:/Users/cesar/Desktop/ronda1/obj3.png");
  ronda1Obj4 = loadImage("C:/Users/cesar/Desktop/ronda1/obj4.png");
  ronda2Obj1 = loadImage("C:/Users/cesar/Desktop/ronda2/obj1.png"); 
  ronda2Obj2 = loadImage("C:/Users/cesar/Desktop/ronda2/obj2.png"); 
  ronda2Obj3 = loadImage("C:/Users/cesar/Desktop/ronda2/obj3.png");
  ronda2Obj4 = loadImage("C:/Users/cesar/Desktop/ronda2/obj4.png");
  ronda3Obj1 = loadImage("C:/Users/cesar/Desktop/ronda3/obj1.png"); 
  ronda3Obj2 = loadImage("C:/Users/cesar/Desktop/ronda3/obj2.png"); 
  ronda3Obj3 = loadImage("C:/Users/cesar/Desktop/ronda3/obj3.png");
  ronda3Obj4 = loadImage("C:/Users/cesar/Desktop/ronda3/obj4.png");
  ronda4Obj1 = loadImage("C:/Users/cesar/Desktop/ronda4/obj1.png"); 
  ronda4Obj2 = loadImage("C:/Users/cesar/Desktop/ronda4/obj2.png"); 
  ronda4Obj3 = loadImage("C:/Users/cesar/Desktop/ronda4/obj3.png");
  ronda4Obj4 = loadImage("C:/Users/cesar/Desktop/ronda4/obj4.png");
  
  C0 = loadImage("C:/Users/cesar/Desktop/C0.png"); //CORREDOR 0
  C1 = loadImage("C:/Users/cesar/Desktop/C1.png"); //CORREDOR 1
  C2 = loadImage("C:/Users/cesar/Desktop/C2.png"); //CORREDOR 2
  crowd = loadImage("C:/Users/cesar/Desktop/crowd.png"); //CROWD
}

void draw(){
  background(189, 139, 45);
  
  textSize(32);
  fill(255,255,255);
  text(header, 440, 60);
  
  fill(255,240,121);
  quad(200,110,486,110,486,396,200,396);
  
  fill(188,190,255);
  quad(200,416,486,416,486,702,200,702);
  
  fill(255,159,134);
  quad(774,110,1060,110,1060,396,774,396);
  
  fill(31,255,78);
  quad(774, 416, 1060, 416, 1060, 702, 774, 702);

  image(ronda1Obj1, 200, 110);
  image(ronda1Obj2, 200, 416);
  image(ronda1Obj3, 774, 110);
  image(ronda1Obj4, 774, 416);

  int buttonState2 = arduino.digitalRead(b2);
  String state2 = str(buttonState2);
  entrada[0]=state2;
  int buttonState3 = arduino.digitalRead(b3);
  String state3 = str(buttonState3);
  entrada[1]=state3;
  int buttonState4 = arduino.digitalRead(b4);
  String state4 = str(buttonState4);
  entrada[2]=state4;
  int buttonState5 = arduino.digitalRead(b5);
  String state5 = str(buttonState5);
  entrada[3]=state5;
  
  String joinEntrada = join(entrada, "");
  String option = join(sel, "");
  String option2 = join(sel2, "");
  String option3 = join(sel3, "");
  String option4 = join(sel4, "");
  
  x
  println(joinEntrada);
  println(option);
  
  actualRound(joinEntrada, option, option2, option3, option4);
  /*if(joinEntrada.equals(option1)){
    header=elefante;
    ronda1Obj1=ronda2Obj1;
    ronda1Obj2=ronda2Obj2;
    ronda1Obj3=ronda2Obj3;
    ronda1Obj4=ronda2Obj4;
  }*/
  
  if(numRonda==5){
    header = "¡Felicidades GANASTE!";
  }

}

void actualRound(String a, String o, String o2, String o3, String o4){
  if(a.equals(o) && numRonda==1){
    header=elefante;
    ronda1Obj1=ronda2Obj1;
    ronda1Obj2=ronda2Obj2;
    ronda1Obj3=ronda2Obj3;
    ronda1Obj4=ronda2Obj4;
    numRonda++;
  }
  if(a.equals(o2) && numRonda==2){
    header=pc;
    ronda1Obj1=ronda3Obj1;
    ronda1Obj2=ronda3Obj2;
    ronda1Obj3=ronda3Obj3;
    ronda1Obj4=ronda3Obj4;
    numRonda++;
  }
  if(a.equals(o3) && numRonda==3){
    header=suma;
    ronda1Obj1=ronda4Obj1;
    ronda1Obj2=ronda4Obj2;
    ronda1Obj3=ronda4Obj3;
    ronda1Obj4=ronda4Obj4;
    numRonda++;
  }
  if(a.equals(o4) && numRonda==4){
    header=manzana;
    ronda1Obj1=ronda1Obj1;
    ronda1Obj2=ronda1Obj2;
    ronda1Obj3=ronda1Obj3;
    ronda1Obj4=ronda1Obj4;
    numRonda++;
  }
}

