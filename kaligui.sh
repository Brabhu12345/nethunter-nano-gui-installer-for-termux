#!/bin/bash

apt update ; apt install kali-desktop-xfce dbus-x11 tigervnc-standalone-server xfce4 xfce4-whiskermenu-plugin xfce4-terminal firefox-esr kali-themes kali-defaults -y

mkdir .vnc 2> /dev/null

echo -e '#!/bin/bash\n\ndbus-launch\nstartxfce4' >> .vnc/xstartup

tools="nmap ncat python3 python3-pip john gobuster dirb dirbuster wordlists sqlmap sqlite3 nikto metasploit-framework"

IFS=' ' read -ra tool_array <<< "$tools"

for ((i=0; i<${#tool_array[@]}; i++)); do
  echo -e "\e[1;34m$((i+1)).\e[0m \e[1;33m${tool_array[i]}\e[0m"
done

rm /usr/bin/kex
cp kex /usr/bin/
chmod +x /usr/bin/kex
echo -n "Do you want to install these Additional tools?"
echo -n "because this is nano so tools are not installed? (y/n): "
read user_response

if [ "$user_response" == "y" ]; then
  sudo apt install -y nmap ncat python3 python3-pip john gobuster dirb dirbuster wordlists sqlmap sqlite3 nikto metasploit-framework
  echo -e "\e[1;32mtools Installation complete.\e[0m"
else
  echo -e "\e[1;31mtools Installation skipped.\e[0m"
fi

echo -e "\e[1;36mNow setup is finished\e[0m"
echo -e "\e[1;36mUse 'kex' to start VNC\e[0m"
echo -e "\e[1;36mUse 'kex kill' to stop VNC\e[0m"
