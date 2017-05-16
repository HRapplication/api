class EventsContent < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :content, :event_id
end
