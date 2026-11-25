require "rake/testtask"
Rake::TestTask.new(:unit) do |task|
  task.libs << "test"
  task.pattern = "test/*_test.rb"
end
task default: :unit

# Rails consumes the command from ARGV before Rake loads this file.
# Keep the standalone unit suite independent of database configuration.
application_tasks = Rake.application.top_level_tasks - %w[default unit]
if application_tasks.any? || Rake.application.options.show_tasks
  require_relative "config/application"
  Rails.application.load_tasks
end
