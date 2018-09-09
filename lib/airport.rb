class Airport
  attr_accessor :hangar, :capacity
  attr_reader :name
  def initialize(name, capacity = 1)
    @hangar = []
    @name = name
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "I don't care if you're running out of fuel, it's too stormy to aid you. Keep circling!" if stormy?
    raise "Full capacity. Keep flying buddy." if capacity_full?
    store_plane(plane)
  end
  def store_plane(plane)
     @hangar << plane
  end

  def take_off(plane)
    raise "Due to adverse weather conditions, all planes are to remain grounded." if stormy?
    i = nil
    hangar.each_with_index do |stored_plane, index|
      if stored_plane[:flight_num] == plane[:flight_num]
        i = index
        break
      end
    end
    puts "Flight #{plane[:flight_num]} taking off, heading for #{plane[:destination]}"
    hangar.delete_at(i)
  end

  def stormy?
    rand(4) == 1
  end

  def capacity_full?
    hangar.length >= capacity
  end
end
