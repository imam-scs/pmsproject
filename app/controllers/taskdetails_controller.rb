class TaskdetailsController < InheritedResources::Base
before_action :set_taskdetail, only: [:show, :edit, :update]

def index
 @taskdetails = Taskdetail.all
 

end

def show


end


def new
@taskdetail = Taskdetail.new
end



def edit


end


def create
	@taskdetails = Taskdetail.new(taskdetail_params)
   @taskdetails.project_id = params[:project][:prjname]
    respond_to do |format|
      if @taskdetails.save
        format.html { redirect_to @taskdetails, notice: 'Succssfully Created.' }
        format.json { render :show, status: :Success, location: @taskdetails }
      else
        format.html { render :new }
        
      end
    end
end


def update
@taskdetail = Taskdetail.find(params[:id])
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

def destroy


end





  private

  def set_taskdetail
  @taskdetail = Taskdetail.find(params[:id])
  end

    def taskdetail_params
      params.require(:taskdetail).permit(:name, :days,:status,:project_id)
    end
end

