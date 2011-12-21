desc "Start the Node server"
task :start_node_server do
  Kernel.system "node #{RakeUi::Engine.root}/app/views/rake_ui/rake_tasks/server.js"
end
