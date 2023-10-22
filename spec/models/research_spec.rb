require 'rails_helper'

# spec/models/review_spec.rb

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password', full_name: 'John', id: 2) }

	
  describe "validations" do
    it "is valid with valid attributes" do
      review = Review.new(
        rating: 5,
        comment: "Great product!",
        user_id: user.id,
        title: "Example Review",
        item_id: 1,
        negozio: "Example Store"
      )
      expect(review).to be_valid
    end
	
    

    it "is not valid without a user_id" do
      review = Review.new(
        rating: 5,
        comment: "No user_id provided",
        title: "Example Review",
        item_id: 1,
        negozio: "Example Store"
      )
      expect(review).not_to be_valid
    end

   
  end

  describe "associations" do
    it "belongs to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
