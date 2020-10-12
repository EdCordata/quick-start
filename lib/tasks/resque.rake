require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment

namespace 'resque' do


  # bundle exec rake resque:restart_workers
  # ----------------------------------------------------
  task :restart_workers => :environment do
    Rake::Task['resque:stop_workers'].invoke
    Rake::Task['resque:start_workers'].invoke
  end
  # ----------------------------------------------------


  # bundle exec rake resque:stop_workers
  # ----------------------------------------------------
  task :stop_workers => :environment do
    Resque.workers.each do |worker|
      pid = worker.pid

      # tell worker to finish its work and quit
      Process.kill('QUIT', pid) rescue nil

      # wait till we have to kill task
      wait = 1

      # wait till process killed or wait timeout reached (then force quite)
      while !(Process.getpgid(pid) rescue nil).nil? || wait > Settings['resque']['wait_before_kill']
        sleep 1
        wait += 1
      end
      Process.kill('TERM', pid) rescue nil

    end
  end
  # ----------------------------------------------------


  # bundle exec rake resque:start_workers
  # ----------------------------------------------------
  task :start_workers => :environment do
    Settings['resque']['workers'].select { |w| w['enabled'] == true }.each do |worker_params|

      command_options = %W(
        BACKGROUND=yes
        RAILS_ENV=#{Rails.env}
        RACK_ENV=#{Rails.env}
        INTERVAL=#{worker_params.interval}
        VERBOSE=#{Settings['resque']['verbose']}
        QUEUE="#{worker_params.queues.join(',')}"
      )

      command = "cd '#{Rails.root}' && bundle exec rake resque:work #{command_options.join(' ')}"

      sh(command)
    end
  end
  # ----------------------------------------------------


end
