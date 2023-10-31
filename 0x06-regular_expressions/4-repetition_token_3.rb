#!/usr/bin/env ruby
#script that matches the regular expression hbn with 0 or more t's in between hb and n.


puts ARGV[0].scan(/hbt*n/).join
