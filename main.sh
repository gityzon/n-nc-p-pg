#！警告：replit免费版中所有代码都是公开可见的，建议使用edu版部署
#！RUN后，请按照 create-db.md 的指示创建数据库

#初始化pgsql
sh startpg.sh
pg_ctl stop
pg_ctl -l ./postgresql.log start

#下载nextcloud
if [ ! -f "~/${REPL_SLUG}\/nextcloud/index.php" ];then
curl -L https://download.nextcloud.com/server/releases/latest-20.zip -o nextcloud.zip
unzip nextcloud.zip
rm -f nextcloud.zip
fi

#启动
php -S 0.0.0.0:8000 -t ~/${REPL_SLUG}\/nextcloud
~/${REPL_SLUG}\/.nginx/nginx -g 'daemon off;'
