require_relative './student'
require_relative './teacher'
require_relative './nameable'

class Person < Nameable 
    extend Student
    extend Teacher

    attr_reader :id
    attr_writer :name, :age, :parent_permission

    def initializing (age, name, parent_permission: true)
        super(self)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
   
    def setter(name, age)
        @name = name
        @age = age
    end

    def getter
        {
          'id' => @id,
          'name' => @name,
          'age' => @age
        }
    end

    def isof_age?
        age > 18
    end

    def can_use_services?
          @parent_permission == true || isof_age?  
    end

    def correct_name
      @name
    end

    private :isof_age?
end

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name
  