
#!/bin/bash
pkg update -y && pkg upgrade -y
pkg install ruby toilet figlet jp2a termux-api git python nmap john -y
gem install lolcat

mkdir -p $HOME/.plankxploit
cp boot.mp3 $HOME/.plankxploit/
cp menu.sh $HOME/.plankxploit/
cp .termux_theme $HOME/

echo "export PS1='\[\e[1;32m\]plankdev@EL_Savador ➤ \[\e[0m\]'" >> ~/.bashrc
grep -q "cat ~/.termux_theme" ~/.bashrc || echo "cat ~/.termux_theme" >> ~/.bashrc
grep -q "/.plankxploit/menu.sh" ~/.bashrc || echo "bash $HOME/.plankxploit/menu.sh" >> ~/.bashrc

echo -e "\n\e[92m[✔] PLANKXploit ZIP FULLPACK TERPASANG!\e[0m"
echo -e "[💡] Restart Termux atau ketik 'source ~/.bashrc'\n"
