class SickLeaveForm < ActiveRecord::Base
  belongs_to :employee
  enum care_type: [:self, :child]
end
