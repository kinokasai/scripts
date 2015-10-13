clear
echo Creating header...
head=`echo $1`
name=$head".h"
src=$head".c"
src2=$head"2"".c"


struct=$head".s"

sizet=`cat $src | grep -E ".size_t."``cat $struct | grep -E ".size_t"`
stdio=`cat $src | grep -E ".puts|printf."`
stdlib=`cat $src | grep -E ".malloc(."`

define=`echo $name | tr '[a-z.]' '[A-Z_]'`

#echo $define

echo "#ifndef $define" > $name
echo "# define $define" >> $name

if [ -n "$sizet" ]; then
    echo '# include <stddef.h>' >> $name
fi
if [ -n "$stdio" ]; then
    echo '# include <stdio.h>' >> $name
fi
if [ -n "$stdlib" ]; then
    echo '# include <stdlib.h>' >> $name
fi
if [ -e "$struct" ]; then
    cat $struct >> $name
fi

echo "" >> $name

cat $src | grep -E "^(void|unsigned|int|float|long|char|size_t).*)$" | sed 's/)$/);/'  >> $name

if [ -e $src2 ]; then
    cat $src2 | grep -E "^(void|unsigned|int|float|long|char|size_t).*)$" | sed 's/)/);/'  >> $name
fi

echo >> $name
echo "#endif /* "$define" */" >> $name

echo Done.
clear
echo "Here is $name:"
echo ""
cat -e $name
read
clear
