#!/bin/bash

# === UPDATE & INSTALL TOOLS ===
pkg update -y && pkg upgrade -y
pkg install figlet toilet jp2a ruby -y
gem install lolcat

# === SET PROMPT ===
PROMPT="plankdev@EL_Savador ➤ "
echo "export PS1='\[\e[1;32m\]$PROMPT\[\e[0m\]'" >> ~/.bashrc

# === HAPUS WELCOME TERMUX BAWAAN (BERSIH) ===
sed -i '/Welcome to Termux/,+6d' ~/.bashrc

# === BUAT BANNER THEME ===
cat << 'EOF' > ~/.termux_theme
clear
# BANNER ASCII
figlet -f slant "PLANKXPLOIT" | lolcat

# INFO PENGGUNA
echo -e "\e[91m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m" | lolcat
echo -e "\e[92m  👤 Name      : PlankXploit"
echo -e "  📚 Title     : Ethical Hacking"
echo -e "  🌐 Community : EL Savador"
echo -e "\e[91m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m\n" | lolcat

# QUOTE RANDOM
echo -e "\e[96m  \"We are not just hackers, we are PlankXploit.\"\e[0m\n" | lolcat
EOF

# === TAMBAHKAN BANNER KE BASHRC ===
grep -q "cat ~/.termux_theme" ~/.bashrc || echo "cat ~/.termux_theme" >> ~/.bashrc

# === DONE ===
echo -e "\n\e[92m[✔] Tema PlankXploit berhasil di-install!"
echo -e "[💡] Restart Termux atau ketik 'source ~/.bashrc'\e[0m"
