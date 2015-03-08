# encoding : utf-8
require 'rails_helper'

describe WelcomeController do
  before { session[:user_id] = FactoryGirl.create(:user) }

  describe "#index" do
    context "GET index" do
      it "renders index" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
