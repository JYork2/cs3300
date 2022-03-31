require "rails_helper"

RSpec.describe Projects, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      projects = Projects.new(description: "Content of the description")
      expect(projects.valid?).to eq(false)
    end

    it "ensures the description is present" do
      projects = Projects.new(title: "Title")
      expect(projects.valid?).to eq(false)
    end
    
    it "should be able to save projects" do
      projects = Projects.new(title: "Title", description: "Some description content goes here")
      expect(projects.save).to eq(true)
    end
  end

  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      Projects.create(params)
      Projects.create(params)
      Projects.create(params)
    end

    it "should return all projects" do
      expect(Projects.count).to eq(3)
    end

  end


  context "scopes tests" do

  end
end