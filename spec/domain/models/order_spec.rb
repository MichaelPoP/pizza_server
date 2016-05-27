require "rails_helper"

RSpec.describe Models::Order do
  subject { described_class.new({ 'items' => [pizza], 'customer' => customer})}
  
  let(:pizza) do
    Models::Pizza.new(
      "name"        => "Sicillian",
      "description" => "A Roundish Pizza with sauce",
      "toppings"    => ["roots", "pig pieces"]
    )
  end

  let(:customer) do
    Models::Customer.new({ 'first_name' => 'Chris', 'last_name' => 'Young' })
  end

  it 'has order items' do
    subject.add_item(pizza: pizza, quantity: 1, price: 5.00)
    expect(subject.items.first.pizza).to eq pizza
  end
end


