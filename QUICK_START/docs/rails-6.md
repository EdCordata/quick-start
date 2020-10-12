h# rails-6

### Feature list
* [Rails](https://rubyonrails.org/) version `6.0.3.3`
* Using Assets Pipeline & Turbolinks (no WebPacker `--skip-webpack-install --skip-javascript`)
* SCSS for stylesheets
* no tracking in `robots.txt`
* [simple_form](https://github.com/heartcombo/simple_form), with awesome plugins:
  * [nested_form_fields](https://github.com/ncri/nested_form_fields)
  * [dependent-fields-rails](https://github.com/vollnhals/dependent-fields-rails)
* [kaminari](https://github.com/kaminari/kaminari) for pagination
* [ransack](https://github.com/activerecord-hackery/ransack) for ActiveRecord search
* Views are in [HAML](https://haml.info/)
* [Select2](https://select2.org/) dropdown plugin with custom configs
* [config](https://github.com/rubyconfig/config) gem for settings (almost all options are available from `config/settings.yml`)
* [Gon](https://github.com/gazay/gon) for easy javascript configurations from controllers
* Sqlite3 as database
* Procfile support, using [foreman](https://github.com/ddollar/foreman) gem (and puma as default server)
* Full localization support (locales split in to separate folders for ease of use)
* [better_errors](https://github.com/BetterErrors/better_errors) and [pry](https://github.com/pry/pry) for easy debugging
* Custom DateTime formations (check `config/initializers/custom/datetime_formats.rb`)
* [Rspec](https://rspec.info/) + [SimpleCov](https://github.com/simplecov-ruby/simplecov) Coverage
* Bootsnap removed
