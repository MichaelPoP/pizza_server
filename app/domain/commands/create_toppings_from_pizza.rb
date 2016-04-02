module Commands
  class CreateToppingsFromPizza
    def initialize repo: Repositories::Topping
      @repo = repo
    end

    def call pizza:
      toppings(pizza)
    end

    private

    def toppings(pizza)
      pizza['toppings'].map do |topping|
        @repo.create name: topping
        topping
      end
    end
  end
end
