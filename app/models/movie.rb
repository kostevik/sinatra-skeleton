class Movie < ActiveRecord::Base
	has_many :reviews
	has_many :actors
	belongs_to :user
end