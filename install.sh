#!/bin/bash
sudo xhost +local:root
sudo docker load -i office2007.tar
mkdir $HOME/office

sudo docker container create \
  --name word \
  -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e WINEPREFIX=/home/wine/.wine32 \
  -e WINEARCH=win32 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  office2007 \
  wine /home/wine/.wine32/drive_c/Program\ Files/Microsoft\ Office/Office12/WINWORD.EXE

sudo docker container create \
  --name excel \
  -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e WINEPREFIX=/home/wine/.wine32 \
  -e WINEARCH=win32 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  office2007 \
  wine /home/wine/.wine32/drive_c/Program\ Files/Microsoft\ Office/Office12/EXCEL.EXE

sudo docker container create \
  --name powerpoint \
  -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e WINEPREFIX=/home/wine/.wine32 \
  -e WINEARCH=win32 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  office2007 \
  wine /home/wine/.wine32/drive_c/Program\ Files/Microsoft\ Office/Office12/POWERPNT.EXE

sudo docker container create \
  --name access \
  -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e WINEPREFIX=/home/wine/.wine32 \
  -e WINEARCH=win32 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  office2007 \
  wine /home/wine/.wine32/drive_c/Program\ Files/Microsoft\ Office/Office12/MSACCESS.EXE

echo "#!/bin/bash" > word
echo "sudo docker start word" >> word
echo "#!/bin/bash" > excel
echo "sudo docker start excel" >> excel
echo "#!/bin/bash" > powerpoint
echo "sudo docker start powerpoint" >> powerpoint
echo "#!/bin/bash" > access
echo "sudo docker start access" >> access

sudo chmod +x word
sudo chmod +x excel
sudo chmod +x powerpoint
sudo chmod +x access

sudo mv word /usr/bin/
sudo mv excel /usr/bin
sudo mv powerpoint /usr/bin
sudo mv access /usr/bin

sudo rm -rf office2007.tar
