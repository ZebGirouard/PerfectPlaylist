class Play < ActiveRecord::Base
	has_one :environment
	has_one :song
end
