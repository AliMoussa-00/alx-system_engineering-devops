exec { 'update':
command => '/usr/bin/sudo apt update',
}

package { 'nginx':
ensure  => installed,
require => Exec['update']
}

file { '/var/www/html/index.nginx-debian.html':
ensure  => present,
content => 'Hello World!',
require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
ensure  => present,
require => Package['nginx'],
notify  => Service['nginx'],
content => 'server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                try_files \$uri \$uri/ =404;
        }

        location /redirect_me {
                return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
}'
}

service { 'nginx':
ensure => 'running',
enable => true,
}
