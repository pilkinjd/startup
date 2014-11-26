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
end
