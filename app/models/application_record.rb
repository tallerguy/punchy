class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  DATE_FORMAT = "%b %d, %Y %I:%M %p"
end
