require 'rails_helper'

describe SessionsController do
  describe 'POST /sessions' do
    let(:user) { double(:user, id: 5, authenticate: true) }

    before do
      allow(User).to receive(:find_by).and_return(user)
    end

    def do_request
      post :create, sessions: { email: 'fred@example.com', password: 'secret' }
    end

    it 'checks the user with the email exists' do
      expect(User).to receive(:find_by).with(email: 'fred@example.com')
      do_request
    end

    it 'authenticates the user using the password' do
      expect(user).to receive(:authenticate).with('secret')
      do_request
    end

    it 'remembers the user id in the session' do
      do_request
      expect(session[:current_user_id]).to eq(5)
    end

    it 'redirects off to the root' do
      expect(do_request).to redirect_to(root_path)
    end

    context 'user not found' do
      before do
        allow(User).to receive(:find_by).and_return(nil)
      end

      it 'does not set the session' do
        do_request
        expect(session[:current_user_id]).to be_nil
      end

      it 'sets an invalid login flash' do
        do_request
        expect(flash[:action]).to eq('Invalid username/password combination')
      end

      it 'renders the new form again' do
        expect(do_request).to render_template(:new)
      end
    end

    context 'user password incorrect' do
      before do
        allow(user).to receive(:authenticate).and_return(false)
      end

      it 'does not set the session' do
        do_request
        expect(session[:current_user_id]).to be_nil
      end

      it 'sets an invalid login flash' do
        do_request
        expect(flash[:action]).to eq('Invalid username/password combination')
      end

      it 'renders the new form again' do
        expect(do_request).to render_template(:new)
      end
    end

  end

end
