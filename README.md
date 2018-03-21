# P024-UbuntuSetup

Script for installing and setting up common packages and programs for Ubuntu.
The script has a built-in check if the package is installed or not and will install it if it is not installed. And if it is installed, the script will print a message. Also you need to be root to run it, the script will print put an error message like this, if you're not root.

`Please run as root, try 'sudo ./install.sh'`

You can run the script multiple times, and if everything is installed you should get this output:

<img src="https://github.com/181192/P024-UbuntuSetup/blob/master/img/install.png" width="450" height="auto">


## Overview of files
You can choose to run the `install.sh` script or, if you want to install a spesial script you can go in the `scripts` directory. From here you can choose whatever script you want and run normaly with `sudo ./script_name.sh`.


```
.
├── functions
│   ├── functions.sh
│   └── variables.sh
├── install.sh
├── README.md
└── scripts
    ├── arc-theme.sh
    ├── deluge.sh
    ├── docker-compose.sh
    ├── docker-machine.sh
    ├── docker.sh
    ├── gimp.sh
    ├── glances.sh
    ├── gnome.sh
    ├── google-chrome.sh
    ├── java.sh
    ├── jetbrains-toolbox.sh
    ├── mongodb.sh
    ├── nginx.sh
    ├── nodejs.sh
    ├── node_modules.sh
    ├── openvpn.sh
    ├── python2.sh
    ├── python3.sh
    ├── sublime.sh
    ├── the_basics.sh
    ├── update_upgrade.sh
    ├── virtualbox.sh
    └── vlc.sh
 ```


Some npm packages:
```
- angular
- @angular/cli
- browserify
- cordova
- express
- ionic
- react
- uglify-js
- webpack
```

A gnome theme:
```
- arc-theme
```

