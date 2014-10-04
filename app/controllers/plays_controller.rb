class PlaysController < ApplicationController
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
			@plays << @play_full
		end
		#Play.find_each do |play|
		#	@plays << play
		#end
	end

	def create
		flash[:success] = "Songs added!"
	end
end
