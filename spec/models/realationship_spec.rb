# spec/models/review_spec.rb
require 'rails_helper'

RSpec.describe Relationship, type: :model do

  before(:all) do
		User.all.each do |users|
			users.destroy
		end
	end

context "As user" do
  
  
  it 'is valid with valid attributes' do
    @user=FactoryBot.create(:user)
    @utente=FactoryBot.create(:usera)
    @rela=Relationship.create(follower_id: @user.id,followed_id: @utente.id)
    expect(@rela).to be_valid
    
  end

  it 'is  not valid following itself' do
    @user=FactoryBot.create(:user)
    
    @rela=Relationship.create(follower_id: @user.id,followed_id: @user.id)
    expect(@rela).not_to be_valid

  end

 
  after(:each) do
    @user.destroy  
  end

  end

  describe "associations" do
    it "belongs to a user" do

      expect(Relationship.reflect_on_association(:follower).macro).to eq(:belongs_to)
    expect(Relationship.reflect_on_association(:followed).macro).to eq(:belongs_to)
    end
  end

end