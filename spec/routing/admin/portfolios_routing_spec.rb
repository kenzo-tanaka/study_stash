require "rails_helper"

RSpec.describe Admin::PortfoliosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/portfolios").to route_to("admin/portfolios#index")
    end

    it "routes to #new" do
      expect(get: "/admin/portfolios/new").to route_to("admin/portfolios#new")
    end

    it "routes to #show" do
      expect(get: "/admin/portfolios/1").to route_to("admin/portfolios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/portfolios/1/edit").to route_to("admin/portfolios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/portfolios").to route_to("admin/portfolios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/portfolios/1").to route_to("admin/portfolios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/portfolios/1").to route_to("admin/portfolios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/portfolios/1").to route_to("admin/portfolios#destroy", id: "1")
    end
  end
end
