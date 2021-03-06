class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      # t.string :movies --- does this for meeee by creating user_ID in movie table
      t.timestamps
    end

    create_table :movies do |t|
      t.string :title
      t.string :year_released
      # t.string :reviews
      # t.string :actors
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :rating_to_5
      t.string :comment
      t.timestamps
    end

    create_table :actors do |t|
      t.integer :actor
      t.timestamps
    end    

  end

end