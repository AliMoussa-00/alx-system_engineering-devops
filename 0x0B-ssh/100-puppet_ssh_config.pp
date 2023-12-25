# puppet script to set up our 'ssh_config'

file { 'set_key':
ensure => 'present',
path => '$HOME/.ssh/school',
line => '	IdentityFile ~/.ssh/school'
}

file { 'no_pass':
ensure => 'present',
path => '$HOME/.ssh/school',
line => '	PasswordAuthentication no'
}
