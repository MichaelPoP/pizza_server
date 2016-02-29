require "rails_helper"

RSpec.describe "Toppings Controller", :type => :request do
  describe "/toppings" do

    describe "GET" do
      let(:toppings) { Commands::GetToppings.run }

      before do
        post "/toppings", {topping: {name: "Pepperoni"}}
      end

      it do
        get "/toppings"
        expect(response.body).to be == toppings.to_json
      end
    end

    describe "POST" do
      it "Creates a topping" do
        expect(Commands::GetToppings.run.count).to be == 0
        post "/toppings", {topping: {name: "Pepperoni"}}
        expect(Commands::GetToppings.run.count).to be == 1
      end
    end
  end
end
