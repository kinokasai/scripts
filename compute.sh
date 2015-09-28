RES="#acuclub"
SOL="a58af01785e58a170d8a15b9eaebbfc2"

while [ "$RES" != "$SOL" ]; do tr -dc 'a-z' < /dev/urandom | fold -w $((RANDOM % 5 + 3)) | head -n 1 | xargs -P 8 -I@ sh -c 'RES=`echo @ | openssl dgst -md5` && if [ -n "@" ]; then echo $RES"=#"@; fi'
done
