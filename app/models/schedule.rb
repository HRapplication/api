class Schedule < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :work_date, :start_hour, :end_hour, :user_id
  validates_inclusion_of :is_weekend, :in => [true, false]
end
