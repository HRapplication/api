class Employee < ActiveRecord::Base
  has_one :user, foreign_key: 'employee_id'
  belongs_to :supervisor, class_name: 'User'
  has_many :business_trip_forms, dependent: :destroy
  has_many :holiday_forms, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :homeoffice_forms, dependent: :destroy
  has_many :sick_leaves_forms, dependent: :destroy
  has_many :enlisted_for_events, dependent: :destroy
end
