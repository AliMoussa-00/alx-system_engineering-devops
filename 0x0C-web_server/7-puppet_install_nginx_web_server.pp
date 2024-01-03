$default = "server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;
        index index.html;

        location /redirect_me {
                return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
}"

package { 'nginx':
ensure  => 'installed',
}

file { '/var/www/html/index.nginx-debian.html':
ensure  => 'present',
content => 'Hello World!',
require => Package['nginx'],
mode    => '0644'
}

file { '/etc/nginx/sites-available/default':
ensure  => 'present',
require => Package['nginx'],
content => $default
}

exec { 'service nginx restart':
path => ['/usr/sbin', '/usr/bin']
}
