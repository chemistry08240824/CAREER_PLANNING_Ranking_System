class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image
      t.integer :money
      t.string :college
      t.string :group
      t.string :career
      t.string :course
      t.string :interest_industry

      t.timestamps
    end
  end
end
