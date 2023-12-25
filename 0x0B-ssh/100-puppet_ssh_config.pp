# puppet script to set up our 'ssh_config'

file { 'set_key':
ensure => 'present',
path   => '/etc/ssh/ssh_config',
line   => '	IdentityFile ~/.ssh/school'
}

file { 'no_pass':
ensure => 'present',
path   => '/etc/ssh/ssh_config',
line   => '	PasswordAuthentication no'
}
