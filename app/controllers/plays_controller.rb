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
		if request.post?
	    activated_ids = params[:activated].collect {|id| id.to_i} if params[:activated]
	    seen_ids = params[:seen].collect {|id| id.to_i} if params[:seen]

	    if activated_ids
	      seen_ids.each do |id|
	        r = Play.find_by_id(id)
	        r.activated = activated_ids.include?(id)
	        r.save
	      end
	    end
	  end
	  #@r = r
		@string = "Please Refresh Page"
		#flash[:success] = "Songs added!"
		CSV.open("./songlist.csv", "wb") do |csv|
		  csv << ["rank", "title", "artist", "energy", "danceability", "valence", "path"]
		  Song.find_each do |song|
		    csv << [song.rank, song.title, song.artist, song.energy, song.danceability, song.path]
		  end
		end
		#CSV.open("./targetlist.csv", "wb") do |csv|
		#  csv << ["rank", "target_e", "target_d", "target_v"]
		#  @plays.each do |target|
		#    csv << [target["rank"], target["target_e"], target["target_d"], target["target_v"]]
		#  end
		#end
		redirect_to root_path
	end


	def curl_get_example
    render text: 'Thanks for sending a GET request with cURL!'
  	end

  	def too_loud_flag
    render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  	end

end
