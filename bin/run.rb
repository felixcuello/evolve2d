#!/usr/bin/env ruby

require 'ruby2d'

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].sort.each {|file| require file }

world = World.new(rows: 80, cols: 120)
world.spin!
