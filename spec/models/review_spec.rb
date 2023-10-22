# spec/models/review_spec.rb
require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password', full_name: 'John') }
  let(:review) { Review.new(user: user, rating: 4, comment: 'bello') }

  it 'is valid with valid attributes' do
    @prova=FactoryBot.build(:review)
    expect(@prova).to be_valid
  end

  it 'is valid without content' do
    review.comment = nil
    expect(review).not_to be_valid
  end

  it 'is not valid without a user' do
    review.user = nil
    expect(review).not_to be_valid
  end

  it 'belongs to a user' do
    expect(Review.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
end
