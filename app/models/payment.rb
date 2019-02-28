require 'payjp'

class Payment
  Payjp::api_key = "sk_test_0448f2e37c2d2fd54841839c"
  
  def self.create_customer(email, name)
      Payjp::Customer.create(
          email: email,
          description: name
      )
  end
  
  def self.add_card(customer_id, token)
    customer = Payjp::Customer.retrieve(customer_id)
    customer.cards.create(card: token)
  end
  
  def self.charge(amount, customer_id)
    Payjp::Charge.create(
      amount: amount,
      customer: customer_id,
      currency: "jpy"
    )
  end
end