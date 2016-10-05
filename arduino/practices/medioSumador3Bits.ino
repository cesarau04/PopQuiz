int ledc=7,
    led3=6,
    led2=5,
    led1=4;

int s1,
    c1,
    s2,
    c2,
    s3,
    c3;

int val_3=13,
    val_2=12,
    val_1=11;

int val_33=10,
    val_22=9,
    val_11=8;


int stateVal_1,
    stateVal_2,
    stateVal_3,
    stateVal_11,
    stateVal_22,
    stateVal_33;

void setup() {
  Serial.begin(9600);
  pinMode(val_1, INPUT);
  pinMode(val_2, INPUT);
  pinMode(val_3, INPUT);
  pinMode(val_11, INPUT);
  pinMode(val_22, INPUT);
  pinMode(val_33, INPUT);
  pinMode(ledc, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led1, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  int stateVal_1 = !digitalRead(val_1);
  int stateVal_2 = !digitalRead(val_2);
  int stateVal_3 = !digitalRead(val_3);

  int stateVal_11 = !digitalRead(val_11);
  int stateVal_22 = !digitalRead(val_22);
  int stateVal_33 = !digitalRead(val_33);
  
  Serial.print(stateVal_3);Serial.print(stateVal_2);Serial.print(stateVal_1);Serial.print(" ");Serial.print(stateVal_33);Serial.print(stateVal_22);Serial.println(stateVal_11);
  halfAdder(stateVal_1, stateVal_11);
  secondAdder(stateVal_2, stateVal_22, c1);
  thirdAdder(stateVal_3, stateVal_33, c2);
  Serial.print(c3);Serial.print("|");Serial.print(s3);Serial.print(s2);Serial.println(s1);
  if(s1==1){
    digitalWrite(led1, HIGH);
  }else{
    digitalWrite(led1, LOW);
  }
  if(s2==1){
    digitalWrite(led2, HIGH);  
  }else{
    digitalWrite(led2, LOW);
  }
  if(s3==1){
    digitalWrite(led3, HIGH);  
  }else{
    digitalWrite(led3, LOW);
  }
  if(c3==1){
   digitalWrite(ledc, HIGH); 
  }else{
    digitalWrite(ledc, LOW);
  }
  
  //delay(2000);
}

void halfAdder(int v1, int v11){
  s1 = v1 ^ v11;
  c1 = v1 & v11;
}

void secondAdder(int v2, int v22, int c1){
  s2 = ((v2 ^ v22) ^ c1);
  c2 = ( (c1&v2) | (c1&v22) | (v2&v22) );
}

void thirdAdder(int v3, int v33, int c2){
  s3 = ((v3 ^ v33) ^ c2);
  c3 = ( (c2&v3) | (c2&v33) | (v3&v33) );
}
