### 在Shell界面依次执行以下命令

createdb -h 127.0.0.1
psql -h 127.0.0.1
create user nextcloud with password 'nextcloud-admin';
CREATE DATABASE nextcloud  OWNER nextcloud;
GRANT ALL PRIVILEGES ON DATABASE gitea to nextcloud;

#### Options of database connection:

- 数据库类型：PostgreSQL
- 数据库主机：127.0.0.1:5432
- 用户名：nextcloud
- 数据库用户密码：nextcloud-admin
- 数据库名称：nextcloud
- SSL：Disable
- Schema：(empty)
