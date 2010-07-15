class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @participation = Participant.find(:first, :conditions => {:user_id => @current_user.id, :event_id => @event.id})

    respond_to do |format|
      format.html
      format.xml  { render :xml => @event }
    end
  end

  def update_participation
    @participant = Participant.find(params[:participation][:id])

    respond_to do |format|
      if ParticipationState.find(:first, :conditions => {:state_id => params[:participation][:status]}) and @participant.update_attributes(params[:participation])
        flash[:notice] = "Your participation has been updated"
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        flash[:error] = "Your participation has not been updated"
        format.html { redirect_to :back }
        format.xml  { render :xml => @participation.errors, :status => :unprocessable_entity }
      end
    end
  end

end
