#!/usr/bin/env ruby
# encoding: UTF-8

require 'typhoeus'
require 'colorize'
require 'nokogiri'

@url = ['http://127.0.0.1:3000']

def remote_request( rfid )
    hydra = Typhoeus::Hydra.hydra
    cnt = 0
    @url.each{ |ad| 
            puts "===================================================".yellow
            puts "#{Time.now} Изпращатане на заявка до #{ad}".red
            data = Typhoeus::Request.new("#{ad}/events?rfid=#{rfid}")
            data.on_complete do |response|
                    doc = Nokogiri::HTML( response.body.delete("\n") )
                    res =  doc.css( "res" ).text
                    if ( res == "137" ) then 
                    puts "Статус: #{response.code} ==> Успешна регистрация на: #{doc.css( "name" ).text} за #{response.total_time} sec.".blue 
                                        end
                    local  = File.read("keys").include?(rfid)
                         if (res == "137" or local == true ) 
                                   then
                                         open(cnt)
                                        cnt += 1
                                   end  
                    end
            hydra.queue( data )
            }
        hydra.run            
end

def open(cnt)
   if (cnt == 0)
         then
         puts "offnen"
         sleep(5)
         puts "geschlossen"
        end
end

################################################################

    while true
            rfid = gets.chomp
            remote_request(rfid)
    end

################################################################

