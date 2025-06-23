#!/bin/bash
set -e

echo "🔧 Installing required packages..."
sudo apt update
sudo apt install -y chromium-browser overlayroot policykit-1

echo "📁 Creating directories..."
mkdir -p ~/kiosk-tools
mkdir -p ~/Desktop

echo "💾 Writing scripts..."
cat > ~/kiosk-tools/set-rw.sh << 'EOF'
#!/bin/bash
REAL_CMDLINE="/boot/firmware/cmdline.txt"
sudo mount -o remount,rw /boot/firmware
line=$(grep -v '^$' "$REAL_CMDLINE" | tr -d '\n' | sed 's/overlayroot=[^ ]*//g' | sed 's/  */ /g' | sed 's/ *$//')
line="${line} overlayroot=disabled"
echo "$line" | sudo tee "$REAL_CMDLINE" > /dev/null
sudo reboot
EOF

cat > ~/kiosk-tools/set-ro.sh << 'EOF'
#!/bin/bash
REAL_CMDLINE="/boot/firmware/cmdline.txt"
sudo mount -o remount,rw /boot/firmware
line=$(grep -v '^$' "$REAL_CMDLINE" | tr -d '\n' | sed 's/overlayroot=[^ ]*//g' | sed 's/  */ /g' | sed 's/ *$//')
line="${line} overlayroot=tmpfs"
echo "$line" | sudo tee "$REAL_CMDLINE" > /dev/null
sudo reboot
EOF

chmod +x ~/kiosk-tools/set-*.sh

echo "🖥️ Writing desktop shortcuts..."
cat > ~/Desktop/Wechsle-in-Schreibmodus.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=📝 In Schreibmodus wechseln
Exec=pkexec /home/pi/kiosk-tools/set-rw.sh
Icon=system-run
Terminal=true
EOF

cat > ~/Desktop/Wechsle-in-ReadOnly.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=🔒 In Nur-Lesen-Modus wechseln
Exec=pkexec /home/pi/kiosk-tools/set-ro.sh
Icon=system-lock-screen
Terminal=true
EOF

chmod +x ~/Desktop/Wechsle-in-*.desktop

echo "🔐 Adding polkit rule..."
sudo tee /etc/polkit-1/localauthority/50-local.d/99-allow-kiosk-cmdline.pkla > /dev/null <<EOF
[Allow user to run overlayroot scripts]
Identity=unix-user:pi
Action=org.freedesktop.policykit.exec
ResultActive=yes
EOF

echo "⚙️ Configuring Chromium autostart..."
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/autodarts.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Autodarts
Exec=chromium-browser --start-fullscreen --no-first-run --disable-session-crashed-bubble https://play.autodarts.io/
X-GNOME-Autostart-enabled=true
EOF

echo "✅ Installation complete. Please reboot your system."
