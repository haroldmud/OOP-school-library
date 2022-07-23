require_relative 'person'

class Student < Person
    @students = []
  def initialize(classroom, age, name, profession, parent_permission)
    super(age, name, profession)
      @classroom = classroom
      @@students.push('id' => @@id, 'name' => name, 'age' => age, 'parent_permission' => parent_permission, 'classroom' => @classroom)
    end

    attr_accessor :classroom

    def play_hooky
      "¯\(ツ)/¯"
    end

    def add_to_classroom(label)
      new.Classroom(label)
    end
  
    def list_students
      @@students.each_with_index do |stdnt, index|
        puts "#{index} => name: #{stdnt['name']}, age: #{stdnt['age']}"
      end
    end
end
