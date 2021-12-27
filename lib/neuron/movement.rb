module Neuron
  module Movement
    def self.up(speed = 0.5)
      ->(pos) { [pos[0], pos[1] - speed] }
    end

    def self.down(speed = 0.5)
      ->(pos) { [pos[0], pos[1] + speed] }
    end

    def self.left(speed = 0.5)
      ->(pos) { [pos[0] - speed, pos[1]] }
    end

    def self.right(speed = 0.5)
      ->(pos){ [pos[0] + speed, pos[1]] }
    end

    def self.up_left(speed = 0.5)
      ->(pos) { [pos[0] - speed, pos[1] - speed] }
    end

    def self.up_right(speed = 0.5)
      ->(pos) { [pos[0] - speed, pos[1] + speed] }
    end

    def self.down_left(speed = 0.5)
      ->(pos) { [pos[0] + speed, pos[1] - speed] }
    end

    def self.down_right(speed = 0.5)
      ->(pos) { [pos[0] + speed, pos[1] + speed] }
    end

    def self.random_jump(speed = 2)
      ->(pos) {
        if rand(100).zero?
          [-pos[0] * speed, -pos[1] * speed]
        else
          [pos[0], pos[1]]
        end
      }
    end

    def self.random(speed = 0.5)
      ->(pos) { [pos[0] + rand(-speed..speed), pos[1] + rand(-speed..speed)] }
    end
  end
end
