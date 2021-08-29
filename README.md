# wine-office2010
## 这是一个运行在docker的office2010，使用它你可以在Linux上使用office2010，借助playonlinux构建
由于在Docker配置office2010需要使用gui界面因此不能借助dockfile来创建Docker镜像，但是Docker镜像我已经建立好了，直接下载用就可以，下载地址如下:
- 链接: https://pan.baidu.com/s/12QAi_-lj3ZvxTGC2LDQ2oA  密码: 46ah

使用教程:
- 0.1，本脚本借助Docker运行，因此在使用前请安装Docker
- 0.2，在安装好Docker后将用户加入Docker组
  - sudo usermod -aG docker ${USER}
- 1，下载所给地址的7z文件，然后解压它，会得到一个playonlinux-office2010.tar的文件
- 2，克隆仓库
  - git clone https://github.com/Nan-sh/wine-office2010.git
- 3，将playonlinux-office2010.tar与install.sh文件放在同一目录下
- 4，赋予install.sh文件可执行权限
  - sudo chmod +x install.sh
- 5，安装
  - 运行sudo chown -R ${USER} /var/run/docker.sock 
  - ./install.sh
  - 注意这里不要用sudo ./install这样的形式运行

安装完成后就可以使用word，excel，powerpoint，onenot和outlook命令启动，注意保存文档到office文件夹内，因为我将Docker内的office文件夹映射到本地电脑的office内也就是说，在使用word等软件中，保存文档到office文件夹内，你的电脑内才会有这个文件
