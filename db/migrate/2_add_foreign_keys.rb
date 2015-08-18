class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :reviews do |t|
            t.references :movie
        end

         change_table :actors do |t|
            t.references :movie
        end

        change_table :movies do |t|
            t.references :user
        end
    end
end

#this adds an extra column (ex. user_ID)