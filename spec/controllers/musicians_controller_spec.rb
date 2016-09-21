require 'rails_helper'

RSpec.describe MusiciansController, type: :controller do
  let(:user) { create(:user) }
  let(:musician) { create(:musician) }
  login_user

  describe "GET #index" do
    let(:musician) { create_list(:musician, 2) }
    before do
      get :index
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, id: musician }

    it 'assings the requested musician to @musician' do
      expect(assigns(:musician)).to eq musician
    end

    it 'tender show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new musician to @musician' do
      expect(assigns(:musician)).to be_a_new(Musician)
    end
    it 'render new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: musician }
    it 'assings the requested musician to @musician' do
      expect(assigns(:musician)).to eq musician
    end
    it 'render new template' do
      expect(response).to render_template :edit
    end

    context 'invalid attributes' do
      before { patch :update, id: musician, musician: { name: nil } }

      it 'does not change attributes' do
        musician.reload
        expect(musician.name).to eq 'Vasya'
      end

      it 're-render edit template' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { musician }

    it 'delete musician' do
      expect{ delete :destroy, id: musician }.to change(Musician, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, id: musician
      expect(response).to redirect_to musicians_path
    end
  end
end
