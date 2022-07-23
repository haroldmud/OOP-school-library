require_relative './student'

class Classroom
    attr_accessor :label

    def initialize (label)
        @label = label
    end

    def getter 
        {
          'label' => @label
        }
    end

    def setter (label)
        @label = label
    end
    def add_student
        new.Student(@label)
      end
end
    
class Book
    
    def initialize(title, author)
      @title = title
      @author = author
      @@books.push('title' => @title, 'author' => @author)
    end
    attr_accessor :title, :author
    
    def add_rental(date)
      new.Rental(date)
    end

    def list_of_books
      @@books.each_with_index do |book, index|
        puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
      end   
    end
end
    
class Rental
    def initialize(date, person, book)
     @date = date
     @person_data = person
     @book_data = book
     @@rentals.push('date' => date, 'person_name' => person, 'book' => book)
    end
    
    attr_accessor :date, :person_data, :book_data
    
    def belongs_to_book
      title = @book_data.title
      author = @book_data.author
      new.Book(title, author)
    end
    
    def belongs_to_person  
      age = @person_data.age
      name = @person_data.name
      parent_permission = @person_data.parent_permission
      new.Person(age, name, parent_permission)
    end
end
