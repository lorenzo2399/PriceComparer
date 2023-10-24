require 'rails_helper.rb'



RSpec.describe PagesController, type: :controller do

	before(:all) do
		User.all.each do |users|
			users.destroy
		end
	end

context "any user" do

    before(:all) do
      @user = create(:user)
      @user.save
    end
    describe "GET #home" do
      it "returns a successful response" do
        sign_in @user
        get :home
        expect(response).to be_successful
      end

      it "assigns the current user" do
        sign_in @user
        get :home
        expect(assigns(:user)).to eq(@user)
      end

      it "assigns search results if the user has a favorite category" do
        sign_in @user
        get :home
        expect(assigns(:search_results)).not_to be_nil
      end

      it "does not assign search results if the user has no favorite category" do
        @utente=FactoryBot.create(:userc)
        sign_in @utente
        get :home
        expect(assigns(:search_results)).to be_nil
      end
    end
    
    describe 'GET #search' do
      it 'assigns instance variables and renders the template' do
        sign_in @user
        get :search, params: {
          keyword: 'lamp',
          sort_order: 'PricePlusShippingLowest',
          minprice: 0,
          maxprice: 100,
          instaexp: 1,
          place: 'US',
          minf: '0',
          maxtime: '10'
        }

        expect(assigns(:users)).to be_a(ActiveRecord::Relation)
        expect(assigns(:keyword)).to eq('lamp')
        expect(assigns(:sort_order)).to eq('PricePlusShippingLowest')
        expect(assigns(:minprice)).to eq(0)
        expect(assigns(:maxprice)).to eq(100)
        expect(assigns(:instaexp)).to eq(1)
        expect(assigns(:place)).to eq('US')
        expect(assigns(:minf)).to eq('0')
        expect(assigns(:maxtime)).to eq('10')


        expect(response).to render_template(:search)
      end

    end
    
    describe 'GET #search' do
      it 'assigns a non-empty @search_results' do
        sign_in @user
        controller_instance = PagesController.new
    allow(controller_instance).to receive(:search)

        get :search, params: {
          keyword: 'lamp',
          sort_order: 'PricePlusShippingLowest',
          minprice: 0,
          maxprice: 100,
          instaexp: 1,
          place: 'US',
          minf: '0',
          maxtime: '10'
        }

        expect(assigns(:search_results)).not_to be_nil
      end
    end
  end  
  
end
