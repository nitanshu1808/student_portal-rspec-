class Student < ApplicationRecord
  #constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  COLLEGES          = ["UCD", "UCC", "NUI Galway"]
  #scope
  scope :doing_internships,     ->{where(doing_internship: true) }
  scope :not_doing_internships, ->{where(doing_internship: false) }
  #validations
  validates :name, format: { with: /kyle/i,
  message: "Name should include 'Kyle' " }
  validates :name,  :email, :age, :college, presence: true
  validates :email, format: {with: VALID_EMAIL_REGEX,
  message: "Invalid Email. Please enter a valid email"}
  validates :age, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 30,
  message: "Age should be between 18 - 30"}
  # validates :college, inclusion: {in: COLLEGES}
  validates :internship_company, presence: true, if: :doing_internship?

  #enum declaration
  enum college: COLLEGES

end
