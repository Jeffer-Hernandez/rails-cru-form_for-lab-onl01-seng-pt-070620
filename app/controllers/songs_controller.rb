class SongsController < ApplicationController

    def index
		@songs = Song.all
		
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
		@song = Song.new
	end

	def edit
		@song = Song.find(params[:id])
		
	end

	def create
		@song= Song.new(song_params(:name, :artist_id, :genre_id))
		@song.save
		redirect_to song_path(@song)
	end
	   
	def update
		@song = Song.find(params[:id])
		@song.update(song_params(:name, :artist_id, :genre_id))
		redirect_to song_path(@song)
	end
	  # We pass the permitted fields in as *args;
	  # this keeps `post_params` pretty dry while
	  # still allowing slightly different behavior
	  # depending on the controller action. This
	  # should come after the other methods
	   
	  

	private
 
		def song_params(*args)
			params.require(:song).permit(*args)
		end

end