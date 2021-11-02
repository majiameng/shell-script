#!/bin/bash
# get all filename in specified path
echo "日期 "`date -d -9days '+%Y%m%d'`":"

echo "1.删除nginx日志 start: "
week=`date +%w`
if [ $week -eq 1 ];
then
    #项目目录
    path="/www/wwwlogs/"
    #所有项目列表
    files=$(ls $path)
    for filename in $files
    do
        echo ''> $path$filename
    done
    echo "今天周一,清空nginx日志 end"
fi


echo "2.删除项目中日志 start"
#项目目录
path="/www/wwwroot/"

#七天前日期
before7day=`date -d -7days '+%Y%m%d'`

#所有项目列表
files=$(ls $path)
for filename in $files
do
    application="$path$filename/storage/tinymeng/log/"
    if [ -d $application ];
    then
        #项目下日志列表
        log_files=$(ls $application)
        for log_filename in $log_files
        do
            #清除项目日志
            if [ "${log_filename:0-12:0-4}" -lt "$before7day" ];
            then
                echo $application$log_filename
                `rm -f $application$log_filename`
            fi
        done
    fi
done
echo "删除项目中日志 end"