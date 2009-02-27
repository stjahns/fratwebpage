class WikiPagesController < ApplicationController
  before_filter :requires_login
  
  
  def index
    @wiki_pages = WikiPage.sorted_by_name
  end
  
  def new
    @wiki_page = WikiPage.new
  end
  
  def create
    @wiki_page = WikiPage.new(params[:wiki_page])
    @wiki_page.author = @current_member
   
    if @wiki_page.save
      flash[:notice] = 'Page was successfully Created.'
      format.html { redirect_to(@wiki_page) }
    else
      format.html { render :action => "edit" }
    end
  end
  
  def edit
    @wiki_page = WikiPage.find(params[:id])
  end
  
  def update
    @wiki_page = WikiPage.find(params[:id])
    
    respond_to do |format|
      @wiki_page.last_edited_by = @current_member
      if @wiki_page.update_attributes(params[:wiki_page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(@wiki_page) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def show
    @wiki_page = WikiPage.find(params[:id])
    
    @previous_page = WikiPage.first
    if !params[:from_back] and request.referrer and request.referrer.include?("/wiki_pages/")
      page_index = request.referrer.split(/\//).last.to_i
      @previous_page = WikiPage.find(page_index)
    end
    
    @previous_page = false if @previous_page==@wiki_page
  end
  
end
