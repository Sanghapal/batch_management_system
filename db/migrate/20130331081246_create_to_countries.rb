class CreateToCountries < ActiveRecord::Migration
  def up
    Country.create(:name => "India")
  end

  def down
  end
end
