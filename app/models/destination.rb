class Destination < ActiveRecord::Base
  scope :current_path, -> { last.path }
end
