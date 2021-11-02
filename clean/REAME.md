项目检出
```
cd /www/wwwroot/
git clone git@github.com:majiameng/shell-script.git
```

添加权限
```
cd /www/wwwroot/shell-script
git config core.filemode false
chmod -R 777 /www/wwwroot/shell-script/
```

打开定时任务(每天1点执行)
crontab -e
```
0 1 * * * sh /www/wwwroot/shell-script/clean_log.sh  >> /www/wwwroot/shell-script/clean_log.log  2>&1
0 1 * * * sh /www/wwwroot/shell-script/clean_jisutudo_upload.sh  >> /www/wwwroot/shell-script/clean_jisutudo_upload.log  2>&1
```
