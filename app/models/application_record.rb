class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  DATE_FORMAT = "%d/%b/%Y %H:%M:%S"
end
