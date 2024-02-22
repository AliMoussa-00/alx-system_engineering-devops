# fix the 'Too many open files'
# It indicates that there are too many open files to open this file successfully.

exec {'replace-the-limits-on-holberton-user':
  command  => 'sed -i s/holberton/foo/ /etc/security/limits.conf',
  provider => 'shell'
}
