#!/usr/bin/env ruby

require 'ruby2d'

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
Dir['lib/**/*.rb'].map { |f| f.gsub(%r{^lib/}, '') }.sort.each { |file| require file }

WORLD_ROWS = 120
WORLD_COLS = 200
OBJECT_SIZE = 6
NUMBER_OF_CREATURES = 1300
SPIN_DELAY = 0
NUMBER_OF_SPINS = 100

world = World.new(rows: WORLD_ROWS,
                  cols: WORLD_COLS,
                  object_size: OBJECT_SIZE)

objects = []

if ARGV[0]
  File.readlines(ARGV[0]).each do |line|
    movement_neuron_connections, color = line.strip.split /,/
    movement_neuron_connections = movement_neuron_connections
                                  .split(/\s/)
                                  .map { |n| n == '1' }

    objects << Creature.new(world: world,
                            movement_neuron_connections: movement_neuron_connections,
                            color: color)
  end

  while objects.count < NUMBER_OF_CREATURES
    objects << objects.sample
  end
else
  NUMBER_OF_CREATURES.times do
    objects << Creature.new(world: world)
  end
end

world.randomize!(objects: objects)
world.spin!(number_of_spins: NUMBER_OF_SPINS,
            spin_delay: SPIN_DELAY)
