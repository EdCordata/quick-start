# rails-6-redis-resque


### Feature list
* Add's Resque
* Configurable from settings


### Job example
```ruby
# app/jobs/example_worker.rb

class ExampleWorker
  @queue = :default

  def self.perform(attr)
    # ActiveRecord::Base.clear_active_connections! # Fix: 'Mysql::Error: MySQL server has gone away'

    # worker stuff
    sleep 5

  rescue Exception => e

    # log resque worker error
    msg   = e.message.to_s
    trace = e.backtrace

    raise # raise the same error again
  end

end
```


### Scheduler example
```yaml
# config/settings.yml

resque_scheduler:
  jobs:
    example_worker:
      # never: '* * * * *' # to disable
      cron:        '* * * * *'
      class:       'ExampleWorker'
      queue:       'default'
      args:        'args'
      description: 'This job an example worker'
```


### Usage examples
```ruby
ExampleWorker.perform('attr') # perform on main thread

Resque.enqueue(ExampleWorker, 'attr')
Resque.enqueue_in(5.minutes, ExampleWorker, 'attr')
Resque.enqueue_at(5.days.from_now, ExampleWorker, 'attr')

Resque.remove_delayed(ExampleWorker, 'attr')
Resque.remove_delayed_selection { |args| args[0]['account_id'] == current_account.id }
Resque.remove_delayed_selection(ExampleWorker) { |args| args[0]['account_id'] == current_account.id }
```
