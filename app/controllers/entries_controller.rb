class EntriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_challenge

  # GET /entries
  # GET /entries.xml
#  def index
#    @entries = Entry.all

#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @entries }
#    end
#  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = current_user.entries.where(:challenge_id => @challenge.id).first || Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
#  def edit
#    @entry = current_user.entries.find(params[:id]) || Entry.new
#  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new(params[:entry])
    @entry.user = current_user
    @entry.challenge = @challenge

    respond_to do |format|
      if @entry.save
        format.html { redirect_to([@challenge, @entry], :notice => 'Entry was successfully created.') }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to([@challenge, @entry], :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end

  def rate
    @entry = Entry.find(params[:id])
    @rating = Rating.where(:user_id => current_user.id).where(:entry_id => @entry.id).first || Rating.new({:entry_id => @entry.id, :user_id => current_user.id})
    @rating.value = params[:value]
    @rating.save

    respond_to do |format|
      format.html { redirect_to(challenge_entry_path(@challenge, @entry)) }
      format.js   { 
        @value = params[:value]
      }
      format.xml  { head :ok }
    end
  end


protected
  
  def get_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end
end
