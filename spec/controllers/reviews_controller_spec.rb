require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  before(:all) do
		User.all.each do |users|
			users.destroy
		end
	end

  before(:all) do
		Review.all.each do |rev|
			rev.destroy
		end
	end

  context "User" do
    
    before(:all) do
      @user = create(:user)
      @user.save
    end

    
    describe 'Create a Review as user' do
      context 'A user create a review' do
        it 'Create a review' do
          sign_in @user
          @rese=Review.new(title: "Rocky",rating: 35, comment: "Top", item_id: 555 ,negozio: "Ebay", user_id: @user.id)
          post :create, params: { user_id: @rese.user_id, id: @rese.id, review: { title: @rese.title, rating: @rese.rating, comment: @rese.comment, item_id: @rese.item_id,  negozio: @rese.negozio, user_id: @rese.user_id}}
          review=Review.find_by(user_id: @user.id)
          expect(review).to be_present
          end
      end
      end
    
   describe 'Update review' do
    context 'A user with valid parameters' do
      it 'update a review' do
        sign_in @user
        @review=Review.new(title: "Rocky",rating: 35, comment: "Top", item_id: 555 ,negozio: "Ebay", user_id: @user.id)
        @review.save
        @rece=Review.new(title: @review.title,rating: 3, comment: "bellina", item_id: @review.item_id ,negozio: @review.negozio, user_id: @user.id)
        put :update, params: { user_id: @review.user_id, id: @review.id, review: { title: @rece.title ,rating: @rece.rating,
        comment: @rece.comment, item_id: @rece.item_id, negozio: @rece.negozio, user_id: @rece.user_id}}
        @review.reload
        expect(@review.comment).to eq("bellina")
        
      end
    end
  end

    describe 'Destroy review' do
      context 'As user i destroy my review' do
        it 'Destroy a review' do
          sign_in @user
          @rece=Review.new(title: "il tramonto",rating: 3, comment: "bellina", item_id: 555 ,negozio: "Ebay", user_id: @user.id)
          @rece.save
          get :destroy , params: {user_id: @user.id,id: @rece.id}
          expect(Review.exists?(@rece.id)).to be false
        end
      end
  end
end

before(:all) do
  @user = create(:moderator)
  @user.save
end

  context "As moderator" do
    describe 'Destroy a review' do
      context 'As moderator i destroy a review' do
        it 'Destroy a review' do
          sign_in @user
          @utente=FactoryBot.create(:usera)
          @rece=Review.new(title: "il tramonto",rating: 3, comment: "bellina", item_id: 555 ,negozio: "Ebay", user_id: @utente.id)
          @rece.save
          get :destroy , params: {user_id: @utente.id,id: @rece.id}
          expect(Review.exists?(@rece.id)).to be false
        end
      end
  end

end
end