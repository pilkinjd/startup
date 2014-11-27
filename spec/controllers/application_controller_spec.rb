require 'rails_helper'

describe ApplicationController do
  describe 'admin_only' do
    let(:user) { User.create(name: 'Fred', email: 'fred@example.com', password: 'secret', password_confirmation: 'secret') }

    before do
      session[:current_user_id] = user.id
    end

    it 'returns true if the user is an admin' do
      user.update(admin: true)
      expect(@controller.admin_only).to be_truthy
    end

    context 'user is not an admin' do
      before do
        allow(@controller).to receive(:redirect_to).and_return(true)
      end

      it 'sets a not authorised flash' do
        @controller.admin_only
        expect(flash[:alert]).to eq('You are not authorised to do that.')
      end

      it 'redirects off if the user is not an admin' do
        expect(@controller).to receive(:redirect_to).with(root_path)
        @controller.admin_only
      end
    end
  end

end
