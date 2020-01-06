flag=`echo $1|awk '{print match($0,"://")}'`;
if [ $flag -gt 0 ];then
    echo "Please enter only domain name. EX: mysite.com";
exit 2
fi
####################################################
fail=0
output=0
host=$(echo $1 | tr -s /); DIR=${DIR%/}
#CHECKING SITEMAP 
output=$( wget --spider -S "$host"$2  2>&1 | grep "HTTP/" | awk '{print $2}')
if [ $output -ne 200 ]
then
    echo "Sitemap not found!"
	exit 2
fi
##############################
#LOOP THROUGH URLS IN SITEMAP#
##############################
for f in $(wget -qO- "$host"$2 | xpath -q -e '//loc/text()')
do
output=$( wget --spider -S $f 2>&1 | grep "HTTP/" | awk '{print $2}')
if [ $output -ne 200 ]
then
    echo "SOMETHING is went wrong on $f"
        fail=$((fail+1))
fi
done
if [ $fail -ge 0 ]
then
    echo "$host is working fine!"
    exit 0
else
    echo "SOMETHING is went wrong on $host"
    exit 2
fi

#echo "$f is working fine!"
