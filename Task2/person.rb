require_relative "validation"
require_relative "consoleInput"

class Person
    include Validation
    include ConsoleInput
    attr_accessor :name, :id, :birth_date

    def initialize(full_name, id, birth_date)
      set_name(full_name)
      set_id(id)
      set_birthDate(birth_date)
    end

    def set_name(full_name)
        if valid_name?(full_name)
            @name = full_name
        else
            puts "Invalid name"
            @name = get_input_name()
        end
    end

    def set_id(id)
        if valid_inn?(id)
            @id = id
        else
            puts "Invalid id"
            @id = get_input_id()
        end
    end

    def set_birthDate(birth_date)
        if valid_date_format?(birth_date)
            @birth_date = Date.parse(birth_date)  
        else
            puts "Invalid date format"
            @birth_date = get_input_date()
        end
    end

    def info
        puts ("All the info about the person:\nFull name: #{name}\nid: #{id}\nBirth date: #{birth_date}\n")
    end

    def validation
        puts ("isName: #{valid_name?(name)}\nisID: #{valid_inn?(id)}\nisBirthDate: #{after_date?(birth_date)}")
        puts ("Validation passed: #{valid_name?(name) && valid_inn?(id) && after_date?(birth_date)}\n\n")
    end
    
end

=begin 
person_1 = Person.new("Name Ex", "id32423422356", "2000-01-01")
person_1.info
person_1.validation
sleep (1000)
=end 
