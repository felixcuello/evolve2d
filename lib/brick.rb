# frozen_string_literal: true

require 'basic_object'

# This class represent one of the creatures that live in the world
class Brick < BasicObject
  attr_reader :color

  def initialize
    @color = 'gray'
  end
end
