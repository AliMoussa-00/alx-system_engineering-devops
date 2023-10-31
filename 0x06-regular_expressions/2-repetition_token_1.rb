#!/usr/bin/env ruby
# script that matches the regular expression hn with 0 or 1
# occurrences of b and 0 or 1 occurrences of t in between h and n.


puts ARGV[0].scan(/^hb?tn$/).join
