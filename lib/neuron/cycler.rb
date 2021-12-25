module Neuron
  def self.cycler
    lambda do
      @cycler ||= 0
      @up ||= 1

      if @up == 1
        @cycler += 0.1
        @up = 0 if @cycler >= 2
      else
        @cycler -= 0.1
        @up = 1 if @cycler <= -2
      end

      @cycler.to_i
    end
  end
end
