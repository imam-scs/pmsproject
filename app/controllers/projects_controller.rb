class ProjectsController < InheritedResources::Base

before_action :set_project, only: [:show, :edit, :update, :destroy]


 # before_filter :check_authorization
  before_action :check_authorization




# def current_user
#   @current_user ||= User.find session[:user_id] if session[:user_id]
#   if @current_user
#     @current_user
#   else
#    
#   end
# end

# def current_user
#      @current_user ||= User.find_by(id: session[:user_id])
#   end
def index
  puts "===================";
# puts current_user.email 
puts current_user
  puts "=================";

@projects = current_user.projects.all if current_user
 
end

def new
@project = Project.new
end

def create
@project = Project.new(project_params)
@project.user_id = current_user.id
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
  @project = Project.find(params[:id])
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
  @project = Project.find(params[:id])
  @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Successfully Deleted.' }
      format.json { head :no_content }
    end

end

  private

# def authenticate
#     authenticate_or_request_with_http_basic do |email, password|
#      unless email == current_user.email &&
#       Digest::SHA1.hexdigest(password) == current_user.password

#       flash[:error] = "If you want to access that account then You have to logged in"
#        redirect_to new_user_session_path
# end
#     end
#   end

  #  def check_authorization
  #   raise User::NotAuthorized unless current_user.id?
  # end

def check_authorization
    unless current_user
      flash[:error] = "If you want to do anything in project then you have to logged in"
      redirect_to new_user_session_path
end
end

   def set_project
      @project = Project.find(params[:id])
   end 

    def project_params
      params.require(:project).permit(:prjname, :prjtype, :team_members, :client_name, :technology,:image)
    end
end

