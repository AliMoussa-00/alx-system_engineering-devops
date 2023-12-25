# puppet script to set up our 'ssh_config'

file_line { 'set_key':
ensure => 'present',
path   => '/etc/ssh/ssh_config',
line   => '	IdentityFile ~/.ssh/school'
}

file_line { 'no_pass':
ensure => 'present',
path   => '/etc/ssh/ssh_config',
line   => '	PasswordAuthentication no'
}
