#!/usr/bin/env ruby

require 'ruby2d'

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].sort.each {|file| require file }

set background: 'white'
set width: 1200
set height: 800

world = World.new
update do
  clear
  world.update!
end

show
