require 'rails_helper'

RSpec.describe ResearchesController, type: :controller do
  before(:all) do
		User.all.each do |users|
			users.destroy
		end
	end

  before(:all) do
		Research.all.each do |rev|
			rev.destroy
		end
	end

  context "User" do
    
    before(:all) do
      @user = create(:user)
      @user.save
    end

    
   describe 'Save a Research' do
    context 'A user save a research' do
      it 'Save a research' do
        sign_in @user
        @rese=Research.new(title: "l'alba", item_id: 55, user_id: @user.id, price: 64, time: 5, feed:55, url: "www.prova.it", location: "Roma")
        post :create, params: { user_id: @rese.user_id, id: @rese.id, research: { title: @rese.title, price: @rese.price, location: @rese.location, item_id: @rese.item_id, url: @rese.url, feed: @rese.feed, time: @rese.time, user_id: @rese.user_id}}
        ricerca=Research.find_by(user_id: @user.id)
        expect(ricerca).to be_present
        end
    end
    end
    
    describe 'Destroy research' do
        context 'As user i destroy my research' do
          it 'Destroy a research' do
            sign_in @user
            @rese=Research.new(title: "Penna", item_id: 55, user_id: @user.id, price: 64, time: 5, feed:55, url: "www.prova.it", location: "Roma")
            @rese.save
            get :destroy , params: {user_id: @user.id,id: @rese.id}
            expect(Research.exists?(@rese.id)).to be false
          end
        end
    end
end
end