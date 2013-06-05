class ChangeDataTypeForAdmissionSponsorFee < ActiveRecord::Migration
  def up
    change_table :admissions do |t|
    t.change :sponsor_fee, :integer

  end
end
  def down
    change_table :admissions do |t|
    t.change :sponsor_fee, :integer

  end
end
end