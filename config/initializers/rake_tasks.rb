out = %x[ rake -T].split "\n"
tasks = out.inject([]){|memo, line| memo << line if line.include?('rake'); memo}

split_tasks = tasks.inject([]){ |memo,t| 
  if t.include?('#')
    cmd, dsc = t.split('#').map(&:strip).flatten
    memo << { :id => SecureRandom.hex(10), :cmd => cmd, :desc => dsc }
  else
    memo << { :id => SecureRandom.hex(10), :cmd => t.strip, :desc => 'No description' }
  end
  memo
}

# split each task into the task and the description
dump_path = File.join(Rails.root, "db")
FileUtils::mkdir_p(dump_path)
dump_file_path = File.join(dump_path, "rake_tasks.json")

# remove existing
FileUtils.rm_rf dump_file_path

RAKE_TASKS = split_tasks.to_json

# store as json
File.open(dump_file_path, "w") { |f|
  f.puts split_tasks.to_json
}
