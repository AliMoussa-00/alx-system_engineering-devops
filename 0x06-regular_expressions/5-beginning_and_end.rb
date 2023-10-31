#!/usr/bin/env ruby
#  script that matches a regular expression starting
#  with h and ending with n with any single character in between.


puts ARGV[0].scan(/^h.n$/).join
