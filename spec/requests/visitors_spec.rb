require 'rails_helper'

RSpec.describe "Visitors", type: :request do
  describe "GET /visitors" do
    it "works! (now write some real specs)" do
      get visitors_path
      expect(response).to have_http_status(200)
    end
  end
end
