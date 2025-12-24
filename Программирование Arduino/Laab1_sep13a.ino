#include <SPI.h>
#include <MFRC522.h>
#include <Servo.h>

#define SS_PIN 10
#define RST_PIN 9

MFRC522 mfrc522(SS_PIN, RST_PIN);
Servo doorServo;

const int SERVO_PIN   = 7;
const int OPEN_ANGLE  = 0;
const int CLOSE_ANGLE = 90;
const int BUZZER_PIN  = 6;

String authorizedUID = "1D 89 45 50 01 00 03";

// Для неблокирующего управления
unsigned long doorOpenTime = 0;
unsigned long beepStartTime = 0;
bool doorIsOpen = false;
bool beepActive = false;

void setup() {
  Serial.begin(9600);
  SPI.begin();
  mfrc522.PCD_Init();

  doorServo.attach(SERVO_PIN);
  doorServo.write(CLOSE_ANGLE);

  pinMode(BUZZER_PIN, OUTPUT);
  noTone(BUZZER_PIN);

  Serial.println("Поднесите RFID‑карту к считывателю");
}

void loop() {
  // Проверка таймера двери
  if (doorIsOpen && millis() - doorOpenTime >= 3000) {
    doorServo.write(CLOSE_ANGLE);
    doorIsOpen = false;
    Serial.println("Дверь закрыта");
  }

  // Проверка таймера буззера
  if (beepActive && millis() - beepStartTime >= 2000) {
    noTone(BUZZER_PIN);
    beepActive = false;
  }

  // Чтение карты
  if (!mfrc522.PICC_IsNewCardPresent()) return;
  if (!mfrc522.PICC_ReadCardSerial())   return;

  String content = "";
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    if (mfrc522.uid.uidByte[i] < 0x10) content += "0";
    content += String(mfrc522.uid.uidByte[i], HEX);
    if (i != mfrc522.uid.size - 1) content += " ";
  }
  content.toUpperCase();

  Serial.print("UID карты: ");
  Serial.println(content);

  if (content == authorizedUID) {
    Serial.println("Доступ разрешён, дверь открыта");
    openDoor();
  } else {
    Serial.println("Доступ запрещён");
    wrongBeep();
  }

  mfrc522.PICC_HaltA();
  mfrc522.PCD_StopCrypto1();
}

void openDoor() {
  doorServo.write(OPEN_ANGLE);
  doorOpenTime = millis();
  doorIsOpen = true;
  
  // Успешный звук (короткий писк)
  tone(BUZZER_PIN, 2000, 200);
}

void wrongBeep() {
  tone(BUZZER_PIN, 1000);
  beepStartTime = millis();
  beepActive = true;
}