class EnlistedForEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :employee

end
