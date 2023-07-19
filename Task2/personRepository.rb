require_relative "person"
require 'date'
    
class PersonRepository
    attr_reader :people
    def initialize()
    @people = []
    end

    def add(person)
        if person.is_a?(Person)
            @people << person
        else
            raise ArgumentError, "Error in the parameter. Argument must be an instance of Person class"
        end
    end

    def show()
        @people.each do |person|
            puts (person)
        end
    end

    def get()
        @people
    end

    def get_by_id(id)
        @people.find { |person| person.id == id }
    end

    def delete_by_id(id)
        person = get_by_id(id)
        if person
            @people.delete(person)
        end
    end
end
=begin
people = PersonRepository.new()
people.add(Person.new("Name Ex", "id1212312", "2000-01-01"))
people.add(Person.new("dfd45", "id3242545", "2038-11-01"))
people.add(Person.new("Beyr-Wen", "id876788787", "1990-01-01"))
puts (people.show.to_s)
people.delete_by_id("id3242545")
puts (people.show.to_s)

sleep (1000)
=end
