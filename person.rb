require_relative './student'
require_relative './teacher'

class Person
    extend Student
    extend Teacher

    attr_reader :id
    attr_writer :name, :age, :parent_permission

    def state (name: 'Unknown', age, parent_permission: true )
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def self.inherited(subclass)
        subclass.define_method :override do
          parent_permission = true
          super
        end
    end
   
    def set(name, age)
        @name = name
        @age = age
    end

    def get
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

    private :isof_age?
end    