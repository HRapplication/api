class EnlistedForEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :employee

  validates_presence_of :event_id, :employee_id
end
