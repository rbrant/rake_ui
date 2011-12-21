desc "This is a dummy task"
task :rake_ui_dummy_task do
  (1..5).each do |x|
    $stdout.puts "Rake ##{x}!"
    $stdout.puts "You passed in the argument 'hey' with the value '#{ENV['hey']}'" if ENV['hey']
    sleep(2)
  end
end

desc "Demo streaming of tailed logfile"
task :rake_ui_stream do
  (1..5).each do |x|
    $stdout.puts "Rake ##{x}!"
    sleep(2)
  end
end