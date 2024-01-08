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
                return 301 'https':#www.youtube.com/watch?v=QH2-TGUlwu4;
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
ensure => 'installed',
after  => Exec['update'],
}

file { 'index':
ensure  => 'present',
path    => '/var/www/html/index.nginx-debian.html',
content => 'Hello World!',
mode    => '0644',
after   => Package['nginx'],
}

file { 'error_404':
ensure  => 'present',
path    => '/var/www/html/404.html',
content => 'Ceci n\'est pas une page',
mode    => '0644',
after   => Package['nginx'],
}

file { 'server_config':
ensure  => 'present',
path    => '/etc/nginx/sites-available/default',
content => $default,
after   => Package['nginx'],
}

# adding header
exec {'add_header':
command  => 'sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
provider => shell,
after    => File['server_config'],
}

exec { 'service nginx restart':
path  => ['/usr/sbin', '/usr/bin'],
after => Exec['add_header'],
}
