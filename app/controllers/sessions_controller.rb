class SessionsController < ApplicationController
  
  def new
    
  end
  
  def destroy
    session[:member_id] = nil
    flash[:notice] = "You have been logged out"
    render :action => "new"
  end
  
  # params[:member][:name]
  # params[:member][:password]
  def create
    m = Member.authenticate(params[:member][:name],params[:member][:password])
    if m
      @current_member = m
      session[:member_id] = m.id
      unless session[:protected].blank?
        redirect_url = session[:protected]
        session[:protected] = ""
        redirect_to redirect_url
      else
        redirect_to :controller => "members", :action => "index"
      end
      return
    else
      flash[:error] = "Invalid username or password"
    end
    redirect_to :action => "new"
  end
  
  
end