#!/bin/bash

#ASIGNAR PERMISOS DE EJECUCIÓN: chmod +x
#EJECUTAR EL SCRIPT ./apatana_install.sh

echo "INSTALAR JAVA"
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

echo "INSTALAR APATANA"
dir_local=$(pwd)
dir_local+="/APTANA"
echo "COPIANDO... ESPERE"
sudo cp -r $dir_local /opt/
sudo chmod 777 -R /opt/APTANA
app_exec="/usr/share/applications/aptana.desktop"
sudo su root -c "echo '[Desktop Entry]' >> $app_exec"
sudo su root -c "echo 'Encoding=UTF-8' >> $app_exec"
sudo su root -c "echo 'Name=Aptana Studio' >> $app_exec"
sudo su root -c "echo 'Comment=IDE for Rails, Python, PHP' >> $app_exec"
sudo su root -c "echo 'Exec=env UBUNTU_MENUPROXY= /opt/APTANA/AptanaStudio3' >> $app_exec"
sudo su root -c "echo 'Icon=/opt/APTANA/icon.xpm' >> $app_exec"
sudo su root -c "echo 'Terminal=false' >> $app_exec"
sudo su root -c "echo 'Type=Application' >> $app_exec"
sudo su root -c "echo 'Categories=GNOME;Application;Development;' >> $app_exec"
sudo su root -c "echo 'StartupNotify=true' >> $app_exec"

echo "APTANA INSTALADO :)"
