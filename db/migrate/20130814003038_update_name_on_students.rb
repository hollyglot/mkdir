class UpdateNameOnStudents < ActiveRecord::Migration
  def change
    change_column :students, :name, :string, :after => :cohort
  end
end
