class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :new_cases
      t.integer :new_recovered
      t.integer :new_deaths
      t.integer :total_cases
      t.integer :total_recovered
      t.integer :total_deaths
      t.datetime :updated_date

      t.timestamps
    end
  end
end
