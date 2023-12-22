# installing the package flask

exec { 'install_flask':
command => '/usr/bin/pip3 install Werkzeug==2.1.1 Flask==2.1.0'
}
