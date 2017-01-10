#! /bin/bash

#####
###= hasfilm [filmName]: 查找电影盘里有没有该电影 
###= hasfile counts: 统计所有电影数量 
#####

if [ $1 = 'counts' ]
then
	ls -1R /Volumes/电影 | grep -E "mkv|avi|rmvb|mp4" | wc -l
else
	find /Volumes/电影/ -name "*${1}*" ! -type d | grep -v "._"
fi
