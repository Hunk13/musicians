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
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      # it 'save the new post in database' do
      #   expect { post :create, post: attributes_for(:post) }.to change(Post, :count).by(1)
      # end

      # it 'redirect ti show view' do
      #   post :create, post: attributes_for(:post)
      #   expect(response).to redirect_to post_path(assigns(:post))
      # end
    end

    context 'with invalid attributes' do
      # it 'does not save the post' do
      #    expect { post :create, post: attributes_for(:invalid_post) }.to_not change(Post, :count)
      # end

      # it 're-render new view' do
      #   post :create, post: attributes_for(:invalid_post)
      #   expect(response).to render_template :new
      # end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assings the requested musician to @musician' do
        patch :update, id: musician, musician: attributes_for(:musician)
        expect(assigns(:musician)).to eq musician
      end

      # it 'changes post attributes' do
      #   patch :update, id: post, post: { caption: 'new caption', image: 'new image' }
      #   post.reload
      #   expect(post.caption).to eq 'new caption'
      #   expect(post.image).to eq 'new image'
      # end

      # it 'redirect to updatet post' do
      #   patch :update, id: post, post: attributes_for(:post)
      #   expect(response).to redirect_to post
      # end
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
