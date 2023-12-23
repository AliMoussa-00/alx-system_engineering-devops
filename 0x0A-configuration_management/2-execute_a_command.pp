# a manifest that kills a process named killmenow

exec { 'kill_menow':
command => '/usr/bin/pkill killmenow',
}
