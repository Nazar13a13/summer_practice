require 'date'

module Validation
    def valid_name?(str)
        return false if str.nil? || str.empty? || str.length > 40
        /^[a-zA-Z\s\-]{2,}+$/.match?(str)
    end

    def valid_inn?(str)
        return false if str.nil? || str.empty?
        /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.match?(str)
    end

    def after_date?(date)
        return false if date.nil? || !date.is_a?(Date)
        date <= Date.today
    end
end     
