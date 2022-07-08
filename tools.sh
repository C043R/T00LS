#!/bin/bash

# shellcheck disable=SC1009
# shellcheck disable=SC2155
# shellcheck disable=SC2092
# shellcheck disable=SC2006

export Red="$(tput setaf 1)"
export green="$(tput setaf 2)"
export yellow="$(tput setaf 3)"
export blue="$(tput setaf 4)"


banner(){

echo "[Developed by : bl4nk3r]"
echo " _           _        _ _           "
echo "(_)         | |      | | |          "
echo "|_ _ __  ___| |_ __ _| | | ___ _ __ "
echo "| | '_ \/ __| __/ _  | | |/ _ \ '__|"
echo "| | | | \__ \ || (_| | | |  __/ |   "
echo "|_|_| |_|___/\__\__,_|_|_|\___|_|   "
echo "                                    "
}

PS3="${green}Choose the tool you want to install"

if [ "$(id -u)" != "0" ]; then
  echo "${Red} [!] This script requires root privilege [run with : sudo bash tools.sh] "
  exit 1
fi

check(){
  if [ "$(dpkg -l | awk '/snapd/ {print }'|wc -l)" -ge 1 ]; then 
  echo "${blue}[!] Found snapd , continuing "
else
  ID=$('/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
  LSB=$(lsb_release -i | cut -f 2-)
  clear
  echo "${green}[!] Installing required packages"
  if [ "$ID" == "kali" ] || [ "$LSB" == "Kali" ]; then
  sudo apt-get update -yy
  sudo apt-get install snapd
  systemctl enable --now snapd apparmor
  echo "${yellow}[!] Done"
  fi

  if [ "$ID" == "parrot" ] || [ "$LSB" == "parrot" ]; then
  sudo apt-get update -yy
  sudo apt-get install snapd
  systemctl enable --now snapd apparmor
  echo "${yellow}[!] Done"
  fi

  if [ "$ID" == "ubuntu" ] || [ "$LSB" == "Ubuntu" ]; then
  sudo apt-get update -yy
  sudo apt-get install snapd
  systemctl enable --now snapd apparmor
  echo "${yellow}[!] Done"
  fi

  if [ "$ID" == "debian" ] || [ "$LSB" == "debian" ]; then
  sudo apt-get update -yy
  sudo apt-get install snapd
  systemctl enable --now snapd apparmor
  echo "${yellow}[!] Done"

  else
  echo "${Red}[!] Detected unknown system , cant install snapd , therefore the program will exit "
  echo "${Red} (!!) Supported systems : Ubuntu , Parrot os , Debian , Kali linux "
  sleep 2
  exit
  fi
  fi
}

check
banner

echo $PS3

menu() {
  echo "${blue}*****************************************************************"

  echo "${yellow}1) Evince pdf reader"
  echo "${yellow}2) Google Chrome"
  echo "${yellow}3) Blender"
  echo "${yellow}4) Spotify"
  echo "${yellow}5) Discord"
  echo "${yellow}6) LibreOffice"
  echo "${yellow}7) Zoom"
  echo "${yellow}8) TeamViewer"
  echo "${yellow}9) VLC"
  echo "${yellow}10) Quit"
  echo "${yellow}11) Recommend apps "

  echo "${blue}******************************************************************"
}

menu
read -r options

if [ "$options" == "1" ]; then
  echo "${blue}[+] Installing Evince pdf reader"
  sudo apt-get update -yy && sudo apt-get install evince -yy
  echo "${blue}[!] Done .."
fi

if [ "$options" == "2" ]; then
  echo "${yellow}[+] Downlading and installing Google chrome "
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
  echo "${yellow}[!] Done . "
fi

if [ "$options" == "3" ]; then
  echo "${yellow}[+] Installing Blender"
  sudo snap install blender --classic 
  echo "${yellow}[!] Installed Blender"
fi

if [ "$options" == "4" ]; then
  echo "${green}[+] Installing Spotify"
  curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update && sudo apt-get install spotify-client -yy
  sudo snap install spotify
  echo "${green}[!] Installed Spotify"
fi

if [ "$options" == "5" ]; then
  echo "${blue}[+] Installing Discord"
  sudo apt-get install libgconf-2-4 libappindicator1 -yy
  sudo apt-get update -yy && sudo apt-get install snapd -yy
  systemctl enable --now snapd apparmor
  sudo snap install discord
  echo "${blue}[!] Installed Discord "
fi

if [ "$options" == "6" ]; then
  echo "${green}[+] Installing LibreOffice"
  sudo apt install libreoffice -yy
  echo "${blue}[!] Installed LibreOffice"
fi

if [ "$options" == "7" ]; then
  echo "${blue}[+] Installing Zoom "
  sudo snap install zoom-client
  echo "${blue}[NOTE] To launch zoom client simply type : zoom-client in your terminal "
fi

if [ "$options" == "8" ]; then
  echo "${blue}[+] Donwloading and installing TeamViewer"
  echo "deb http://linux.teamviewer.com/deb stable main" | sudo tee /etc/apt/sources.list.d/teamviewer.list
  sudo apt-get update -yy
  sudo apt -y install gpg ca-certificates
  wget -O - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -
  sudo apt-get update -yy
  sudo apt-get install teamviewer -yy
  echo "${blue}[!] Installed TeamViewer"
fi

if [ "$options" == "9" ]; then
  echo "${yellow}[+] Installing vlc media player"
  sudo apt-get update -yy
  sudo apt-get install vlc -yy
  echo "${yellow}[!] Installed Vlc media player"
fi

if [ "$options" == "10" ]; then
  echo "${Red}[=] Quitting ... "
  exit
fi

if [ "$options" == "11" ]; then
  echo "${green}If you want to recommend an idea for this installer , contact me "
  echo "Discord : Coder#5364"
  echo "Instagram : bl4nk3r"
else
  echo "${Red}[!] Reloading script "
  echo $PS3
  menu
  read -r options
fi
