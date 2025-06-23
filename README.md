# Raspberry Pi Kiosk Setup

Dieses Repository richtet sich an alle, die einen Raspberry Pi als abgesichertes Kiosk-System betreiben möchten. Es richtet automatisch ein:

- Autostart von Chromium im Vollbildmodus
- Anzeige einer beliebigen Webseite (Standard: https://play.autodarts.io/)
- Aktivierung eines Read-Only-Systems per `overlayroot`
- Umschaltung zwischen Read-Only und Schreibmodus per Desktop-Button

## 📦 Installation

1. Repository klonen oder ZIP herunterladen:
```bash
git clone https://github.com/DEIN-BENUTZERNAME/rpi-kiosk-setup.git
cd rpi-kiosk-setup
```

2. Installationsskript ausführen:
```bash
chmod +x kiosk-setup.sh
./kiosk-setup.sh
```

3. Raspberry Pi neu starten:
```bash
sudo reboot
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
