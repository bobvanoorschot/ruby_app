#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './lib/visits'

def parse(webpages)
  raise RuntimeError, 'File is empty' if webpages.empty?

  puts 'Views:'
  visits = Visits.new(webpages).sort_by_views
  visits.each { |value| puts "#{value.join(' ')} views" }
  puts ''
  puts 'Unique views:'
  visits = Visits.new(webpages, true).sort_by_views
  visits.each { |value| puts "#{value.join(' ')} unique views" }
end

if $PROGRAM_NAME == __FILE__
  raise ArgumentError, 'No file found, please provide a file' if ARGV.empty?

  parse(File.open(ARGV[0]).to_a)
end
