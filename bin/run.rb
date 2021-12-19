#!/usr/bin/env ruby

require 'ruby2d'

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
Dir['lib/*'].map { |f| f.gsub(%r{^lib/},'') }.sort.each { |file| require file }

world = World.new(rows: 80, cols: 120)

creatures_number = 50
creatures_number.times do
  added = false
  until added
    creature = Creature.new(world: world,
                            row: rand(world.rows),
                            col: rand(world.cols))

    added = world.set!(row: creature.row,
                       col: creature.col,
                       object: creature)
  end
end

world.spin!
