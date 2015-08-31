class AddImages < ActiveRecord::Migration
    def change
        add_column :movies, :moviecover, :string
    end
end