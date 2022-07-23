require_relative './person'

class Teacher < Person
  @teachers = []

  def initialize(specialization, age, name, profession)
    super(age, name, profession)
        @specialization = specialization
        @@teachers.push('name' => name,
                        'specialization' => specialization,
                        'age' => age)
  end

  def can_use_services? 
    true
  end

  def teachers_list
    @@teachers.each_with_index do |teacher, index|
      puts "#{index} || name: #{teacher['name']}, age: #{teacher['age']}, specialization: #{teacher['specialization']}"
    end
  end  
end
