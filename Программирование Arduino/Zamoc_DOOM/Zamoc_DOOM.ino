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

// Три разные карты
String adminUID = "1D 89 45 50 01 00 03";  // DOOM металл
String userUID = "B3 64 2D 56";             // Простой вход
String deniedUID = "C2 94 0E 06";           // Запрет

// Для неблокирующего управления
unsigned long doorOpenTime = 0;
unsigned long melodyStartTime = 0;
unsigned long noteStartTime = 0;
bool doorIsOpen = false;
bool melodyActive = false;
bool doomMode = false;  // Флаг DOOM режима
int currentNote = 0;

// Ноты
#define NOTE_E2  82
#define NOTE_E3  165
#define NOTE_E4  330
#define NOTE_E5  659
#define NOTE_A2  110
#define NOTE_A3  220
#define NOTE_A4  440
#define NOTE_B2  123
#define NOTE_B3  247
#define NOTE_B4  494
#define NOTE_C3  131
#define NOTE_C4  262
#define NOTE_C5  523
#define NOTE_D3  147
#define NOTE_D4  294
#define NOTE_D5  587
#define NOTE_F3  175
#define NOTE_F4  349
#define NOTE_G3  196
#define NOTE_G4  392
#define NOTE_GS3 208
#define NOTE_GS4 415
#define REST     0

// DOOM E1M1 "At Doom's Gate" - главный рифф
int melody[] = {
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_E2, NOTE_E2, NOTE_A2, NOTE_B2,
  
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_E2, NOTE_E2, NOTE_A2, NOTE_B2,
  
  NOTE_E3, NOTE_E3, NOTE_E4, NOTE_E3, NOTE_E3, NOTE_D4, NOTE_E3, NOTE_E3,
  NOTE_C4, NOTE_E3, NOTE_E3, NOTE_B3, NOTE_E3, NOTE_E3, NOTE_A3, NOTE_B3,
  
  NOTE_E2, NOTE_E2, NOTE_E3, NOTE_E2, NOTE_E2, NOTE_D3, NOTE_E2, NOTE_E2,
  NOTE_C3, NOTE_E2, NOTE_E2, NOTE_B2, NOTE_C3, NOTE_D3, NOTE_E3, REST
};

int noteDurations[] = {
  150, 150, 150, 150, 150, 150, 150, 150,
  150, 150, 150, 150, 150, 150, 150, 150,
  
  150, 150, 150, 150, 150, 150, 150, 150,
  150, 150, 150, 150, 150, 150, 150, 150,
  
  150, 150, 150, 150, 150, 150, 150, 150,
  150, 150, 150, 150, 150, 150, 150, 150,
  
  150, 150, 150, 150, 150, 150, 150, 150,
  150, 150, 150, 150, 150, 150, 300, 200
};

int melodyLength = 64;

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
  // Проверка таймера двери (только для обычного режима)
  if (doorIsOpen && !doomMode && millis() - doorOpenTime >= 3000) {
    doorServo.write(CLOSE_ANGLE);
    doorIsOpen = false;
    Serial.println("Дверь закрыта");
  }

  // Проигрывание мелодии
  if (melodyActive) {
    if (currentNote >= melodyLength) {
      noTone(BUZZER_PIN);
      melodyActive = false;
      currentNote = 0;
      
      // Если это DOOM режим - закрыть дверь после окончания музыки
      if (doomMode) {
        doorServo.write(CLOSE_ANGLE);
        doorIsOpen = false;
        doomMode = false;
        Serial.println("🔥 DOOM MODE ЗАВЕРШЁН - Дверь закрыта 🔥");
      }
    } else {
      if (millis() - noteStartTime >= noteDurations[currentNote]) {
        currentNote++;
        if (currentNote < melodyLength) {
          if (melody[currentNote] == REST) {
            noTone(BUZZER_PIN);
          } else {
            tone(BUZZER_PIN, melody[currentNote]);
          }
          noteStartTime = millis();
        }
      }
    }
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

  // Проверка какая карта
  if (content == adminUID) {
    // Админ карта - DOOM + открытие
    Serial.println("🔥 ADMIN ACCESS - DOOM MODE! 🔥");
    Serial.println("💀 RIP AND TEAR! 💀");
    openDoorWithDoom();
  } 
  else if (content == userUID) {
    // Обычная карта - просто вход
    Serial.println("✅ Доступ разрешён");
    openDoorSimple();
  } 
  else if (content == deniedUID) {
    // Запрещённая карта - только звук отказа
    Serial.println("❌ ДОСТУП ЗАПРЕЩЁН ❌");
    Serial.println("⛔ Эта карта заблокирована!");
    deniedBeep();
  }
  else {
    // Неизвестная карта
    Serial.println("❓ Неизвестная карта");
    unknownBeep();
  }

  mfrc522.PICC_HaltA();
  mfrc522.PCD_StopCrypto1();
}

// ADMIN - открытие с DOOM музыкой
void openDoorWithDoom() {
  doorServo.write(OPEN_ANGLE);
  doorOpenTime = millis();
  doorIsOpen = true;
  doomMode = true;  // Включаем DOOM режим
  
  // Запуск DOOM музыки
  melodyActive = true;
  melodyStartTime = millis();
  noteStartTime = millis();
  currentNote = 0;
  
  if (melody[0] != REST) {
    tone(BUZZER_PIN, melody[0]);
  }
}

// USER - простой вход
void openDoorSimple() {
  doorServo.write(OPEN_ANGLE);
  doorOpenTime = millis();
  doorIsOpen = true;
  doomMode = false;  // Обычный режим
  
  // Простой приятный звук
  tone(BUZZER_PIN, 1000, 100);
  delay(110);
  tone(BUZZER_PIN, 1200, 150);
}

// DENIED - карта заблокирована
void deniedBeep() {
  // Три резких низких звука
  for (int i = 0; i < 3; i++) {
    tone(BUZZER_PIN, 200, 200);
    delay(250);
    noTone(BUZZER_PIN);
    delay(100);
  }
}

// UNKNOWN - неизвестная карта
void unknownBeep() {
  // Короткий писк вопроса
  tone(BUZZER_PIN, 800, 100);
  delay(150);
  tone(BUZZER_PIN, 600, 200);
}