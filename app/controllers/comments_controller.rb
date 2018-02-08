class CommentsController < ApplicationController
  before_action :set_job, only: [:create]

  def create
    @comment = @job.comments.new(comment_params)
    @comment.save
    redirect_to job_path(@job)
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def comment_params
    params.require(:comment).permit(:subject)
  end
end
