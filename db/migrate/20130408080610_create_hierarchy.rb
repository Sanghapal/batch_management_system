class CreateHierarchy < ActiveRecord::Migration
  def up
    s1 = State.find_by_name("Maharashtra")

    City.create(:name => "Akola", :state_id => s1.id)
    City.create(:name => "Amrawati", :state_id => s1.id)
    City.create(:name => "Bukdhana", :state_id => s1.id)
    City.create(:name => "Yawatmal", :state_id => s1.id)
    City.create(:name => "Washim", :state_id => s1.id)
    City.create(:name => "Aurangabad", :state_id => s1.id)
    City.create(:name => "Latur", :state_id => s1.id)
    City.create(:name => "Beed", :state_id => s1.id)
    City.create(:name => "Nanded", :state_id => s1.id)
    City.create(:name => "Hingoli", :state_id => s1.id)
    City.create(:name => "Osmanabad", :state_id => s1.id)
    City.create(:name => "Jalna", :state_id => s1.id)
    City.create(:name => "Parbhani", :state_id => s1.id)
    City.create(:name => "Mumbai", :state_id => s1.id)
    City.create(:name => "Thane", :state_id => s1.id)
    City.create(:name => "Mumbai_Suburban_District", :state_id => s1.id)
    City.create(:name => "Raigad", :state_id => s1.id)
    City.create(:name => "Ratnagiri", :state_id => s1.id)
    City.create(:name => "Sindhudurg", :state_id => s1.id)
    City.create(:name => "Bhandara", :state_id => s1.id)
    City.create(:name => "Gondia", :state_id => s1.id)
    City.create(:name => "Chandrapur", :state_id => s1.id)
    City.create(:name => "Nagpur", :state_id => s1.id)
    City.create(:name => "Ghadchiroli", :state_id => s1.id)
    City.create(:name => "Wardha", :state_id => s1.id)
    City.create(:name => "Ahmednagar", :state_id => s1.id)
    City.create(:name => "Jalgoan", :state_id => s1.id)
    City.create(:name => "Dhule", :state_id => s1.id)
    City.create(:name => "Nandurbar", :state_id => s1.id)
    City.create(:name => "Nashik", :state_id => s1.id)
    City.create(:name => "Kolhapur", :state_id => s1.id)
    City.create(:name => "Sangali", :state_id => s1.id)
    City.create(:name => "Pune", :state_id => s1.id)
    City.create(:name => "Satara", :state_id => s1.id)
    City.create(:name => "Solapur", :state_id => s1.id)
end


  def down
  end
end
