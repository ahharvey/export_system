require "rails_helper"

RSpec.describe CompaniesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/companies").to route_to("companies#index")
    end

    it "routes to #new" do
      expect(:get => "/companies/new").to route_to("companies#new")
    end

    it "routes to #show" do
      expect(:get => "/companies/1").to route_to("companies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/companies/1/edit").to route_to("companies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/companies").to route_to("companies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/companies/1").to route_to("companies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/companies/1").to route_to("companies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/companies/1").to route_to("companies#destroy", :id => "1")
    end

  end
  describe :helpers do
    it { expect(companies_path).to eq("/companies") }
    it { expect(new_company_path).to eq("/companies/new") }

    I18n.available_locales.each do |locale|
      it { expect(company_path(1, locale: locale)).to eq("/#{locale}/companies/1") }
      it { expect(edit_company_path(1, locale: locale)).to eq("/#{locale}/companies/1/edit") }
    end
  end
end
