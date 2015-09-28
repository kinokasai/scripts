statements="if|while|for|sizeof|switch|catch"
types="void|int|float|long|char|size_t$"

cat $1 | grep -En "^$" | grep -En "^1:" | cut -b 1-2 \
| sed 's/$/ - file.spurious/'

cat $1 | grep -En ".("$statements")\(." | sed -r 's/$/ - keyword/'
