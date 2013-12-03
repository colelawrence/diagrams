diagrams
========

Animated diagrams using Snap.svg


_How to Build_

Have [nodejs](http://nodejs.org) installed.

After cloning the repository, setting up the enviroment is as simple as running

```shell
cd diagrams
npm install
```

CoffeeScript and Rehab.js are the libraries used for building the enviroment.

To build the coffee files into `script/script.js` simply use:
```shell
cake build
```

To build coffee files on every change or _watching_ the files, use the build command:
```shell
cake watch
```


To operate the app, you can simply open the html file in the first directory.
With many browsers, the SVG files are loaded from the file system which is not enabled by default. To use Google Chrome for example, you need to append the flag `--allow-file-access-from-files` to the shortcut of Google Chrome, this process is described in [this dedicated website specifically describing this process](http://www.chrome-allow-file-access-from-file.com/)
(As of late, google runs in the background, so you may need to exit out of the background process to apply changes)
