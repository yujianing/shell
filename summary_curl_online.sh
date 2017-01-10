#!/bin/bash
#$1：开始时间 yyyymmdd
#$2：持续天数
###= ./summery_curl_online.sh 20160401 30 : 创建4月份的日汇总任务
set -e  #告诉bash一但有任何一个语句返回非真的值，则退出bash
#set -x #debug模式

#let内的变量名前不需要加$
#if语句下的[]内，左右两边需要空格
#elif后面要跟then
#$monthdays[1]应换成${monthdays[1]}
#

monthdays=(31 28 31 30 31 30 31 31 30 31 30 31)
count=0
settleday=0

#获取年月日
let year=$1/10000
let month=$1%10000/100
let day=$1%100

#时间有效性判断
if (( ${day} <= ${monthdays[${month}]} ))&&(( ${day} >= 1 ))&&(( ${month} >= 1 ))&&(( ${month} <= 12 )) #第一种判断语法
then
	echo ${monthdays[${month}]} 
	echo ${day}
	echo "begin...."
else
	exit 1
fi

for (( i=0;i<$2;i++ ))
do	
	#年月日再组合成settleday
	#这里太low了，先拆后拼需要优化，个位的月和日前面需要加0，添加了很多判断，需要优化
        if [ ${day} -lt 10 ]&&[ ${month} -lt 10 ] #第二种判断语法
        then
          settleday=${year}0${month}0${day}
        elif [ ${day} -gt 9 ]&&[ ${month} -lt 10 ]
	then
       	  settleday=${year}0${month}${day}
	elif [ ${day} -lt 10 ]&&[ ${month} -gt 9 ]
	then
	  settleday=${year}${month}0${day}
	else
	  settleday=${year}${month}${day}
	fi

 	#curl 10.120.78.90:8080/api/settle/income/summaryDailyIncomeTask.htm?settleDate=${settledate}
	curl https://accapi.epay.163.com/api/settle/income/summary.htm\?summaryDate\=${settledate}
  	echo $settleday	
	
	#大于当前月最大天数，day更新为1，day+1
	#大于12月，month更新为1，year+1
	temp=${monthdays[${month}-1]}
	let day=day+1
	if [[ ${day} -gt ${temp} ]]
	then
		let day=01
		let month=month+1
		if [ ${month} -eq 13 ]
		then
			let year=year+1
			let month=01
		fi	
	fi
done




#echo "select * from ACC_SETTLE_DAILY where platform_account_id='wyb_whole_test@wyb.163.com'and settle_date between '$1' and '${settledate}' order by settle_date desc"
#echo "curl 10.120.78.90:8080/api/settle/income/summaryIncomeRetryTask.htm"


