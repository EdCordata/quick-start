require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment

namespace 'resque:scheduler' do


  # bundle exec rake resque:scheduler:restart
  # ----------------------------------------------------
  task :restart => :environment do
    Rake::Task['resque:scheduler:stop'].invoke
    Rake::Task['resque:scheduler:start'].invoke
  end
  # ----------------------------------------------------


  # bundle exec rake resque:scheduler:start
  # ----------------------------------------------------
  task :start => :environment do
    pid_path = File.join(Rails.root, Settings['resque_scheduler']['pid_path'])

    # make sure pid dir exists
    FileUtils.mkdir_p(File.dirname(pid_path))

    # if pid exists, but server isn't running, we remove wrong pid file
    # and run server. If server is running, we do nothing.
    if File.exists?(pid_path)
      pid     = File.read(pid_path).to_i
      process = (Process.getpgid(pid) rescue nil)

      if process.nil?
        FileUtils.rm_f(pid)
      else
        return # scheduler running. Exit.
      end
    end

    # Start scheduler
    command_options = %W(
        BACKGROUND=yes
        RAILS_ENV=#{Rails.env}
        PIDFILE=#{pid_path}
        RACK_ENV=#{Rails.env}
        RESQUE_SCHEDULER_INTERVAL=#{Settings['resque_scheduler']['interval']}
        VERBOSE=#{Settings['resque_scheduler']['verbose']}
    )

    command = "cd '#{Rails.root}' && bundle exec rake resque:scheduler #{command_options.join(' ')}"

    sh(command)
  end
  # ----------------------------------------------------


  # bundle exec rake resque:scheduler:stop
  # ----------------------------------------------------
  task :stop => :environment do
    pid_path = File.join(Rails.root, Settings['resque_scheduler']['pid_path'])

    if File.exists?(pid_path)
      pid = File.read(pid_path).to_i

      Process.kill('TERM', pid) rescue nil
      FileUtils.rm_f(pid_path)
    end
  end
  # ----------------------------------------------------


end
