sudo docker load -i playonlinux-office2010.tar
mkdir $HOME/office

docker container create \
  --name word \
  -it \
  --ipc=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  playonlinux-office2010 \
  /usr/share/playonlinux/playonlinux-bash .PlayOnLinux/shortcuts/Microsoft\ Word\ 2010

docker container create \
  --name excel \
  -it \
  --ipc=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  playonlinux-office2010 \
  /usr/share/playonlinux/playonlinux-bash .PlayOnLinux/shortcuts/Microsoft\ Excel\ 2010

docker container create \
  --name powerpoint \
  -it \
  --ipc=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  playonlinux-office2010 \
  /usr/share/playonlinux/playonlinux-bash .PlayOnLinux/shortcuts/Microsoft\ Powerpoint\ 2010

docker container create \
  --name onenote \
  -it \
  --ipc=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  playonlinux-office2010 \
  /usr/share/playonlinux/playonlinux-bash .PlayOnLinux/shortcuts/Microsoft\ OneNote\ 2010

docker container create \
  --name outlook \
  -it \
  --ipc=host \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/office:/home/wine/office \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  --device=/dev/dri/card0:/dev/dri/card0 \
  playonlinux-office2010 \
  /usr/share/playonlinux/playonlinux-bash .PlayOnLinux/shortcuts/Microsoft\ Outlook\ 2010

echo "#!/bin/bash" > word
echo "xhost +" > word
echo "docker start word" >> word
echo "#!/bin/bash" > excel
echo "xhost +"
echo "docker start excel" >> excel
echo "#!/bin/bash" > powerpoint
echo "xhost +"
echo "docker start powerpoint" >> powerpoint
echo "#!/bin/bash" > onenote
echo "xhost +"
echo "docker start onenote" >> onenote
echo "#!/bin/bash" > outlook
echo "xhost +"
echo "docker start outlook" >> outlook

sudo chmod +x word
sudo chmod +x excel
sudo chmod +x powerpoint
sudo chmod +x onenote
sudo chmod +x outlook

sudo mv word /usr/bin/
sudo mv excel /usr/bin
sudo mv powerpoint /usr/bin
sudo mv onenote /usr/bin
sudo mv outlook /usr/bin
