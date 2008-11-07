class <%= controller_class_name %>Controller < ApplicationController

  before_filter :find_<%= file_name %>

  <%= file_name.pluralize.upcase %>_PER_PAGE = 20

  def create
    @<%= file_name %> = <%= class_name %>.new(params[:<%= file_name %>])
    respond_to do |format|
      if @<%= file_name %>.save
        flash[:notice] = '<%= class_name %> was successfully created.'
        format.html { redirect_to @<%= file_name %> }
        format.xml  { render :xml => @<%= file_name %>, :status => :created, :location => @<%= file_name %> }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @<%= file_name %>.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @<%= file_name %>.destroy
        flash[:notice] = '<%= class_name %> was successfully destroyed.'        
        format.html { redirect_to <%= file_name.pluralize %>_path }
        format.xml  { head :ok }
      else
        flash[:error] = '<%= class_name %> could not be destroyed.'
        format.html { redirect_to @<%= file_name %> }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @<%= table_name %> = <%= class_name %>.paginate(:page => params[:page], :per_page => <%= file_name.pluralize.upcase %>_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @<%= table_name %> }
    end
  end

  def edit
  end

  def new
    @<%= file_name %> = <%= class_name %>.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @<%= file_name %> }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @<%= file_name %> }
    end
  end

  def update
    respond_to do |format|
      if @<%= file_name %>.update_attributes(params[:<%= file_name %>])
        flash[:notice] = '<%= class_name %> was successfully updated.'
        format.html { redirect_to @<%= file_name %> }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @<%= file_name %>.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_<%= file_name %>
    @<%= file_name %> = <%= class_name %>.find(params[:id]) if params[:id]
  end

end