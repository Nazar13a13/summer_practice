require "test/unit"
require_relative "person"

class PersonTest < Test::Unit::TestCase

    def setup
        @person = Person.new("Name Ex", "id32423422356", "2000-01-01")
    end

    ['Name Ex', 'Name-Ex', 'Name'].each do |name|
    define_method("test_valid_name_ = \"#{name}\"") do
        @person.name = name
        assert_equal(name, @person.name, "Name #{name} is valid")
      end
    end

    [' ', '', '-', '12343', 'Nweq23', 'Awewq0-'].each do |name|
    define_method("test_invalid_name_ = \"#{name}\"") do
        assert_raise { @person.name = name }
      end
    end

    ['id32476598762', 'id324765987', 'VDs545432347', 'BF767569ds8'].each do |id|
    define_method("test_valid_id_ = \"#{id}\"") do
        @person.id = id
        assert_equal(id, @person.id, "id #{id} is valid")
      end
    end

    [' ', '', '-', 'afwadawdaw', '12325345', 'SDfSEFE'].each do |id|
    define_method("test_invalid_id_ = \"#{id}\"") do
        assert_raise { @person.id = id }
      end
    end

    ['2000-02-02', '1990-01-09', '1900-09-09'].each do |birth_date|
    define_method("test_valid_birth_date_ = \"#{birth_date}\"") do
        @person.birth_date = birth_date
        assert_equal(birth_date, @person.birth_date, "Birth date #{birth_date} is valid")
      end
    end

    [' ', '', '-', '2026-09-09', '2060-09-09', 2040-11-01].each do |birth_date|
    define_method("test_invalid_birth_date_ = \"#{birth_date}\"") do
        assert_raise { @person.birth_date = birth_date }
      end
    end
end
