
/**
  * @author Cesar Augusto, Manuel Salazar
  * @version 1.0.0
  *
  * Este programa es capaz de cambiar su interfaz gráfica dependiendo de las variables que se cambien de
  * manera física en el arduino.
  *
  * El arduino debe pre-cargar el puerto serial a una velocidad de 57600 para poder ser compatible con
  * este programa.
  *
  * Realizado para resolver el problema de la clase de Organización Computacional a 26 de noviembre de 2016.
*/
import processing.serial.*;
import cc.arduino.*;

//instace of arduino
Arduino arduino; 
//each dip switch/button should be coneected to this ports in arduino.
int in1 = 13;
int in2 = 11;
int in3 = 9;

//strings we´re going to use in the cases
String word1 = "Hola";
String word2 = "Practica 8";
String word3 = "Saludos";
String word4 = "Error";


void setup() {
  //create object arduino to use
  arduino = new Arduino(this, "COM3", 57600);
  
  //default canvas
  background(35,35,35);
  size(900, 900);
  
  fill(255,255,255);
  rect(50,50,800,450);
  rect(50,550, 800, 250);
  
  //prepare to receive data
  arduino.pinMode(in1, Arduino.INPUT);
  arduino.pinMode(in2, Arduino.INPUT);
  arduino.pinMode(in3, Arduino.INPUT);
  
}

void draw() {

  /**
    * Receiving data and saving it in an array to change that array to string easily
    * Can be overwritten for other solutions
  */
  int[] numbers = {arduino.digitalRead(in1), arduino.digitalRead(in2), arduino.digitalRead(in3)}; 
  String joinNumbers = join(nf(numbers, 0), "");
  println(joinNumbers);
  
  
  //check each state and redraw if necesarry
  if(joinNumbers.equals("100")){
    fill(255,255,255);
    rect(50,50,800,450);
    rect(50,550, 800, 250);
    
    fill(255,0,0);
    ellipse(400,250,220,220);
    textSize(36);
    fill(0,0,0);
    text(word1, 350,650);
  }else if(joinNumbers.equals("010")){
    fill(255,255,255);
    rect(50,50,800,450);
    rect(50,550, 800, 250);
    
    fill(0,0,255);
    rect(350, 100, 255, 255);
    textSize(36);
    fill(0,0,0);
    text(word2, 350,650);
  }else if(joinNumbers.equals("001")){
    fill(255,255,255);
    rect(50,50,800,450);
    rect(50,550, 800, 250);
    
    fill(0,255,0);
    triangle(450, 100, 150, 350, 750, 350);
    textSize(36);
    fill(0,0,0);
    text(word3, 350,650);
  }else if(joinNumbers.equals("000")){
    background(35,35,35);
    fill(255,255,255);

    rect(50,50,800,450);
    rect(50,550, 800, 250);
  }else{
    background(35,35,35);
    size(900, 900);
  
    fill(0,0,0);
    rect(50,50,800,450);
    fill(255,255,255);
    rect(50,550, 800, 250);
    fill(0,0,0);
    text(word4, 350,650);
  } 
  
  //casual delay
  delay(50);
}
