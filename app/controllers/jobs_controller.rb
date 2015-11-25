class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]

	def index
		if(params[:category].blank? )
		  @jobs = Job.all.order("created_at DESC")
		else
		  @jobs=Job.where("category = ?", Job.categories[params[:category]])
		 end
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(jobs_params)
		if @job.save
			redirect_to @job, notice: "Successfully created a job posting"
		else
			render 'new'
		end
	end

	def show
       if request.path != job_path(@job)
         redirect_to @job, :status => :moved_permanently
       end
	end

	def edit
    end

    def update
        @job.slug = nil
    	if @job.update(jobs_params)
			redirect_to @job, notice: "Successfully updated a job posting"
		else
			render 'edit'
		end
    end

    def destroy
      @job.destroy
      redirect_to jobs_path
    end

    private

    def jobs_params
    	params.require(:job).permit(:title, :desc, :company, :url, :category)
    end

    def set_job
    	@job = Job.friendly.find(params[:id])
    end
end
