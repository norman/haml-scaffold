class PostsController < ApplicationController

  before_filter :find_post

  POSTS_PER_PAGE = 20

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to @post }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        flash[:notice] = 'Post was successfully destroyed.'        
        format.html { redirect_to posts_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Post could not be destroyed.'
        format.html { redirect_to @post }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => POSTS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
    end
  end

  def edit
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @post }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @post }
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to @post }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_post
    @post = Post.find(params[:id]) if params[:id]
  end

end