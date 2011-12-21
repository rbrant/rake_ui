module RakeUi
  class RakeTasksController < ApplicationController
    respond_to :js
    before_filter :load_tasks
    
    def index
      @rake_task = RakeUi::RakeTask.new
    end
    
    def create
      @rake_task = RakeUi::RakeTask.new(params[:rake_task])
      @rake_task.command = @tasks.select {|task| task['id'] == @rake_task.id }.pop['cmd']
      Kernel.system("#{@rake_task.command} #{@rake_task.arguments} &> #{Rails.root}/log/rake.log")  
      respond_to do |format|
        format.js {}
      end
    end
    
    private
    
    def load_tasks
      @tasks = JSON.parse(RAKE_TASKS)
    end
  end
end
