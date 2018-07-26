#! /bin/sh
apt-get update
apt-get install -y apache2
debconf-set-selections <<< 'mysql-server mysql-server/root_password password vetstoria'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vetstoria'
apt-get install -y mysql-server
add-apt-repository ppa:ondrej/php5-5.6
apt-get update
apt-get install -y php5.6
cd /etc/php/5.6/apache2
rm php.ini
touch php.ini
echo "[PHP]

engine = On
short_open_tag = Off
asp_tags = Off
precision = 14
output_buffering = 4096
zlib.output_compression = Off
implicit_flush = Off
unserialize_callback_func =
serialize_precision = 17
disable_functions = pcntl_alarm,pcntl_fork,pcntl_waitpid,pcntl_wait,pcntl_wifexited,pcntl_wifstopped,pcntl_wifsignaled,pcntl_wexitstatus,pcntl_wtermsig,pcntl_wstopsig,pcntl_signal,pcntl_signal_dispatch,pcntl_get_last_error,pcntl_strerror,pcntl_sigprocmask,pcntl_sigwaitinfo,pcntl_sigtimedwait,pcntl_exec,pcntl_getpriority,pcntl_setpriority,
disable_classes =
expose_php = Off
max_execution_time = 30
max_input_time = 60
memory_limit = 1024M
error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT
display_errors = Off
display_startup_errors = Off
log_errors = On
log_errors_max_len = 1024
ignore_repeated_errors = Off
ignore_repeated_source = Off
report_memleaks = On
track_errors = Off
html_errors = On
variables_order = \"GPCS\"
request_order = \"GP\"
register_argc_argv = Off
auto_globals_jit = On
post_max_size = 8M
auto_prepend_file =
auto_append_file =
default_mimetype = \"text/html\"
default_charset = \"UTF-8\"
doc_root =
user_dir =
enable_dl = Off
file_uploads = On
upload_max_filesize = 2M
max_file_uploads = 20
allow_url_fopen = On
allow_url_include = Off
default_socket_timeout = 60
[CLI Server]
cli_server.color = On
[Date]
[filter]
[iconv]
[intl]
[sqlite3]
[Pcre]
[Pdo]
[Pdo_mysql]pdo_mysql.cache_size = 2000
pdo_mysql.default_socket=
[Phar]
[mail function]
SMTP = localhost
smtp_port = 25
mail.add_x_header = On
[SQL]
sql.safe_mode = Off
[ODBC]
odbc.allow_persistent = On
odbc.check_persistent = On
odbc.max_persistent = -1
odbc.max_links = -1
odbc.defaultlrl = 4096
odbc.defaultbinmode = 1
[Interbase]
ibase.allow_persistent = 1
ibase.max_persistent = -1
ibase.max_links = -1
ibase.timestampformat = \"%Y-%m-%d %H:%M:%S\"
ibase.dateformat = \"%Y-%m-%d\"
ibase.timeformat = \"%H:%M:%S\"
[MySQL]
mysql.allow_local_infile = On
mysql.allow_persistent = On
mysql.cache_size = 2000
mysql.max_persistent = -1
mysql.max_links = -1
mysql.default_port =
mysql.default_socket =
mysql.default_host =
mysql.default_user =
mysql.default_password =
mysql.connect_timeout = 60
mysql.trace_mode = Off
[MySQLi]
mysqli.max_persistent = -1
mysqli.allow_persistent = On
mysqli.max_links = -1
mysqli.cache_size = 2000
mysqli.default_port = 3306
mysqli.default_socket =
mysqli.default_host =
mysqli.default_user =
mysqli.default_pw =
mysqli.reconnect = Off
[mysqlnd]
mysqlnd.collect_statistics = On
mysqlnd.collect_memory_statistics = Off
[OCI8]
[PostgreSQL]
pgsql.allow_persistent = On
pgsql.auto_reset_persistent = Off
pgsql.max_persistent = -1
pgsql.max_links = -1
pgsql.ignore_notice = 0
pgsql.log_notice = 0
[Sybase-CT]
sybct.allow_persistent = On
sybct.max_persistent = -1
sybct.max_links = -1
sybct.min_server_severity = 10
sybct.min_client_severity = 10
[bcmath]
bcmath.scale = 0
[browscap]
[Session]
session.save_handler = files
session.use_strict_mode = 0
session.use_cookies = 1
session.use_only_cookies = 1
session.name = PHPSESSID
session.auto_start = 0
session.cookie_lifetime = 0
session.cookie_path = /
session.cookie_domain =
session.cookie_httponly =
session.serialize_handler = php
session.gc_probability = 0
session.gc_divisor = 1000
session.gc_maxlifetime = 1440
session.referer_check =
session.cache_limiter = nocache
session.cache_expire = 180
session.use_trans_sid = 0
session.hash_function = 0
session.hash_bits_per_character = 5
url_rewriter.tags = \"a=href,area=href,frame=src,input=src,form=fakeentry\"
[MSSQL]
mssql.allow_persistent = On
mssql.max_persistent = -1
mssql.max_links = -1
mssql.min_error_severity = 10
mssql.min_message_severity = 10
mssql.compatibility_mode = Off
mssql.secure_connection = Off
[Assertion]
[COM]
[mbstring]
[gd]
[exif]
[Tidy]
tidy.clean_output = Off
[soap]
soap.wsdl_cache_enabled=1
soap.wsdl_cache_dir=\"/tmp\"
soap.wsdl_cache_ttl=86400
soap.wsdl_cache_limit = 5
[sysvshm]
[ldap]
ldap.max_links = -1
[mcrypt]
[dba]
[opcache]
[curl]
[openssl]
" >> php.ini
cd ~
cd ..
cd ..
apt-get install -y curl
apt-get install -y git
git clone --depth 1 https://github.com/phalcon/cphalcon.git
cd cphalcon
git remote set-branches origin 'phalcon-v2.0.13'
git fetch --depth 1 origin phalcon-v2.0.13
git checkout phalcon-v2.0.13
cd build
./install
cd ~
cd ..
cd ..
git clone git@bitbucket.org:vetstoria/oabp.git
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install -y yarn
apt-get install -y python-software-properties
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y npm
npm install -g bower
cd ~
cd ..
cd ..
cd etc/apache2/sites-enabled
rm 000-default.conf
touch 000-default.conf
echo "<VirtualHost *:80>
    ServerAdmin admin@example.host
    DocumentRoot \"/var/www/html/oabp/source/public\"
    DirectoryIndex index.php
    ServerName oabp

    <Directory \"/var/www/html/oabp/source\">
        Options All
        AllowOverride All
        Allow from all
    </Directory>
</VirtualHost>" >> 000-default.conf
cd ~
cd ..
cd ..
cd etc
echo "127.0.0.1       oabp" >>> hosts
cd ~
cd ..
cd ..
composer install --dev
yarn install --production=false
bower install
mysql -u root -p
echo "GRANT ALL PRIVILEGES ON *.* TO 'vetstoria'@'vetstoria_image' IDENTIFIED BY 'vetstoria';"
echo "\q"
mysql -u vetstoria -p vetstoria
echo "CREATE DATABASE `vetstoria_oabp` DEFAULT CHARACTER SET utf8;
CREATE USER 'vetstoria'@'localhost' IDENTIFIED BY 'sqladmin';
GRANT ALL PRIVILEGES ON `vetstoria_oabp`.* TO 'vetstoria'@'localhost';
FLUSH PRIVILEGES;"
echo "\q"
/var/www/html/oabp/vendor/phing/phing/bin/phing build-db-sql-file
cd /var/www/html/oabp/source/appdata
mysql -u vetstoria -p db < /db.sql
cd ~
cd ..
cd ..
cd /etc/mysql/
rm my.cnf
touch my.cnf
echo "!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/
innodb_file_per_table" >> my.cnf
cd ~
cd ..
cd ..