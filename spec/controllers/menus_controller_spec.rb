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
    describe 'GET#show' do
        it 'assigns the requested menu to @menu' do
            menu = create(:menu)
            get :show, params: {id: menu}
            expect(assigns(:menu)).to eq menu
        end
        it 'renders the :show template' do
            menu = create(:menu)
            get :show, params: {id: menu}
            expect(response).to render_template :show
        end
    end
    describe 'GET#new' do
        it 'assigns a new menu to @menu' do
            get :new
            expect(assigns(:menu)).to be_a_new(Menu)
        end
        it 'renders the :new template' do
            get :new
            expect(:response).to render_template :new
        end
    end
    describe 'GET#edit' do
        it 'assigns the requested menu to @menu' do
            menu = create(:menu)
            get :edit, params: { id: menu }
            expect(assigns(:menu)).to eq menu
        end
        it 'renders the :edit template' do
            menu = create(:menu)
            get :edit, params: { id: menu }
            expect(response).to render_template :edit
        end
    end
    describe 'POST#create' do
        context 'with valid attributes' do
            it 'saves the new menu in the database' do
                expect{
                    post :create, params: { menu: attributes_for(:menu) }
                }.to change(Menu, :count).by(1)
            end
            it 'redirects to menus#show' do
                post :create, params: { menu: attributes_for(:menu) }
                expect(response).to redirect_to(menu_path(assigns[:menu]))
            end
        end
    end
end