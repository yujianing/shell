#!/bin/bash

#####
###= swhost [host]: 切换host ([host]为/Users/yujianing/Documents/shell/switchhost/hosts下的文件名)
###= swhost list: 展示所有可切换的host以及当前host
#####

add="/Users/yujianing/Documents/shell/switchhost/hosts/"
if [ $1 = "detail" ] 
then
    if [ -z $2 ]
    then
        cat /Users/yujianing/Documents/shell/switchhost/hosts/*
        echo "=====当前host====="
        cat /etc/hosts
    else
        cat /Users/yujianing/Documents/shell/switchhost/hosts/$2
    fi 
elif [ $1 = "edit" ]
then
    vim /Users/yujianing/Documents/shell/switchhost/hosts/$2
elif [ $1 = "list" ]
then
    tree /Users/yujianing/Documents/shell/switchhost/hosts/
else
    cat ${add}$1 > /etc/hosts
    echo "=====当前host====="
    cat /etc/hosts
fi
