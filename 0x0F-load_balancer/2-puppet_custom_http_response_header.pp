# creating a custom HTTP header response, but with Puppet.

$default = 'server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                try_files \$uri \$uri/ =404;
        }
        location /redirect_me {
                return 301 https:#www.youtube.com/watch?v=QH2-TGUlwu4;
        }

        error_page 404 /404.html;
        location = /404.html {
                internal;
        }
}'

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
}

package { 'nginx':
ensure  => 'installed',
require => Exec['update'],
}

file { 'index':
ensure  => 'present',
path    => '/var/www/html/index.nginx-debian.html',
content => 'Hello World!',
mode    => '0644',
require => Package['nginx'],
}

file { 'error_404':
ensure  => 'present',
path    => '/var/www/html/404.html',
content => 'Ceci n\'est pas une page',
mode    => '0644',
require => Package['nginx'],
}

file { 'server_config':
ensure  => 'present',
path    => '/etc/nginx/sites-available/default',
content => $default,
require => Package['nginx'],
}

# adding header
exec {'add_header':
environment => ["HOST=${hostname}"],
command     => 'sudo sed -i "/root \/var\/www\/html;/a $(printf "\t")add_header X-Served-By $HOST;" /etc/nginx/sites-available/default',
provider    => shell,
require     => File['server_config'],
}

exec { 'service nginx restart':
path    => ['/usr/sbin', '/usr/bin'],
require => Exec['add_header'],
}
