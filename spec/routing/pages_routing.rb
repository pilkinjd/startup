require 'rails_helper'

RSpec.describe PagesController, type: :routing do
  describe 'routing' do
    it 'routes to the root page' do
      expect(get: '/').to route_to('pages#home')
    end
  end
end
