#!/bin/bash
# get all filename in specified path

#删除day天前文件
echo "日期 "`date -d -2days '+%Y%m%d'`":"

echo "1.删除项目中old上传文件 start"

#day天前日期
beforeday=`date -d -2days '+%Y%m%d'`

#项目目录
application="/www/wwwroot/jisutodo/public/upload/"
if [ -d $application ];
then
    #项目下上传文件目录列表
    log_files=$(ls $application)
    for log_filename in $log_files
    do
        #清除项目日志
        if [ "${log_filename//-/}" -lt "$beforeday" ];
        then
            echo $application$log_filename
            `rm -rf $application$log_filename`
        fi
    done
fi
echo "删除项目中old上传文件 end"