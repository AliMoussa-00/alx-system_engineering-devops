#!/usr/bin/env ruby
# script that matches the regular expression hbn with between 2-5 t's in between hb and n.

puts ARGV[0].scan(/^hbt{2,5}n/).join
