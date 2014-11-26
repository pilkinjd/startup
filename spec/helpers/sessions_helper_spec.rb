require 'rails_helper'

describe SessionsHelper do
  describe 'logged_in?' do
    it 'returns true if there is a current_user_id in the session' do
      session[:current_user_id] = 5
      expect(helper.logged_in?).to eq(true)
    end

    it 'returns false if the current_user_id is blank' do
      session[:current_user_id] = ''
      expect(helper.logged_in?).to eq(false)
    end

    it 'returns false if there is no current_user_id in the session' do
      session[:current_user_id] = nil
      expect(helper.logged_in?).to eq(false)
    end
  end

  describe 'current_user' do
    it 'returns the logged in user' do
      user = User.create(name: 'Fred', email: 'fred@example.com', password: 'secret', password_confirmation: 'secret')
      session[:current_user_id] = user.id
      expect(helper.current_user).to eq(user)
    end
    it 'only fetches the current user once' do
      user = User.create(name: 'Fred', email: 'fred@example.com', password: 'secret', password_confirmation: 'secret')
      session[:current_user_id] = user.id
      expect(User).to receive(:find).once
      helper.current_user && helper.current_user
    end
    it 'does not look for the user if there is no current user ID' do
      session[:current_user_id] = nil
      expect(User).to_not receive(:find)
      expect(helper.current_user).to eq(nil)
    end
  end
end
