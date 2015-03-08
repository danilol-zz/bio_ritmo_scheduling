require 'rails_helper'
RSpec.describe SchedulingsController, :type => :controller do
  before { session[:user_id] = current_user_id }

  let(:user_attributes) { FactoryGirl.attributes_for(:user) }
  let(:current_user_id) { User.create(user_attributes).id }

  let(:valid_attributes) { FactoryGirl.attributes_for(:scheduling) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:scheduling, room_id: nil) }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all schedulings as @schedulings" do
      scheduling = Scheduling.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:schedulings)).to eq([scheduling])
    end
  end

  describe "GET show" do
    it "assigns the requested scheduling as @scheduling" do
      scheduling = Scheduling.create! valid_attributes
      get :show, {:id => scheduling.to_param}, valid_session
      expect(assigns(:scheduling)).to eq(scheduling)
    end
  end

  describe "GET new" do
    it "assigns a new scheduling as @scheduling" do
      get :new, {}, valid_session
      expect(assigns(:scheduling)).to be_a_new(Scheduling)
    end
  end

  describe "GET edit" do
    it "assigns the requested scheduling as @scheduling" do
      scheduling = Scheduling.create! valid_attributes
      get :edit, {:id => scheduling.to_param}, valid_session
      expect(assigns(:scheduling)).to eq(scheduling)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Scheduling" do
        expect {
          post :create, {:scheduling => valid_attributes}, valid_session
        }.to change(Scheduling, :count).by(1)
      end

      it "assigns a newly created scheduling as @scheduling" do
        post :create, {:scheduling => valid_attributes}, valid_session
        expect(assigns(:scheduling)).to be_a(Scheduling)
        expect(assigns(:scheduling)).to be_persisted
      end

      it "redirects to the created scheduling" do
        post :create, {:scheduling => valid_attributes}, valid_session
        expect(response).to redirect_to(Scheduling.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved scheduling as @scheduling" do
        post :create, {:scheduling => invalid_attributes}, valid_session
        expect(assigns(:scheduling)).to be_a_new(Scheduling)
      end

      it "re-renders the 'new' template" do
        post :create, {:scheduling => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:scheduling, room_id: 99, user_id: 88) }

      it "updates the requested scheduling" do
        scheduling = Scheduling.create! valid_attributes
        put :update, {:id => scheduling.to_param, :scheduling => new_attributes}, valid_session
        scheduling.reload
        expect(scheduling.room_id).to eq 99
        expect(scheduling.user_id).to eq 88
      end

      it "assigns the requested scheduling as @scheduling" do
        scheduling = Scheduling.create! valid_attributes
        put :update, {:id => scheduling.to_param, :scheduling => valid_attributes}, valid_session
        expect(assigns(:scheduling)).to eq(scheduling)
      end

      it "redirects to the scheduling" do
        scheduling = Scheduling.create! valid_attributes
        put :update, {:id => scheduling.to_param, :scheduling => valid_attributes}, valid_session
        expect(response).to redirect_to(scheduling)
      end
    end

    describe "with invalid params" do
      it "assigns the scheduling as @scheduling" do
        scheduling = Scheduling.create! valid_attributes
        put :update, {:id => scheduling.to_param, :scheduling => invalid_attributes}, valid_session
        expect(assigns(:scheduling)).to eq(scheduling)
      end

      it "re-renders the 'edit' template" do
        scheduling = Scheduling.create! valid_attributes
        put :update, {:id => scheduling.to_param, :scheduling => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested scheduling" do
      scheduling = Scheduling.create! valid_attributes
      expect {
        delete :destroy, {:id => scheduling.to_param}, valid_session
      }.to change(Scheduling, :count).by(-1)
    end

    it "redirects to the schedulings list" do
      scheduling = Scheduling.create! valid_attributes
      delete :destroy, {:id => scheduling.to_param}, valid_session
      expect(response).to redirect_to(schedulings_url)
    end
  end

end
