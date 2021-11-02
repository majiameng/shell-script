#!/bin/bash
# get all filename in specified path

#删除day天前文件
echo "日期 "`date -d -2days '+%Y%m%d'`":"



echo "1.删除缓存文件 start: "
week=`date +%w`
echo $week

if [ $week -eq 1 ];
then
    #项目目录
    path="/www/file/storageFiles/temp/"
    #所有项目列表
    files=$(ls $path)
    for filename in $files
    do
        echo $path$filename
        `rm -rf $path$filename`
    done
    echo "今天周一,清空temp缓存文件 end"
fi


echo "1.删除项目中old上传文件 start"

#day天前日期
beforeday=`date -d -2days '+%Y%m%d'`

#删除文件
function delete_file()
{
  echo $application
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
}


#文件上传
application="/www/file/"
delete_file
#文件分享
application="/www/file/storageFiles/share/"
delete_file
application="/www/file/storageFiles/decrypt/"
delete_file

echo "删除项目中old上传文件 end"