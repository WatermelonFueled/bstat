class Player < ActiveRecord::Base
	has_many :games, :dependent => :destroy
	has_many :assessments, :dependent => :destroy
end
