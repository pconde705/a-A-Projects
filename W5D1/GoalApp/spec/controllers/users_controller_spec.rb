require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
      it 'renders the new links page' do
        # this line simulates a "GET" request to the LinksController that hits the #new method, passing in `{link: {}}` as params.
        get :new

        # here we check to make sure that the response renders back the new template
        expect(response).to render_template('new')
        expect(response).to have_http_status(200)
      end
    end

    describe "create methods" do
      context "with valid params" do

        it 'logs user in on success' do
          post :create, params:{user:{username: "username", password: 'password' } }
          expect(session[:session_token]).to_not be_nil
        end

        it 'redirects to goals index on success' do
          post :create, params:{user:{username: "username", password: 'password' } }
          expect(response).to redirect_to('/goals')
        end
      end

      context "with invalid params" do
        it 'render new page on failure' do
          post :create, params:{user:{username: "username", password: 'a' } }
          expect(response).to render_template('new')

        end
      end
    end
end
