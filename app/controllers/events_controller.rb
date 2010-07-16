class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @participation = Participant.find(:first, :conditions => {:user_id => @current_user.id, :event_id => @event.id})

    respond_to do |format|
      format.html
      format.xml  { render :xml => @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
    @geo_map = GeoMap.find(@event.geo_map.id)
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
  end

  def update_map
    @geo_map = GeoMap.find(params[:geo_map][:id])

    respond_to do |format|
      if @geo_map.update_attributes(params[:geo_map])
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

end
