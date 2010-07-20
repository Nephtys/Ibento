class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @participation = Participant.find(:first, :conditions => {:user_id => @current_user.id, :event_id => @event.id})

    respond_to do |format|
      format.html
      format.xml  { render :xml => @event }
    end
  end
  
  def new
    @event = Event.new
    @geo_map = GeoMap.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @event }
    end
  end

  def create
    @event = Event.new(params[:event])
    @geo_map = GeoMap.new(params[:geo_map])

    respond_to do |format|
      if @event.save
        @geo_map.event = @event
        @geo_map.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.geo_map
      @geo_map = GeoMap.find(@event.geo_map.id)
    else
      @geo_map = GeoMap.new
      @geo_map.event = @event
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = "Event was successfully updated."
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end

    session[:current_tab] = 'general'
  end

  def update_map
    if params[:geo_map][:id]
      @geo_map = GeoMap.find(params[:geo_map][:id])
      ret = @geo_map.update_attributes(params[:geo_map])
    else
      @geo_map = GeoMap.new(params[:geo_map])
      @event = Event.find(params[:event][:id])
      ret = @geo_map.save
      @event.geo_map = @geo_map
      @event.save
    end

    session[:current_tab] = 'map'

    respond_to do |format|
      if ret
        flash[:notice] = "The map was successfully updated."
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        flash[:error] = "The map has not been updated"
        format.html { redirect_to :back }
        format.xml  { render :xml => @geo_map.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update_participation
    @participant = Participant.find(params[:participation][:id])

    respond_to do |format|
      if ParticipationState.find(:first, :conditions => {:state_id => params[:participation][:status]}) and @participant.update_attributes(params[:participation])
        flash[:notice] = "Your participation was successfully updated."
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        flash[:error] = "Your participation has not been updated"
        format.html { redirect_to :back }
        format.xml  { render :xml => @participation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

  def auto_complete_for_search_email
    email_part = params[:search][:email].downcase
    email_parts = email_part.split(",")
    email_part = email_parts[email_parts.length-1].strip
    @people = User.find(:all,
      :conditions => [ 'LOWER(email) LIKE ?',
        '%' + email_part + '%' ],
      :order => 'last_name ASC',
      :limit => 8)
    render :partial => "participants_autocomplete"
  end

  def update_fields
    @person = User.find_by_email(params[:email])
    if @person.nil?
      render :nothing => true
    else
      render :update do |page|
        page['search_emails'].value += @person.email
      end
    end
  end

end
