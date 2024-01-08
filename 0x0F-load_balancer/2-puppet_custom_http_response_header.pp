# creating a custom HTTP header response, but with Puppet.

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
}

package { 'nginx':
ensure  => 'installed',
require => Exec['update'],
}

# adding header
exec {'add_header':
environment => ["HOST=${hostname}"],
command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
provider    => shell,
}

exec { 'service nginx restart':
path    => ['/usr/sbin', '/usr/bin'],
require => Exec['add_header'],
}
