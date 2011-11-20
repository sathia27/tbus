#!/usr/bin/env ruby
=begin
Program name: Lbus
Date Written: 06/09/2011
Date Modified: 06/09/2011
Author : Sathianarayanan.S
License: GPL2.0
Version: 1
=end
begin
 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'
 require 'net/http'
 require 'uri'
 puts 'Note: TBUS script. "x" in result denotes high frequency bus...'
 print "Enter the city. enter \n '1' for chennai and \n '2' for bangalore \nchoice:"
 city = gets.chomp
 if city == "1"
   print "Searching chennai..."
 else
   print "Searching bangalore.."
 end
 case city
  when "1"
  page = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_MTC_Chennai_bus_routes"))
  when "2"
  page = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_Metropolitan_bus_routes_in_Bangalore"))
 end
 while true
 print "\nSource: "
 source = gets.chomp
 print 'Destination: '
 destination = gets.chomp
 source_up =  source.capitalize
 source_low = source.downcase
 destination_up =  destination.capitalize
 destination_low = destination.downcase
 result = page.search('table.wikitable tr')
   result.each do |nodes|
     if (nodes.to_s.include?(source_up) || nodes.to_s.include?(source_low)) && (nodes.to_s.include?(destination_up) || nodes.to_s.include?(destination_low))
       puts nodes.content
       puts '====================================='
     end
   end
 end
rescue Interrupt
 puts "\nQuitting.."
end
