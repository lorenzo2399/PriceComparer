require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before(:all) do
		User.all.each do |users|
			users.destroy
		end
	end

  before(:all) do
		Message.all.each do |rev|
			rev.destroy
		end
	end

  context "User" do
    
    before(:all) do
      @user = create(:user)
      @user.save
    end
 
    
    
   describe 'Create a Message' do
    context 'A user create a message' do
      it 'Create message' do
        sign_in @user
        @message=Message.new(content: "prova", user_id: @user.id)
        @message.save
        post :create, params: { user_id: @message.user_id, id: @message.id, message: { content: @message.content ,user_id: @message.user_id}}
        ricerca=Message.find_by(user_id: @user.id)
        expect(ricerca).to be_present
        end
    end
    end
    
    end

    context "As admin" do

      before(:all) do
        User.all.each do |users|
          users.destroy
        end
      end
        before(:all) do
            @user = create(:admin)
            @user.save
          end

        describe 'Resolve a Message' do
            context 'As a admin resolve a message' do
              it 'Resolve message' do
                sign_in @user
                @utente=FactoryBot.create(:user)
                @mess=Message.create(content: "aiuto", user_id:@utente.id)
                get :destroy , params: {user_id: @mess.user_id, id: @mess.id}
                expect(Message.exists?(@mess.id)).to be false

end
end
end
end

context "As moderator" do
  before(:all) do
		User.all.each do |users|
			users.destroy
		end
	end

  before(:all) do
      @user = create(:moderator)
      @user.save
    end

  describe 'Resolve a Message' do
      context 'As a moderator resolve a message' do
        it 'Resolve message' do
          sign_in @user
          @utente=FactoryBot.create(:user)

          @mess=Message.create(content: "aiuto", user_id:@utente.id)
          get :destroy , params: {user_id: @mess.user_id, id: @mess.id}
          expect(Message.exists?(@mess.id)).to be false

end
end
end
end

end