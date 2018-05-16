require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  context "Get #index" do
    it "returns a success response" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context "Get #show" do
    it "returns a success response " do
      data = {  name: 'nitanshukyleasd',
                email: 'nitanshu.nik@gmail.com',
                age:    18,
                college: 2,
                doing_internship: true,
                internship_company: "Wipro"
              }

      @student = Student.new(data)
      @student.save
      get :show, params: {id: @student.id}
      expect(response.status).to eq(200)
    end
  end

  context "Get #new" do
    it "returns a success response " do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
