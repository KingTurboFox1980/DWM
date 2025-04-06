//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	//{"" , "/home/j3ll0/.suckless/dwmblocks/scripts/bandwidth"                  , 1  , 0} ,
	{"🚀 "  , "/home/j3ll0/.suckless/dwmblocks/scripts/processor"                  , 1  , 0} ,
	{""  , "/home/j3ll0/.suckless/dwmblocks/scripts/temp"                  , 1  , 0} ,
	//{"" , "/home/j3ll0/.suckless/dwmblocks/scripts/process"                  , 1  , 0} ,
	//{"📉 ", "free -h | awk '/^Swap/ { print $3\"/\"$2 }' | sed s/i//g",	10, 0},
	{" 🐏 "  , "/home/j3ll0/.suckless/dwmblocks/scripts/memory"      , 1 , 0} ,
	//{""  , "/home/j3ll0/.suckless/dwmblocks/scripts/brightness"                  , 1  , 0} ,
	//{""  , "/home/j3ll0/.suckless/dwmblocks/scripts/volume"                  , 1  , 0} ,
	//{""  , "/home/j3ll0/.suckless/dwmblocks/scripts/battery"                  , 1  , 4} ,
	//{"🔺 " , "/home/j3ll0/.suckless/dwmblocks/scripts/timerunning"                , 1 , 0} ,
	{"" , "/home/j3ll0/.suckless/dwmblocks/scripts/dwmdisk"                  , 1  , 0} ,
	{" "  , "/home/j3ll0/.suckless/dwmblocks/scripts/clock"                      , 1  , 0} ,
	//{""  , "/home/j3ll0/.suckless/dwmblocks/scripts/daypercentage"                      , 1  , 0} ,
	//{""  , "/home/j3ll0/.suckless/dwmblocks/scripts/pacupdate"                  , 1  , 0} ,

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "";
static unsigned int delimLen = 5;

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 0
