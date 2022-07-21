class Nameable
    attr_accessor :Nameable

    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        raise NotImplementedError, "{#self.class} has an unexpected partial read from random method '{#_method_}'"
    end
end
