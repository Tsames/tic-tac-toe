class Players
  attr_accessor :name, :piece
  @@pieces = ['X', 'O']
  def initialize(name)
    @piece = @@pieces.shift()
    @name = name
  end
end