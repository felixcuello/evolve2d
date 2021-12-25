#!/usr/bin/env ruby

require 'ruby2d'

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
Dir['lib/**/*.rb'].map { |f| f.gsub(%r{^lib/}, '') }.sort.each { |file| require file }

WORLD_ROWS = 120
WORLD_COLS = 180
OBJECT_SIZE = 7
NUMBER_OF_CREATURES = ARGV[0] ? ARGV[0].to_i : 1000
SPIN_DELAY = 0

world = World.new(rows: WORLD_ROWS,
                  cols: WORLD_COLS,
                  object_size: OBJECT_SIZE)

objects = []
NUMBER_OF_CREATURES.times do
  objects << Creature.new(world: world)
end

world.randomize!(objects: objects)
world.spin!(spin_delay: SPIN_DELAY)
