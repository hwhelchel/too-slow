require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "GET 'index'" do
    it "returns a list of users" do
      users = create_list(:user_with_karma, 51)

      get :index

      expect(response).to be_ok
      expect(response.body).to include(users.last.first_name)
    end

    it "returns a list of users limited to 50 users" do
      users = create_list(:user_with_karma, 51)

      expect(response).to be_ok
      expect(response.body).to_not include(users.last.first_name)
    end

  end

end
