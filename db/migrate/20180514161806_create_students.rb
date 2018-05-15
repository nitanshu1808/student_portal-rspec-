class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :age, null: false
      t.integer :college, null: false 
      t.boolean :doing_internship, default: false
      t.string :internship_company
      t.timestamps
    end
  end
end
