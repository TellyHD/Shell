#!/bin/bash
#本脚本的作用是遍历指定目录下的所有符合要求的文件，并将文件名重定向输出到recursiveFileNameOut.txt，其与当前脚本文件处于同一目录




function lookupFile
{
	# echo "执行的文件名：$0";
	# echo "第一个参数为：$1";

	file=$1

	if test -f ${file}
    then
    	if [[ $file == *cpp ]] #文件名满足的条件-正则表达式 *需要更改为您想匹配的条件，
		then
			subStr=${file##*/} #获取文件名
			echo "${subStr}" >> recursiveFileNameOut.txt #文件名重定向输出到recursiveFileNameOut.txt中
		fi

    elif test -d ${file} 
    then
        for subfile in $1/*
        do
	        lookupFile ${subfile} #递归遍历
	     done
    fi
   

}


lookedDirectory="/Users/kystar/Desktop/凯视达/iOSGit/iOSPTwo/PTwo/PTwo/Led" # 被查找的目录 *需要更改为您想遍历的目录
for file in "${lookedDirectory}/*"
do 
	lookupFile ${file}

done

