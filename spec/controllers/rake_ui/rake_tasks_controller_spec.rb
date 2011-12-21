require 'spec_helper'

describe RakeUi::RakeTasksController do
  render_views
  
  describe "GET index" do
    it "displays all tasks" do
      get :index, :use_route => :rake_ui
      assigns[:tasks].should be_a(Array)
      response.should be_success
      response.body.should include('rake app:about')
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "writes to the rake log file" do
        log_file = "#{Rails.root}/log/rake.log"
        about_task_id = JSON.parse(RAKE_TASKS).first['id']
        
        xhr :post, :create, :use_route => :rake_ui, "rake_task" => { "arguments" => "", "id" => about_task_id }
        File.read(log_file).should include("About your application's environment")
      end
    end
    context "with valid params and args" do
      it "writes to the rake log file" do
        log_file = "#{Rails.root}/log/rake.log"
        dummy_task_id = JSON.parse(RAKE_TASKS).select{|tt| tt['desc'].match(/dummy/)}.first['id']
        
        xhr :post, :create, :use_route => :rake_ui, "rake_task" => { "arguments" => "hey=now", "id" => dummy_task_id }
        File.read(log_file).should include("You passed in the argument 'hey' with the value 'now'")
      end
    end
  end
end
