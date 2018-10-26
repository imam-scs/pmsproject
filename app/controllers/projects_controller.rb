class ProjectsController < InheritedResources::Base

# def current_user
#   @current_user ||= User.find session[:user_id] if session[:user_id]
#   if @current_user
#     @current_user
#   else
#     OpenStruct.new(name: 'Guest')
#   end
# end

# def current_user
#      @current_user ||= User.find_by(id: session[:user_id])
#   end
def index
   @current_user ||= User.find session[:user_id] if session[:user_id]
 @currentUser = current_user.id


@projects = Project.all
@projects = Project.joins(:users)
project = Project.joins(:taskdetails)
@projects = @current_user.projects.all if @current_user



# @projects = Project.joins(:user)
 # @projects =Project.joins(:users => :taskdetails)
end

def new
@project = Project.new
end

def create
@project = Project.new(project_params)
respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Successfully  Created.' }
        format.json { render :show, status: :Success, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :failed}
        
      end
    end
end

def update
respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Successfully updated.' }
        format.json { render :show, status: :Success, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :failed }
      end
    end
end



def destroy
@project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Successfully Deleted.' }
      format.json { head :no_content }
    end

end





  private

    def project_params
      params.require(:project).permit(:prjname, :prjtype, :team_members, :client_name, :technology)
    end
end

