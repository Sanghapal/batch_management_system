class ChangeDataTypeForAdmissionStudentFee < ActiveRecord::Migration
  def up
        change_table :admissions do |t|
    t.change :student_fee, :integer
  end
end
  def down
    change_table :admissions do |t|
    t.change :student_fee, :integer

  end
end
end