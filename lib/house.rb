# pry(main)> house = House.new("$400000", "123 sugar lane")
# #=> #<House:0x00007fccd30375f8...>
#
# pry(main)> room_1 = Room.new(:bedroom, 10, 13)
# #=> #<Room:0x00007fccd29b5720...>
#
# pry(main)> room_2 = Room.new(:bedroom, 11, 15)
# #=> #<Room:0x00007fccd2985f48...>
#
# pry(main)> room_3 = Room.new(:living_room, 25, 15)
# #=> #<Room:0x00007fccd383c2d0 @category=:living_room, @length=25, @width=15>
#
# pry(main)> room_4 = Room.new(:basement, 30, 41)
# #=> #<Room:0x00007fccd297dc30 @category=:basement, @length=30, @width=41>
#
# pry(main)> house.add_room(room_1)
#
# pry(main)> house.add_room(room_2)
#
# pry(main)> house.add_room(room_3)
#
# pry(main)> house.add_room(room_4)
#
# pry(main)> house.price_per_square_foot
# #=> 210.53
#
# pry(main)> house.rooms_sorted_by_area
# #=> [#<Room:0x00007fccd297dc30...>, #<Room:0x00007fccd383c2d0...>, #<Room:0x00007fccd2985f48...>, #<Room:0x00007fccd29b5720...>]
#
# pry(main)> house.rooms_by_category
# #=> {:bedroom=>[#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>], :living_room=> [#<Room:0x00007fccd383c2d0...>], :basement=> [#<Room:0x00007fccd297dc30...>]}
require 'pry'
class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(room_category)
    rooms_by_cat = @rooms.find_all {|room| room.category == room_category}
    rooms_by_cat
  end

  def area
    room_area = []
    @rooms.each do |room|
      room_area << room.area
    end
    room_area.sum
  end

  def price_per_square_foot
    room_area = []
    @rooms.each do |room|
      room_area << room.area
    end
    (@price.delete!('$').to_f / room_area.sum).round(2)
  end
end
