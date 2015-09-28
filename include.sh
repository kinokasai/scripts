
stdio=`cat -e $1 | grep -E ".(printf|puts)."`
stdlib=`cat -e $1 | grep -E ".(malloc)."`
stdlibp=`cat -e $1 | grep -E ".stdlib\.h"`
stdiop=`cat -e $1 | grep -E ".stdio\.h"`
incl=""

if [ -n "$stdio" -a -z "$stdiop" ]; then
    incl=$incl"#include <stdio.h>"
fi
if [ -n "$stdlib" -a -z "$stdlibp" ]; then
    incl=$incl"#include <stdlib.h>"
fi

clear
file=`cat -e $1`
#echo -e $incl$file #| tr $ "\n"
read
echo -e $incl$file #| tr $ "\n" > $1
