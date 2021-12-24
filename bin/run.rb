#!/usr/bin/env ruby

require 'ruby2d'

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
Dir['lib/*'].map { |f| f.gsub(%r{^lib/}, '') }.sort.each { |file| require file }

WORLD_ROWS = 180
WORLD_COLS = 200
OBJECT_SIZE = 5
NUMBER_OF_CREATURES = 500

world = World.new(rows: WORLD_ROWS,
                  cols: WORLD_COLS,
                  object_size: OBJECT_SIZE)

objects = []
NUMBER_OF_CREATURES.times do
  objects << Creature.new(world: world)
end

world.randomize!(objects: objects)
world.spin!
