require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'

class App
  @books = []
  
  def initialize
    @sample_person = { 'id' => '1', 'name' => 'John', 'age' => '19', 'parent_permission' => true,
                       'profession' => 'Student' }
    @sample_book = { 'title' => 'The lord of the ring', 'author' => 'Jon Carefield' }
    @rental_all = Rental.new('12/3/2022', @sample_person, @sample_book)
    @person_all = Person.new('19', 'John', 'Student')
    @book_all = Book.new('The lord of the ring', 'Jon Carefield')
  end

  def books_array
    @@books
  end

  def list_books
    @book_all.list_of_books
    puts ' '
  end

  def list_persons
    @person_all.person_list
    puts ' '
  end

  def create_book
    printf 'Title:'
    title = gets.chomp
    printf 'Author:'
    author = gets.chomp
    Book.new(title, author)
    puts 'Book created successfuly'
    puts ' '
  end

  def new_person
    puts 'Do you want to create a student (1) or a teacher (2)?[input the number]:'
    num = gets.chomp
    case num
    when '1'
      printf 'name:'
      name = gets.chomp
      printf 'age:'
      age = gets.chomp
      printf 'permission parents? [Y/N]:'
      permission = gets.chomp
      true_permission = permission == 'y' || 'yes' || 'Y'
      puts "Name: #{name} Age: #{age} created successfully"
      Student.new('Year 1', age, name, 'Student', true_permission)
    when '2'
      printf 'name:'
      name = gets.chomp
      printf 'age:'
      age = gets.chomp
      printf 'specialization:'
      specialization = gets.chomp
      Teacher.new(specialization, age, name, 'Teacher')
      puts "Name: #{name} specialzation:#{specialization} Age: #{age}  Added successfuly!"
    else
      puts 'You entered a wrong number!'
    end
    puts ' '
  end

  @rentals = []

  def rental_list
    @@rentals
  end

  def create_rental
    puts 'Please select a book from the following list by number (not Id):'
    @book_all.list_of_books
    book = gets.chomp
    book_to_add = @book_all.books_array[book.to_i]
    puts 'Please select a person from the following list by number:'
    @person_all.person_list
    person_id = gets.chomp
    person_to_add = @person_all.all_persons_storage[person_id.to_i]
    printf 'Date:'
    date_to_add = gets.chomp
    Rental.new(date_to_add, person_to_add, book_to_add)
    puts 'Rental created successfuly'
    puts ' '
  end
 
  def list_rental_by_id
    puts 'Enter a person Id to see he\'s rentals'
    printf 'Id:'
    id = gets.chomp
    find_rentals = @rental_all.rental_list.select { |rental| rental['person_name']['id'] == id }
    puts 'Rentals:'
    find_rentals.each_with_index do |rental, index|
      puts "#{index + 1}) Name: #{rental['person_name']['name']},
        Book: #{rental['book']['title']} Date: #{rental['date']}"
    end
    puts ' '
  end

  def old_functions
    @rental_all.rental_list.each do |rental|
      p(rental)
    end
  end
end
