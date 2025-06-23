# Autodarts Pi5 Kiosk

Dieses Projekt richtet sich an alle, die einen **Raspberry Pi 5** als abgesichertes **Kiosk-System** für Autodarts verwenden möchten.

Es konfiguriert ein vollautomatisches Setup mit:

- ✅ Chromium im Vollbild-Modus
- ✅ Automatischem Webseitenaufruf (`https://play.autodarts.io`)
- ✅ Read-Only-Dateisystem (`overlayroot`)
- ✅ Zwei Desktop-Buttons zum Umschalten zwischen Read-Only (🔒) und Schreibmodus (📝)

---

## ⚙️ Voraussetzungen

- Raspberry Pi OS 64bit (mit Desktop, z. B. Bookworm)
- Raspberry Pi 5 8GB
- Internetverbindung
- Maus, Tastatur oder SSH-Zugriff zur Einrichtung

---

## 🚀 Installation

1. Repository klonen:
   ```bash
   git clone https://github.com/ReismannRS/Autodarts-Pi5-Kiosk.git
   cd Autodarts-Pi5-Kiosk

2. Installationsskript ausführen:
   ```bash
   chmod +x kiosk-setup.sh
   ./kiosk-setup.sh
   ```

3. Raspberry Pi neu starten:
   ```bash
   sudo reboot
   ```
4. Autodarts auf dem Raspberry Pi Installieren:
   HowTo ist hier zu finden:
   ```bash
   https://autodarts.diy/getting-started/installation/
   ```

## 🔁 Umschalten zwischen RO ↔ RW

Auf dem Desktop erscheinen zwei Buttons:

- 📝 **In Schreibmodus wechseln**
- 🔒 **In Nur-Lesen-Modus wechseln**

Das System wird jeweils automatisch neu gestartet.

## ⚠️ Hinweis

- Funktioniert nur mit Raspberry Pi OS Desktop (empfohlen: Bookworm)
- Chromium muss installiert sein
- Änderungen im RO-Modus sind nicht dauerhaft

## 🧑‍💻 Struktur

- `kiosk-setup.sh`: Installationsskript
- `kiosk-tools/`: Umschalt-Skripte
- `Desktop/`: Desktop-Buttons

## 📜 Lizenz

MIT License
