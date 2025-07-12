
#!/bin/bash
clear
echo -e "\e[92m=== [ PlankXploit Tools Launcher ] ===\e[0m" | lolcat
echo -e "
[1] 🚀 DDoS Tool (Hammer)
[2] 🎭 Phishing Generator (Zphisher)
[3] 📍 Location Tracker (Seeker)
[4] 🔐 John The Ripper
[5] 📡 Nmap Scanner
[6] ❌ Exit
" | lolcat

read -p "➤ Select: " pilih
case $pilih in
  1) git clone https://github.com/cyweb/hammer && cd hammer && python3 hammer.py ;;
  2) git clone https://github.com/htr-tech/zphisher && cd zphisher && bash zphisher.sh ;;
  3) git clone https://github.com/thewhiteh4t/seeker && cd seeker && bash install.sh && python3 seeker.py ;;
  4) echo "[*] Jalankan: john <wordlist.txt>" && sleep 2 ;;
  5) read -p "IP Target ➤ " ip; nmap $ip ;;
  6) exit ;;
  *) echo "Invalid"; sleep 1 ;;
esac
