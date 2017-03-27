class PhotosController < ApplicationController

	#layout false

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
    @name = @photo.author
    #count = Photo.find_by_sql("SELECT MAX(id) FROM Photos")
    
    id = User.find_by_sql("select id from users where login='#{@name}'")
    if id.any?
  	if @photo.save
  		flash[:success] = "The video was added! Your video id is #{@photo.id}." 
      #flash[:success] = "asdlkfjlasdfjs"
  		redirect_to action: 'project_content', id: @photo.id
  	else
  		render 'new'
    end
    else
      flash[:success] = "Please enter the SPC Login Name!" # red notice to be implemented
      render 'new'
      end
  end

  def index

  	@photos = Photo.order('created_at')

  end

  def project_content
    @photo = Photo.find(params[:id])

    @videos = Photo.find_by_sql("select * from photos where author ='#{params[:username]}' and id <> #{params[:id]}")



  end

  private

  def photo_params
    #user_id_1 = 6


    params.require(:photo).permit(:image, :projectname, :title, :author)
  end



end
