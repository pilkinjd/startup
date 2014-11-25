require 'rails_helper'

describe UsersController do
  describe '.new' do
    it 'assigns a blank user' do
      expect(User).to receive(:new)
      get :new
    end
  end

  describe '.create' do
    let(:params) { { name: 'Fred', email: 'fred@example.com', password: 'secret', password_confirmation: 'secret' } }
    let(:user)   { User.new(params) }

    before do
      allow(User).to receive(:new).with(params).and_return(user)
    end

    it 'saves the user' do
      expect(user).to receive(:save)
      post :create, user: params
    end

    it 'redirects to the user show page' do
      post :create, user: params
      expect(response).to redirect_to(user_path(user))
    end

    it 'renders the form again if the save fails' do
      allow(user).to receive(:save).and_return(false)
      post :create, user: params
      expect(response).to render_template(:new)
    end
  end

  describe '#update' do
    let(:params) { { name: 'Bert', email: 'bert@example.com' } }
    let!(:user)  { User.create!(name: 'Fred', email: 'fred@example.com', password: 'secret', password_confirmation: 'secret') }

    before do
      allow(User).to receive(:find_by).with(id: user.id.to_s).and_return(user)
    end

    it 'updates the user' do
      expect(user).to receive(:update).with(params)
      put :update, id: user.id, user: params
    end

    it 'redirects to the user show page' do
      put :update, id: user.id, user: params
      expect(response).to redirect_to(user_path(user))
    end

    it 'renders the form again if the save fails' do
      allow(user).to receive(:update).and_return(false)
      put :update, id: user.id, user: params
      expect(response).to render_template(:edit)
    end
  end
end
