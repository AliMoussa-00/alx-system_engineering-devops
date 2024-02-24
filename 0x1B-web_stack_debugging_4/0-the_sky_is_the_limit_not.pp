# increasing the number of worker process
# will increase the number of the request the server can handle
# which will reduce the number of failed requests

exec { 'update_nginx_conf':
  command => "sed -i 's/worker_processes 4;/worker_processes 7;/g' /etc/nginx/nginx.conf; sudo service nginx restart",
  path    => ['/bin', '/usr/bin', '/usr/sbin']
}
