require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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


    describe "Get #show" do
		it "show search page" do
			sign_in @user
			get :show, params: { id: @user.id }
			expect(response).to render_template (:show)
		end
	end
	    

	describe "Destroy" do
            it "destroy" do
				sign_in @user
                expect{delete :destroy, params: {id: @user.id}}.to change(User, :count).by(-1)
            end
    end
end


context "Admin" do
		
		
	before(:all) do
		@user = create(:admin)
		@user.save
	end

	describe "Set mod" do
		it "create a mod" do
			sign_in @user
			@utente=FactoryBot.create(:usera)
			get :set_mod , params: {id: @utente.id}
			@utente.reload
			expect(@utente.role).to eq(2)
		end
	end

	describe "Remove mod" do
		it "Remove a mod" do
			sign_in @user
			@utente=FactoryBot.create(:moderator)
			get :remove_mod , params: {id: @utente.id}
			@utente.reload
			expect(@utente.role).to eq(0)
		end
	end

	describe "Eliminate user" do
		it "Eliminate a user" do
			sign_in @user
			@utente=FactoryBot.create(:user)
			get :destroy , params: {id: @utente.id}
			expect{delete :destroy, params: {id: @user.id}}.to change(User, :count).by(-1)
		end
	end

end


end
		