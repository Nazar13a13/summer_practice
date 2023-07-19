require 'date'
require_relative "validation"

module ConsoleInput 
    include Validation

    def get_input_name()
        input = nil
        until input && valid_name?(input)
            print "Input name (for example, Boris Strugatsky): "
            input = gets.chomp
        end
        input
    end 

    def get_input_id()
        input = nil
        until input && valid_inn?(input)
            print "Input id (for example, id1212312): "
            input = gets.chomp
        end
        input
    end  


    def valid_date_format?(input)
        /^\d{4}-\d{2}-\d{2}$/.match?(input) && after_date?(Date.parse(input))
        rescue ArgumentError
        false
    end

    def get_input_date()
        input = nil
        until input && valid_date_format?(input) 
            print "Input date (yyyy-mm-dd format): "
            input = gets.chomp
        end
        Date.parse(input)
    end
end

=begin 
g = ""
g.extend(ConsoleInput)
g.get_name_input()
g.get_inn_input()
g.get_date_input()
sleep (1000)
=end 
