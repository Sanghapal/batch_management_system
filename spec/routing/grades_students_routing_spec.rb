require "spec_helper"

describe GradesStudentsController do
  describe "routing" do

    it "routes to #index" do
      get("/grades_students").should route_to("grades_students#index")
    end

    it "routes to #new" do
      get("/grades_students/new").should route_to("grades_students#new")
    end

    it "routes to #show" do
      get("/grades_students/1").should route_to("grades_students#show", :id => "1")
    end

    it "routes to #edit" do
      get("/grades_students/1/edit").should route_to("grades_students#edit", :id => "1")
    end

    it "routes to #create" do
      post("/grades_students").should route_to("grades_students#create")
    end

    it "routes to #update" do
      put("/grades_students/1").should route_to("grades_students#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/grades_students/1").should route_to("grades_students#destroy", :id => "1")
    end

  end
end
