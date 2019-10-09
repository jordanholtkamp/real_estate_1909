# pry(main)> require './lib/room'
# #=> true
#
# pry(main)> room = Room.new(:bedroom, 10, 13)
# #=> #<Room:0x00007fa53b9ca0a8 @category=:bedroom, @length=10, @width=13>
#
# pry(main)> room.category
# #=> :bedroom
#
# pry(main)> room.area
# #=> 130

class Room
  def initialize(category, width, length)
    @category = category
    @width = width
    @length = length
  end
end