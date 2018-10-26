class TaskdetailsController < InheritedResources::Base


def index
@taskdetails = Taskdetail.all
    @taskdetails = Taskdetail.joins(:project)
end

def show


end


def new
@taskdetail = Taskdetail.new
end



def edit


end


def create
	@taskdetail = Taskdetail.new(task_params)
    @taskdetail.project_id = params[:project][:prjname]
    respond_to do |format|
      if @task.save
        format.html { redirect_to @taskdetail, notice: 'Succssfully Created.' }
        format.json { render :show, status: :Success, location: @taskdetail }
      else
        format.html { render :new }
        
      end
    end
end


def update
respond_to do |format|
      if @taskdetail.update(taskdetail_params)
        format.html { redirect_to @taskdetail, notice: 'Succssfully Updated task data' }
        format.json { render :show, status: :Success, location: @taskdetail }
      else
        format.html { render :edit }
        format.json { render json: @taskdetail.errors, status: :failed }
      end
    end

end





  private

    def taskdetail_params
      params.require(:taskdetail).permit(:name, :project_id)
    end
end

