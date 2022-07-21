require_relative './nemable'

class Base < Nameable
  def initialize(nameable)
    @nameable = nameable
    super(nameable)
  end

  def correct_name
    @nameable.correct_name
  end
end  
  
class CapitalizeDecorator < Base
  def correct_name
    @nameable.correct_name.capitalize
  end
end
  
class TrimmerDecorator < Base
  def correct_name
    if @nameable.correct_name.length <= 10
      @nameable.correct_name
    else
      @nameable.correct_name[0, 10]
    end
  end
end
