class TeamsController < ApplicationController
  before_filter :login_required


  # render new.rhtml
  def new
    @team = Team.new
    @team.captain = current_user
  end
  
  def create
    @team = Team.new(params[:team])
    @team.captain = current_user

    respond_to do |format|
      if @team.save
        flash[:notice] = "New team was successfully created"
        format.html {redirect_to user_url(current_user) }
        # format.xml do
        #   headers["Location"] = client_url(@client)
        #   render :nothing => true, :status => "201 Created"
        # end
      else
        format.html {render :action => "new"}
        # format.xml {render :xml => @client.errors.to_xml}
      end
    end
  end

  def show 
    @team = current_user.captains_teams.find(params[:id])
    respond_to do |format| 
      format.html # show.rhtml 
      # format.xml { render :xml => @article.to_xml } 
    end 
  end 


  def edit
    @team = current_user.captains_teams.find(params[:id])
  end  
  
  def update 
    @team = current_user.captains_teams.find(params[:id])
    respond_to do |format| 
      if @team.update_attributes(params[:team]) 
        format.html { redirect_to user_team_url(current_user, @team) } 
        # format.xml { render :nothing => true } 
      else 
        format.html { render :action => "edit" } 
        # format.xml { render :xml => @article.errors.to_xml } 
      end 
    end 
  end 


end