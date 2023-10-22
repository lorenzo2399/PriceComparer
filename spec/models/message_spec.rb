require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password', full_name: 'John', id: 2) }

	
  describe "validations" do
    it "is valid with valid attributes" do
      message = Message.new(
        content: "bello",
        
        user_id: user.id,
        
      )
      expect(message).to be_valid
    end
	
    

    it "is not valid without a user_id" do
      message = Message.new(
        content: "bella"
      )
      expect(message).not_to be_valid
    end

   
  end

  describe "associations" do
    it "belongs to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end