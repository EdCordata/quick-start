app: puma -p 3000
worker: bundle exec rake environment resque:work COUNT=1 INTERVAL=1 QUEUE=*
worker_scheduler: bundle exec rake environment resque:scheduler
