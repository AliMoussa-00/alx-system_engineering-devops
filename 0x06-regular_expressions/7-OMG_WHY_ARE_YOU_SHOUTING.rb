#!/usr/bin/env ruby
# Ruby script that matches regular expressions of uppercase letters.

puts ARGV[0].scan(/[A-Z]/).join
