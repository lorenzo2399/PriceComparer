require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  before(:all) do
		User.all.each do |users|
			users.destroy
		end
	end

  context "User" do
    
    before(:all) do
      @user = create(:user)
      @user.save
    end

    
    describe 'Create a Relationship with as user' do
      context 'A user add a friend' do
        it 'Create a Relationship' do
          sign_in @user
          @utente=FactoryBot.create(:usera)
          post :create, params: {followed_id: @utente.id}
          expect(Relationship.last).to be_an_instance_of(Relationship)
          end
      end
      end

    end

    after(:each) do
        @utente.destroy  
      end

      after(:each) do
        Relationship.all.each do |rela|
			rela.destroy
		end
      end

end