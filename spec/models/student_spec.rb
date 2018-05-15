require 'rails_helper'

RSpec.describe Student, type: :model do

  context "validate Student" do
    before(:all) do
      data = {  name: 'nitanshukyleasd',
                email: 'nitanshu.nik@gmail.com',
                age:    18,
                college: 2,
                doing_internship: true,
                internship_company: "Wipro"
              }
      @student = Student.new(data)
    end

    it "name pattern" do
      p attern  = /kyle/i
      expect(@student.name).to match(/kyle/i)  
    end

    it "college values" do
      expect(["UCD", "UCC", "NUI Galway"]).to include(@student.college) 
    end

    it "age range" do
      expect(@student.age).to be_between(18, 30)  
    end

    it "creates student" do
      expect(@student.save!).to eq(true)
    end
  end


  context "Scope Test" do
    let(:params) { {  name: 'nitanshukyleasd',email: 'nitanshu.nik@gmail.com',age:    18,college: 2,doing_internship: true, internship_company: "Wipro"}}
    before(:each) do
      Student.new(params).save
      Student.new(params).save
      Student.new(params).save
      Student.new(params.merge(doing_internship: false, internship_company: nil)).save
      Student.new(params.merge(doing_internship: false, internship_company: nil)).save
    end

    it "should return the students doing internship" do
      expect(Student.doing_internships.size).to eql(3)
    end

    it "should return the students not doing internship" do
      expect(Student.not_doing_internships.size).to eql(2 )
    end
  end

end
