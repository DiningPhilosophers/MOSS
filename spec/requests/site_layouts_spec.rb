require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
  describe "GET /site_layouts" do
    it "works! (now write some real specs)" do
      get site_layouts_path
      expect(response).to have_http_status(200)
    end
  end
end
