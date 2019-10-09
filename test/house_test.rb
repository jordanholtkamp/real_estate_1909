require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_it_initalizes
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
  end

  def test_add_room
    assert_equal [], @house.rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal true, @house.rooms.include?(@room_1)
    assert_equal true, @house.rooms.include?(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end
end

