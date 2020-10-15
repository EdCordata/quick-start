class ApplicationRecord < ActiveRecord::Base
  extend Enumerize

  include AASM

  self.abstract_class = true
end
