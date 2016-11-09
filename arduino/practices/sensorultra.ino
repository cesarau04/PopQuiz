long distancia;
long tiempo;

int rojo = 13;
int ama = 11;
int verde = 9;

int sw = 2;
int val;

bool state = false;

int echo = 6;
int rep = 7;

void setup(){
  Serial.begin(9600);
  pinMode(rep, OUTPUT);
  pinMode(echo, INPUT); 
  pinMode(verde, OUTPUT);
  pinMode(ama, OUTPUT);
  pinMode(rojo, OUTPUT);
  pinMode(sw, INPUT);
}

void loop(){
  val = digitalRead(sw);  
  Serial.println(sw);
  if (val == HIGH)       
    state=true; 
    
  if(state){
    digitalWrite(rep,LOW);
    delayMicroseconds(5);
    digitalWrite(rep, HIGH);
    delayMicroseconds(10);
    tiempo=pulseIn(echo, HIGH);
    distancia= int(0.017*tiempo); 
  
    if(distancia<15){
      digitalWrite(verde,HIGH);
      digitalWrite(ama,LOW);
      digitalWrite(rojo,LOW);
    }else if(distancia <30){
      digitalWrite(ama,HIGH);
      digitalWrite(verde,LOW);
      digitalWrite(rojo,LOW);
    }else{
      digitalWrite(rojo,HIGH);
      digitalWrite(verde,LOW);
      digitalWrite(ama,LOW);
    }
    Serial.println("Distancia ");
    Serial.println(distancia);
    Serial.println(" cm");
  }
  delay(1000);
}
