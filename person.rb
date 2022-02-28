class Person
    DEFAULT_BOOL = true
  
    def initialize(age, name = 'Unknown', parent_permission = DEFAULT_BOOL)
      @id = rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end

    # Getters
    def id
      @id
    end
    
    def name
      @name
    end

    def age()
      @age
    end

    # Setters
    def name=(name)
      @name = name
    end

    def age=(age)
      @age = age
    end

    def can_use_services?
        is_of_age? || @parent_permission
    end

    private

    def is_of_age?
      age >= 18
    end
end
