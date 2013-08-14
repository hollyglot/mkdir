class UpdateCohortOnStudents < ActiveRecord::Migration
  def change
    change_column :students, :cohort, :string, :after => :name
  end
end
