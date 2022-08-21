#！警告：replit免费版中所有代码都是公开可见的，建议使用edu版部署
#！RUN后，请按照 create-db.md 的指示创建数据库


export PATH="~/nginx/sbin:$PATH"

if [ ! -d "~/nginx" ];then
	\cp -ax .nginx ~/nginx
fi
chmod 777 ~/nginx/sbin/nginx

#初始化pgsql
sh startpg.sh
pg_ctl stop
pg_ctl -l ./postgresql.log start

#下载nextcloud
if [ ! -f "done.md" ];then
curl -L https://download.nextcloud.com/server/releases/latest-20.zip -o nextcloud.zip
unzip nextcloud.zip
rm -f ~/${REPL_SLUG}\/nextcloud.zip 
mv nextcloud/*  . & mv nextcloud/.[^.]* . & rmdir ~/${REPL_SLUG}\/nextcloud
mv ~/${REPL_SLUG}\/README.md ~/${REPL_SLUG}\/done.md
fi

#启动
#php -S 0.0.0.0:8000 -t ~/${REPL_SLUG}\/nextcloud &
#nginx -g 'daemon off;'
