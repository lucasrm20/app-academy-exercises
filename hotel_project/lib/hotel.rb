require_relative "room"

class Hotel
  
  def initialize(name, rooms)
    @name = name
    @rooms = rooms.map { |key, value| [key, Room.new(value)] }.to_h
  end
  
  def name
    @name
      .split(' ')
      .map(&:capitalize)
      .join(' ')
  end
  
  def rooms
    @rooms
  end
  
  def room_exists?(name)
    rooms.has_key?(name)
  end
  
  def check_in(person, room)
    if !room_exists?(room)
      puts 'sorry, rooms does not exist'
    else
      if @rooms[room].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    end
  end
  
  def has_vacancy?
    @rooms.any? { |k, v| !v.full? }
  end
  
  def list_rooms
    @rooms.each do |k, v|
      puts k + '.*' + v.available_space.to_s
    end
  end
  
end
