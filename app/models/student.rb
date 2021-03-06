class Student < ApplicationRecord
  #constants
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/
  COLLEGES          = ["UCD", "UCC", "NUI Galway"]
  NAME_REGEX        =  /kyle/i
  #scope
  scope :doing_internships,     ->{where(doing_internship: true) }
  scope :not_doing_internships, ->{where(doing_internship: false) }
  #validations
  validates :name,  :email, :age, :college, presence: true
  validates :name, format: { with: NAME_REGEX,
    message: I18n.t("model.student.valid_name")}
  validates :email, format: {with: VALID_EMAIL_REGEX,
    message: I18n.t("model.student.valid_email") }
  validates :age, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 30,
    message: I18n.t("model.student.valid_age")}
  validates :college, inclusion: {in: COLLEGES, 
    message: I18n.t("model.student.valid_college")}
  validates :internship_company, :presence => {
    message: I18n.t("model.student.valid_intrnshp_compny")}, if: :doing_internship?
  #enum declaration
  enum college: COLLEGES
end
