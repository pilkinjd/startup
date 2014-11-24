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
end
