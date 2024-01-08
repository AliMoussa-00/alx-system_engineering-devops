$default = 'server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        add_header X-Served-By $HOSTNAME;

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

package { 'nginx':
ensure  => 'installed',
}

file { 'index.html':
ensure  => 'present',
path    => '/var/www/html/index.nginx-debian.html',
content => 'Hello World!',
mode    => '0644'
}

file { '404.html':
ensure  => 'present',
path    => '/var/www/html/404.html',
content => 'Ceci n\'est pas une page',
mode    => '0644'
}

file { 'server_config':
ensure  => 'present',
path    => '/etc/nginx/sites-available/default',
content => $default
}

exec { 'service nginx restart':
path  => ['/usr/sbin', '/usr/bin']
}
