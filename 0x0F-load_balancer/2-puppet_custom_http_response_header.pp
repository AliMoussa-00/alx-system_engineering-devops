# creating a custom HTTP header response, but with Puppet.

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
  before   => Package['nginx'],
}

package { 'nginx':
ensure => 'installed',
before => Exec['add_header'],
}

# adding header
exec {'add_header':
environment => ["HOST=${hostname}"],
command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
provider    => shell,
before      => Exec['restart nginx'],
}

exec { 'restart nginx':
provider => shell,
command  => 'sudo service nginx restart',
}
