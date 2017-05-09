class Event < ActiveRecord::Base
  belongs_to :user
  has_one :events_content, dependent: :destroy
  has_many :enlisted_for_events, dependent: :destroy
  accepts_nested_attributes_for :events_content
end
