require 'rails_helper'

RSpec.describe MenusController do
    describe 'GET#index' do
        context 'all menus' do
            it "populates an array of all menus" do
                nasi_uduk = create(:menu, name: "Nasi Bakar")
                kerak_telor = create(:menu, name: "Kerak Telor")
                get :index
                expect(assigns(:menus)).to match_array([nasi_uduk, kerak_telor])
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
            get :show, params: { id: menu }
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
        # valid arguments
        context 'with valid attributes' do
            it 'saves the new menu in the database' do
                menu = create(:menu)
                expect{
                    post :create, params: { menu: attributes_for(:menu) }
                }.to change(Menu, :count).by(1)
            end
            it 'redirects to menus#show' do
                post :create, params: { menu: attributes_for(:menu) }
        expect(response).to redirect_to(menu_path(assigns[:menu]))
            end
        end
        # invalid arguments
        context "with invalid attributes" do
            it "does not save the new menu in the database" do
                expect{
                    post :create, params: { menu: attributes_for(:nil_menu) }
                }.not_to change(Menu, :count)
            end

            it "re-renders the :new template" do
                post :create, params: { menu: attributes_for(:nil_menu) }
                expect(response).to render_template :new
            end
        end
    end
end