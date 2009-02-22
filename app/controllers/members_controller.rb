class MembersController < ApplicationController
  # GET /members
  # GET /members.xml
  def index
    @members = Members.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @members = Members.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @members = Members.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1/edit
  def edit
    @members = Members.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @members = Members.new(params[:members])

    respond_to do |format|
      if @members.save
        flash[:notice] = 'Members was successfully created.'
        format.html { redirect_to(@members) }
        format.xml  { render :xml => @members, :status => :created, :location => @members }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @members.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @members = Members.find(params[:id])

    respond_to do |format|
      if @members.update_attributes(params[:members])
        flash[:notice] = 'Members was successfully updated.'
        format.html { redirect_to(@members) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @members.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @members = Members.find(params[:id])
    @members.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
end
