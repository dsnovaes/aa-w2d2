require_relative "room"

class Hotel
    def initialize(name,rooms)
        @name = name
        @rooms = {}
        
        rooms.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.include?(room_name)
    end

    def check_in(guest,room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(guest)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.any? { |k,v| v.capacity > v.occupants.count }
    end

    def list_rooms
        @rooms.each do |k,v|
            puts k + " " + @rooms[k].available_space.to_s
        end
    end
    



end