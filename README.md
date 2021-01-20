A quick script to choose how to use your external monitor in Linux and OpenBSD, written in BASH.

Install with:

```
wget https://raw.githubusercontent.com/royaleconqueso/monitor/main/mtr.sh && chmod 755 mtr.sh
```

Run

```
xrandr 
```

to determine the name of your specific devices, and edit the script using the find and replace feature of your text editor, if necessary.

Put it somewhere in your path, and run with:

```
./mtr.sh
```
