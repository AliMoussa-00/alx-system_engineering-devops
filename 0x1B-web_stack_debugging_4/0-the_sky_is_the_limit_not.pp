# increasing the number of worker process
# will increase the number of the request the server can handle
# which will reduce the number of failed requests

exec { 'fix-nginx-conf':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin'
}

exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
