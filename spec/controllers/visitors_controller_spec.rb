require 'rails_helper'
require 'spec_helper'
# require_relative '../spec_helper'
# require_relative '../rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe VisitorsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Visitor. As you add validations to Visitor, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # VisitorsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all visitors as @visitors" do
  #     visitor = Visitor.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:visitors)).to eq([visitor])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested visitor as @visitor" do
  #     visitor = Visitor.create! valid_attributes
  #     get :show, {:id => visitor.to_param}, valid_session
  #     expect(assigns(:visitor)).to eq(visitor)
  #   end
  # end
  #
  # # describe "GET #new" do
  # #   it "assigns a new visitor as @visitor" do
  # #     get :new, {:id => '1'}, valid_session
  # #     expect(assigns(:visitor)).to be_a_new(Visitor)
  # #   end
  # # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested visitor as @visitor" do
  #     visitor = Visitor.create! valid_attributes
  #     get :edit, {:id => visitor.to_param}, valid_session
  #     expect(assigns(:visitor)).to eq(visitor)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Visitor" do
  #       expect {
  #         post :create, {:visitor => valid_attributes}, valid_session
  #       }.to change(Visitor, :count).by(1)
  #     end
  #
  #     it "assigns a newly created visitor as @visitor" do
  #       post :create, {:visitor => valid_attributes}, valid_session
  #       expect(assigns(:visitor)).to be_a(Visitor)
  #       expect(assigns(:visitor)).to be_persisted
  #     end
  #
  #     it "redirects to the created visitor" do
  #       post :create, {:visitor => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Visitor.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved visitor as @visitor" do
  #       post :create, {:visitor => invalid_attributes}, valid_session
  #       expect(assigns(:visitor)).to be_a_new(Visitor)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {:visitor => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested visitor" do
  #       visitor = Visitor.create! valid_attributes
  #       put :update, {:id => visitor.to_param, :visitor => new_attributes}, valid_session
  #       visitor.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested visitor as @visitor" do
  #       visitor = Visitor.create! valid_attributes
  #       put :update, {:id => visitor.to_param, :visitor => valid_attributes}, valid_session
  #       expect(assigns(:visitor)).to eq(visitor)
  #     end
  #
  #     it "redirects to the visitor" do
  #       visitor = Visitor.create! valid_attributes
  #       put :update, {:id => visitor.to_param, :visitor => valid_attributes}, valid_session
  #       expect(response).to redirect_to(visitor)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the visitor as @visitor" do
  #       visitor = Visitor.create! valid_attributes
  #       put :update, {:id => visitor.to_param, :visitor => invalid_attributes}, valid_session
  #       expect(assigns(:visitor)).to eq(visitor)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       visitor = Visitor.create! valid_attributes
  #       put :update, {:id => visitor.to_param, :visitor => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested visitor" do
  #     visitor = Visitor.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => visitor.to_param}, valid_session
  #     }.to change(Visitor, :count).by(-1)
  #   end
  #
  #   it "redirects to the visitors list" do
  #     visitor = Visitor.create! valid_attributes
  #     delete :destroy, {:id => visitor.to_param}, valid_session
  #     expect(response).to redirect_to(visitors_url)
  #   end
  # end
  #
  # # describe 'filter the areas' do
  # #   it "filter the austin area" do
  # #
  # #     expect()
  # #   end
  # # end

  describe 'create a visitor' do
    it 'should create a new visitor' do
      v = double('Visitor', :id => '1', :last_name => 'Nguyen', :first_name => 'Khuong', :group_id => '1', :email => 'khuong.nguyen@gmail.com',
                :country_id => '215', :created_at => '2015-10-11 04:36:53.734961', :updated_at => '2015-10-11 04:36:53.734961', :zip_code => '77840')
      allow(Visitor).to receive(:create).and_return(v)
      post :create, {:id => '1'}
    end
  end

  describe 'filter area' do
    before :each do
      v1 = double('Visitor', :id => '1', :last_name => 'Nguyen', :first_name => 'Khuong', :group_id => '1', :email => 'khuong.nguyen@gmail.com',
                 :country_id => '215', :created_at => '2015-10-11 04:36:53.734961', :updated_at => '2015-10-11 04:36:53.734961', :zip_code => '77840')

      v2 = double('Visitor', :id => '2', :last_name => 'Dufek', :first_name => 'Jan', :group_id => '2', :email => 'jan.dufek@gmail.com',
                 :country_id => '215', :created_at => '2015-10-11 04:36:53.734961', :updated_at => '2015-10-11 04:36:53.734961', :zip_code => '77001')

      # v3 = double('Visitor', :id => '2', :last_name => 'Dufek', :first_name => 'Jan', :group_id => '2', :email => 'jan.dufek@gmail.com',
      #             :country_id => '215', :created_at => '2015-10-11 04:36:53.734961', :updated_at => '2015-10-11 04:36:53.734961', :zip_code => '77001')

      allow(Visitor).to receive(:find).with('1').and_return(v1)

      allow(Visitor).to receive(:find).with('2').and_return(v2)


    end

    it 'should filter houston area' do
      expect({ :get => filter_area_path(:start_date => '10/04/2015', :end_date => '10/30/2015', :area => 'Houston') }).
          to route_to(:controller => 'visitors', :action => 'filter_area', :start_date => '10/04/2015', :end_date => '10/30/2015', :area => 'Houston')
    end
    # it 'should route to the filtered table page' do
    #   get :filter_area, :start_date => '10/04/2015', :end_date => '10/30/2015', :area => 'Houston'
    #   expect(response).to redirect_to(filter_area_path)
    # end
  end

  # describe 'login to administration page' do
  #   # it 'should generate routing for login' do
  #   #   expect({:post => login_path(:password => 'aaaaaa')}).to route_to(:controller => 'sessions', :action => 'create', :password => 'aaaaaa')
  #   # end
  #   # it 'should route to the statistics page' do
  #   #   get :create, :password => 'aaaaaa'
  #   #   expect(response).to redirect_to(visitors_statistics_path)
  #   # end
  #   it 'should login' do
  #     get:post => login_path(:password => 'aaaaaa')}).to redirect_to(visitors_statistics_path)
  #   end
  # end

end
