#!/usr/bin/env ruby
# script that matches the regular expression hbn with 1 or more t's in between hb and n.


puts ARGV[0].scan(/^hbt+n$/).join
