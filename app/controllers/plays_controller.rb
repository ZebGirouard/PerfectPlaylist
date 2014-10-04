require 'csv'
class PlaysController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def home
=begin
		@song = []
		Songs.find_each do |songy|
			@song << songy
		end
=end
		@plays = []
		#@plays = Play.all
		Play.find_each do |play|
			#play_full = play.inspect
			@play_full = {}
			@play_full["rank"] = play["rank"]
			@play_full["song"] = Song.find_by_rank(play["rank"])
			@play_full["title"] = @play_full["song"]["title"]
			@play_full["artist"] = @play_full["song"]["artist"]

			@play_full["environment"] = Environment.find_by_rank(play["rank"])
			@play_full["target_e"] = @play_full["environment"]["target_e"]
			@play_full["target_d"] = @play_full["environment"]["target_d"]
			@play_full["target_v"] = @play_full["environment"]["target_v"]
			@plays << @play_full
		end
		#Play.find_each do |play|
		#	@plays << play
		#end
	end

	def create
		@string = "Please Refresh Page"
		#flash[:success] = "Songs added!"
		CSV.open("./new.csv", "wb") do |csv|
		  csv << Song.attribute_names
		  Song.all.each do |song|
		    csv << song.attributes.values
		  end
		end
		redirect_to root_path
	end


	def curl_get_example
    render text: 'Thanks for sending a GET request with cURL!'
  	end

  	def too_loud_flag
    render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  	end

end
