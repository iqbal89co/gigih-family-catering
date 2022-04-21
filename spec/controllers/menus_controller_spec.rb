require 'rails_helper'

RSpec.describe MenusController do
    describe 'GET#index' do
        context 'all menus' do
            it "populates an array of all menus" do
                menu1 = create(:menu)
                menu2 = create(:menu)
                get :index
                expect(assigns(:menus)).to match_array([menu1, menu2])
            end
            it "renders the :index template" do
                get :index
                expect(response).to render_template :index
            end
        end
    end
end