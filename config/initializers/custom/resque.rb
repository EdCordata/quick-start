require 'resque'
require 'resque-scheduler'

# Log
Resque.logger.level = Logger::DEBUG
Resque.logger       = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))

# Scheduler
jobs                      = Settings['resque_scheduler']['jobs']
Resque::Scheduler.dynamic = Rails.env.development?
Resque.schedule           = JSON.parse(jobs.to_json, symbolize_names: false) if jobs

# Redis
Resque.redis = $redis_namespace
