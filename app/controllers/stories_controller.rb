class StoriesController < ApplicationController
  before_filter :login_required, :except => [:index, :news, :images, :videos, :show]

  # GET /stories
  # GET /stories.xml
  def index
    @heading = "All Popular"
    @stories = Story.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /news
  # GET /news.xml
  def news
    @heading = "Popular News"
    @stories = Story.find_all_by_media("news")

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @stories }
    end
  end

  # GET /images
  # GET /images.xml
  def images
    @heading = "Popular Images"
    @stories = Story.find_all_by_media("images")

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @stories }
    end
  end

  # GET /videos
  # GET /videos.xml
  def videos
    @heading = "Popular Videos"
    @stories = Story.find_all_by_media("videos")

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])
    @comments = @story.comments
    @comment = @comments.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])
    @story.user = current_user

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        format.html { redirect_to(@story) }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to(@story) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to(stories_url) }
      format.xml  { head :ok }
    end
  end
end